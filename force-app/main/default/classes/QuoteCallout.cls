// 1. Use 'https://api.kanye.rest/' end point to fetch the quote and print the quote retrieved from the 
//    callout in the debug message.
// 2. Write the test class for covering the QuoteCalloutClass.
/*
public with sharing class QuoteCallout{
    // there 3 names we need to use after created custom metadata in org, mdt name, api name, field name.
    // custom meta data name _mdt => manage collout infos => name => custom field API name
    private static string GET_QUOTE_ENDPOINT = Quote__mdt.getInstance('Quote_Callout').Quote_Callout__c;
    private static string HTTP_GET = 'GET';
    private static string HTTP_POST = 'POST'; 
    

    public static HttpResponse fetchQuotes() {
        //1. prepare request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(GET_QUOTE_ENDPOINT);
        request.setMethod(HTTP_GET);

        //2. prepare http
        Http http = new http();

        //3. send request, receive response
        HttpResponse response = http.send(request);
        system.debug('status ' + response.getStatus());
        system.debug('status code ' + response.getStatusCode());
        //4. process the response
        
        if (response.getStatusCode() == 200) {
            string quoteJSON = response.getBody();
            system.debug(quoteJSON);

            Map<string, object> results = (Map<string, object>)JSON.deserializeUntyped(quoteJSON);
            system.debug('results = ' + results.get('quote'));
              
        } else {
                system.debug('something went wrong people');
        }   
         return response;   
    }
} */

//Burada asagidaki ornek assignment session da hazirlandi ve end point ORG da set yapilmadi.

public with sharing class QuoteCallout {
    //Getting end point data from Custom Meta data Type
    private static string QUOTES_ENDPOINT = Quote__mdt.getInstance('Quote_Callout').Quote_Callout__c;
    //Responsible for doing the callout for getting the fresh quote
    public static string makeGetCallout() {
        String quote;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(QUOTES_ENDPOINT);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        //If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, String> results = (Map<String, String>) JSON.deserialize(response.getBody(), Map<String, String>.class);
            quote = String.valueOf(results.get('quote'));
        } else {
            System.debug('Something Went Wrong!!!');
            quote = null;
        }
        return quote;
    }
}
