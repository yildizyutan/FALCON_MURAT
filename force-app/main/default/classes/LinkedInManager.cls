public class LinkedInManager {
    public Boolean icCode { get; set;}
    public String authCodeFromURL {get; set;}
    public List<LinkedIn_Data__c> linkedInInfoList {get; set;}
    public String BasicInfo {get; set;}
    public String urlToSharedPost {get; set;}
    public String sharedInformation {get; set;}

    public Final String consumerKey = '************';//Your Client Id here
    public Final String consumerSecret = '***********'; // Your Client Secret here
    public Final String redirect_URL = 'http://deblightning12-dev-ed--c.visualforce.com/apex/LinkedinPage';//VF page preview URL
    public String LinkedIn_Scope = 'r_fullprofile%20r_emailaddress';
    public Final String LinkedIn_AuthUrl = 'https://www.linkedin.com/oauth/v2/authorization';
    public Final String accessToken_EndPoint = 'https://www.linkedin.com/oauth/v2/accessToken';

    public LinkedInManager(){
        authCodeFromURL = ApexPages.currentPage().getParameters().get('code');
        if(authCodeFromURL == null || authCodeFromURL == ''){
            isCode =true;
        }else{
            isCode = false;
        }
        linkediInInfoList = [SELECT Id, Name, Access_Token__c, Expires_In_Seconds__c FROM LinkedIn_Data__c WHERE Name = 'LinkedInInfo'];          
    }
    public PageReference doGetAuthorizationCode(){
        String requestoAuthURL = linedIn_AuthUrl + 'response_type = code&client_id = '+consumerKey+' &redirect_uri='+redirect_URI+'&state=12345567dggd&scope=r_liteprofile%20r_emailaddress%20w_member_social%20w_member_social';
        PageReferance pageRef = new PageReferance(requestoAuthURL);
        return pageRef;
    }
    public void doGetAccessToken(){
        Http http = new Http();
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();

        String requestTokenBody = 'code='+authCodeFromURL+'&grant_type = authorization_code'+'&client_id='+consumerKey+'&client_secret='+consumerSecret+'&redirect_uri='+redirect_URI;
        String errorMessage = '';

        System.debug('#### authCodeFromURL '+authCodeFromURL);
        System.debug('#### requestTokenBody '+requestTokenBody);

        httpReq.setMethod('POST');
        httpReq.setEndpoint(accessToken_Endpoint);
        httpReq.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        httpReq.setBody(requestTokenBody);

        try {
            httpRes = http.send(httpReq);
            if(httpRes.getStatusCode()== 200){
                Map<String, object> TokenInfo = (Map<String, Object>)JSON.deserializeUntyped(httpRes.getBody());
                LinkedIn_Data__c linkedInInfo = new LinkedIn_Data__c();
                LinkedInInfo.Access_Token__c = String.valueOf(TokenInfo.get('access_token'));
                linkedInInfo.Expires_In_Seconds__c = Double.valueOf(TokenInfo.get('expires_in'));
                linkedInInfo.Name = 'LinkedInInfo';

                if(linkedInInfoList! = null && linkedInInfoList.size()>0){
                    linkedInInfo.Id = linkedInInfoList[0].Id;
                }
                ApexPages.addmessage(newApexPages.message(ApexPages.severity.CONFIRM, 'Congrattzzzz..... You have done successsfull Integration with Linkedin'));
                upsert linkedInInfo;
            }else{
                errorMessage='Unexpected error while communication with Linkedi API'+'Status '+httpRes.getStatus()+'and Status Code'+httpRes.getStatusCode();
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage)); 
            }
        } catch (System.Exception e) {
            System.debug('#### Exception Execute'+e.getStackTraceString()+'   ***   '+e.getMessage());

            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                errorMessage = 'Unauthorize endpoint: An Administer must go to Setup ->Administer -> Security Control ->' +'Remote Site Setting and add'+''+accessToken_EndPoint+'Endpoint';
                ApexPages.addMessage(newApexPages.message(ApexPages.severity.ERROR, errorMessage));
            }else{
                errorMessage = 'Unexpected Error while communicating with LinkedIn API.'+'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatusCode();
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, error, errorMessage));
            }
            
        }

    }
    public void doSharePostOnLinkedIn(){

        String errorMessage = '';

        Http http = new Http();
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();

        List<LinkedIn_Data__c> linkedInInfoListNew = [SELECT Id, Name, Access_Token__c, Expires_In_Second__c FROM LinkedIn_Data__c WHERE Name='LinkedInInfo'];

        httpReq.SetMethod('POST');
        httpReq.setEndpoint('https://api.linkedin.com/v2/ugcPosts');
        httpReq.setHeader('Authorization','Bearer '+linkedInInfoListNew[0].Access_Token__c);
        httpReq.setHeader('Content-Type', 'application/json');
        httpReq.setHeader('X-Restli-Protocol-Version', '2.0.0');
        /* String requestBody = '{'+'"comment":{'+'"content":{'+'"title":"LinkedIn Developers Resources",'+'"description":"Leverage LinkedIn's APIs to maximize engagement",'+'"submitted-url":"https://developer.linkedin.com"'+'},'+'"visibility":{'+'"code":"anyone"'+'}'+'}';*/
        String requestBody = '{'+ 
                            '"author": "urn:li:person:UCyVnvibic",'+
                            '"lifecycleState": "PUBLISHED",'+
                            ' "specificContent": {'+
                            '"com.linkedin.ugc.ShareContent": {'+
                            '"shareCommentary": {'+
                            '"text": "Hello World! This is my first Share on LinkedIn!"'+
                            ' },'+
                            '"shareMediaCategory": "NONE"'+
                            '}'+
                            '},'+
                            '"visibility": {'+
                            '"com.linkedin.ugc.MemberNetworkVisibility": "PUBLIC"'+
                            '}'+
                            '}';

        httpReq.setBody(requestBody);

        try{
        httpRes = http.send(httpReq);
            if(httpRes.getStatusCode() == 200 || httpRes.getStatusCode() == 201){
            sharedInformation = requestBody;
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM, 'Post has been shared successfully!!'));
            Map<String,object> sharedPostInformaionMap = (Map<String,object>)JSON.deserializeUntyped(httpRes.getBody());
            urlToSharedPost = 'https://'+(String)sharedPostInformaionMap.get('updateUrl');
            
            }else{
            errorMessage = 'Unexpected Error while communicating with LinkedIn API. '
            +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));
            }
        }catch(System.Exception e){
        System.debug('#### Exception Excuted '+e.getStackTraceString()+'  '+e.getMessage());
            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
            errorMessage = 'Unauthorize endpoint: An Administer must go to Setup -> Administer -> Security Control ->'
            +' Remote Site Setting and add '+' '+ 'https://api.linkedin.com/ '+' Endpoint';
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));
            }else{
            errorMessage = 'Unexpected Error while communicating with LinkedIn API. '
            +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));
            }
        }
    }
        
}

    


