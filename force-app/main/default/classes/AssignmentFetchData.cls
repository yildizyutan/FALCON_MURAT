public with sharing class AssignmentFetchData {
    public static HttpResponse fetchData() {
        //1. prepare request
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://fakerestapi.azurewebsites.net/api/v1/Activities/');
        request.setMethod('GET');

        //2. prepare http
        Http http = new http();

        //3. send request, receive response
        HttpResponse response = http.send(request);
        system.debug('status ' + response.getStatus());
        system.debug('status code ' + response.getStatusCode());
        //4. process the response
        if (response.getStatusCode() == 200) {
            string activitiesJSON = response.getBody();
            system.debug(activitiesJSON);

            Object ob = JSON.deserializeUntyped(activitiesJSON);
            Map<string, object> results = (Map<string, object>)ob;
            system.debug('results = ' + results);
            List<object> ID = (List<object>) results.get('id');
            system.debug('======object id list START=====');
            for (object eachId : ID) {
                system.debug(eachId);
            }
            system.debug('======object activities list END=====');
        } else {
            system.debug('something went wrong people');
        }
        return response;
    }
}
