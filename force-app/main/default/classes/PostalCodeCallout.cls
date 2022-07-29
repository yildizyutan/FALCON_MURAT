/*
3. Use "https://api.zippopotam.us/us/33162" to verify the postal code. In the given Url 33162 is 
the postal code which will be passed as a parameter to the callout method.  
Print the details fetched from the callout if the postal code is valid otherwise print 'Postal code is 
not valid' in debug message. 
Please store the end point in the custom meta data type and use it for setting the end point 
during the callout.
*/
public with sharing class PostalCodeCallout{
    // there 3 names we need to use after created custom metadata in org, mdt name, api name, field name.
    // custom meta data name _mdt => manage collout infos => name => custom field API name
    private static string GET_POSTALCODE_ENDPOINT = Postal_Code__mdt.getInstance('Postal_Code').URL_for_Postal_Code__c;
    private static string HTTP_GET = 'GET';
    private static string HTTP_POST = 'POST'; 
    
    public static HttpResponse fetchPostalCode(String postalCode) {
        //1. prepare request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(GET_POSTALCODE_ENDPOINT +postalCode);

        request.setMethod(HTTP_GET);
        System.debug(GET_POSTALCODE_ENDPOINT);

        //2. prepare http
        Http http = new http();

        //3. send request, receive response
        HttpResponse response = http.send(request);
        system.debug('status ' + response.getStatus());
        system.debug('status code ' + response.getStatusCode());
        //4. process the response
        
        if (response.getStatusCode() == 200  ) {
            //string postalCodeJSON = response.getBody();
            //system.debug(postalCodeJSON);
            System.debug(response.getBody());
     
        } else {
                system.debug('Postal Code is not valid');
        }   
         return response;   
    }
}
