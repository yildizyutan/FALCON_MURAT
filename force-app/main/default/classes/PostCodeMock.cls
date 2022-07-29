@istest
public class PostCodeMock implements HttpCalloutMock{
    public HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"post code": "33162", "country": "United States", "country abbreviation": "US", "places": [{"place name": "Miami", "longitude": "-80.183", "state": "Florida", "state abbreviation": "FL", "latitude": "25.9286"}]}');
        response.setStatusCode(200);
        return response;
    }
}
