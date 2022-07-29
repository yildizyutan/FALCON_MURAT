public with sharing class ContactCalloutForAssighnmentFlow_2 {
    @future(callout=true)
    public static void sendDataGo(List<Id> contactIds)
{
    //get the date and prepare json
    List<Contact> con = [SELECT Name, Email, Gender__c, Status__c FROM Contact WHERE Id = : contactIds[0]];
    UserInfo info = new UserInfo();
    //populate info with the details from SOQL
    info.email=con[0].Email;
    info.gender=con[0].Gender__c;
    info.name=con[0].Name;
    info.status=con[0].Status__c;
    
    String jsonString = JSON.serialize(info);
    System.debug(jsonString);
    //prepare request
    String endpoint = 'https://gorest.co.in/public/v2/users';
    String token = '70e1f461fd475135683473e734663791d988ca49336b3a1002405be2ff00ed29';
    HttpRequest request = new HttpRequest();
    //set end point, http method and request body
    request.setEndpoint(endpoint);
    request.setMethod('POST');
    request.setBody(jsonString);
    request.setHeader('Content-Type', 'application/json; charset=utf-8');
    request.setHeader('Authorization', 'Bearer '+token);
    Http http = new Http();
    HttpResponse response = http.send(request);
    System.debug('Status Code'+ response.getStatusCode());
    System.debug('response'+ response.getBody());
    //create a log => It can be info in case of success, error in case of erropr
    if (response.getStatusCode()==201 ) {
        System.debug('Success message');

        GoRestErrorHandling.createLog( 'Success', response.getBody());
    }else{
        System.debug('Error');
        GoRestErrorHandling.createLog( 'Error', response.getBody());
    }
}

}


/*
public with sharing class ContactCalloutForAssighnmentFlow {
    @future(callout=true)
    public static void sendDataGo(List<Id> contactIds)
{
    //get the date and prepare json
    List<Contact> con = [SELECT Name, Email, Gender__c, Status__c FROM Contact WHERE Id = : contactIds[0]];
    UserInfo info = new UserInfo();
    //populate info with the details from SOQL
    info.email=con[0].Email;
    info.gender=con[0].Gender__c;
    info.name=con[0].Name;
    info.status=con[0].Status__c;
    
    String jsonString = JSON.serialize(info);
    System.debug(jsonString);
    //prepare request
    String endpoint = 'https://gorest.co.in/public/v2/users';
    String token = '70e1f461fd475135683473e734663791d988ca49336b3a1002405be2ff00ed29';
    HttpRequest request = new HttpRequest();
    //set end point, http method and request body
    request.setEndpoint(endpoint);
    request.setMethod('POST');
    request.setBody(jsonString);
    request.setHeader('Content-Type', 'application/json; charset=utf-8');
    request.setHeader('Authorization', 'Bearer '+token);
    Http http = new Http();
    HttpResponse response = http.send(request);
    //create a log => It can be info in case of success, error in case of erropr
    if (response.getStatusCode()==201 ) {
        System.debug('Success message');
    }else{
        System.debug('Error');
    }
}
}
*/