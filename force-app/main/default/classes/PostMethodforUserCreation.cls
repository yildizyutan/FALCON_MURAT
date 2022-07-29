public with sharing class PostMethodforUserCreation {
    public static HttpResponse postMethodUserCreation() {
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://fakerestapi.azurewebsites.net/api/v1/Activities');
        request.setMethod('POST');
        String JSONReq = '{"id":45,"title":"Activity 0","dueDate":"2022-06-16T00:45:56.445309+00:00","completed":false}';
        request.setBody(JSONReq);
        request.setHeader('Content-Type', 'application/json');
        
        Http myHttp = new Http();
        
        HttpResponse response = myHttp.send(request);
            System.debug('Status; '+response.getStatus());
            System.debug('Status Code; '+response.getStatusCode());

        if (response.getStatusCode() == 200) {
            String usersJSON = response.getBody();
            Map<String,Object> results = (Map<String,Object>)JSON.deserializeUntyped(usersJSON);
            Object obName = results.get('name');
            List<Object> listName =(List<Object>) obName;
                for (Object eachName : listName) {
                    System.debug(eachName);
                }
        }else{
            System.debug('It is time to check you your code...');
        }
        return response;
    }
}
