public with sharing class PopulationCallout {
    public static HttpResponse fetchPopulation() {
        //1.Prepare request;
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://datausa.io/api/data?drilldowns=Nation&measures=Population');
        request.setMethod('GET');
        // Endpoint is added in Remote Sites List to authorize in our Org.
        //2. Prepare Http
        Http myHttp = new Http();
        //3. Send request, receive response
        HttpResponse response = myHttp.send(request);

        System.debug('Status '+ response.getStatus());
        System.debug('Status Code ;'+ response.getStatusCode());

        //4. Process the response
        if (response.getStatusCode() == 200) {
            // WRAPPER CLASS ile yapilan cozum;
            PopulationWrapper populationResponse = (PopulationWrapper)JSON.deserialize(response.getBody(), PopulationWrapper.class);

            System.debug('======STRING population list START ======');
            List<String> listPopulations = populationResponse.data;

            for (String eachP : listPopulations) {
                System.debug(eachP);
            }
            System.debug('=====STRING population list END ====');
            
            /* 
            // WRAPPER KULLANMADAN YAPILAN COZUM.
            Burada asagidaki code bir string karsiliyor ancak type i bilmiyorsak bu yontemi kullaniriz. eger type i biliyorsak direk olarak bir wrapper class yardimi ile liste olarak karsilamamiz gerekir yukaridaki gibi.
            
            String populationJSON = response.getBody();
            System.debug(populationJSON);

            Map<String, Object> results = (Map<String,Object>)JSON.deserializeUntyped(populationJSON);
            System.debug('results = '+ results);
            */
        } else {
            System.debug('Somethig is wrong');
        }
        return response;
    }
}
