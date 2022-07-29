public with sharing class AnimalsCallouts {
    
    // VITAP DERS NOTU 
    // PART 1
    //public with sharing class AnimalsCallouts {
        public static void fetchAnimals() {
            //1. prepare request
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
            request.setMethod('GET');
    
            //2. prepare http
            Http http = new http();
    
            //3. send request, receive response
            HttpResponse response = http.send(request);
            system.debug('status ' + response.getStatus());
            system.debug('status code ' + response.getStatusCode());
            //4. process the response
            if (response.getStatusCode() == 200) {
                string animalsJSON = response.getBody();
                system.debug(animalsJSON);
            } else {
                system.debug('something went wrong people');
            }
        }
    //} 
    
    // PART 2
    // Yukaridaki method un baska bir versiyonu.
    //public with sharing class AnimalsCallouts {
        public static void fetchAnimals() {
            //1. prepare request
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
            request.setMethod('GET');
    
            //2. prepare http
            Http http = new http();
    
            //3. send request, receive response
            HttpResponse response = http.send(request);
            system.debug('status ' + response.getStatus());
            system.debug('status code ' + response.getStatusCode());
            //4. process the response
            if (response.getStatusCode() == 200) {
                string animalsJSON = response.getBody();
                system.debug(animalsJSON);
    
                Object ob = JSON.deserializeUntyped(animalsJSON);
                Map<string, object> results = (Map<string, object>)ob;
                system.debug('results = ' + results);
                List<object> animals = (List<object>) results.get('animals');
                system.debug('======object animals list START=====');
                for (object a : animals) {
                    system.debug(a);
                }
                system.debug('======object animals list END=====');
            } else {
                system.debug('something went wrong people');
            }
        }
    //}
        
    // PART 3

    //public with sharing class AnimalsCallouts {
        public static void fetchAnimals() {
            //1. prepare request
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
            request.setMethod('GET');
    
            //2. prepare http
            Http http = new http();
    
            //3. send request, receive response
            HttpResponse response = http.send(request);
            system.debug('status ' + response.getStatus());
            system.debug('status code ' + response.getStatusCode());
            //4. process the response
            if (response.getStatusCode() == 200) {
                string animalsJSON = response.getBody();
                system.debug(animalsJSON);
    
                //Object ob = JSON.deserializeUntyped(animalsJSON);
                //Map<string, object> results = (Map<string, object>)ob;
    
                Map<string, object> results = (Map<string, object>)JSON.deserializeUntyped(animalsJSON);
                system.debug('results = ' + results);
    
                Object ob1 = results.get('animals');
                List<object> animals = (List<object>) ob1;
                system.debug('======object animals list START=====');
                for (object a : animals) {
                    system.debug(a);
                }
                system.debug('======object animals list END=====');
            } else {
                system.debug('something went wrong people');
            }
        }
        //PART 3-2
        public static HttpResponse fetchAnimals2() {
            //1. prepare request
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
            request.setMethod('GET');
    
            //2. prepare http
            Http http = new http();
    
            //3. send request, receive response
            HttpResponse response = http.send(request);
            system.debug('status ' + response.getStatus());
            system.debug('status code ' + response.getStatusCode());
            //4. process the response
            if (response.getStatusCode() == 200) {
                AnimalsCalloutResponse animalResponse = 
                    (AnimalsCalloutResponse)JSON.deserialize(response.getBody(), AnimalsCalloutResponse.class);
                system.debug('====STRING animals list START ======');
                list<string> allAnimals = animalResponse.animals;
                for (string a : allAnimals) {
                    system.debug(a);
                }
                system.debug('====STRING animals list END ======');
    
            } else {
                system.debug('something went wrong people');
            }
            return response;
        }
    //}

    // PART 4
    // PostAnimals Method

    public static HttpResponse postAnimal() {
        //1. prepare request
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        string jsonReq = '{"name":"fluffykins"}';
        request.setBody(jsonReq);
        request.setHeader('Content-Type', 'application/json');

        //2. prepare http
        Http http = new http();

        //3. send request, receive response
        HttpResponse response = http.send(request);
        system.debug('status ' + response.getStatus());
        system.debug('status code ' + response.getStatusCode());
        //4. process the response
        if (response.getStatusCode() == 201) {
            system.debug('response ' + response.getBody());
            AnimalsCalloutResponse animalResponse = 
                (AnimalsCalloutResponse)JSON.deserialize(response.getBody(), AnimalsCalloutResponse.class);
            system.debug('====STRING animals list START ======');
            list<string> allAnimals = animalResponse.animals;
            for (string a : allAnimals) {
                system.debug(a);
            }
            system.debug('====STRING animals list END ======');

        } else {
            string result = 'failed';
            system.debug('something went wrong people');
        }

        return response;
    }

    // Buraya kadar.

    public static void fetchAnimals() {
        //1. prepare request
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');

        //2. prepare http
        Http http = new http();

        //3. send request, receive response
        HttpResponse response = http.send(request);
        system.debug('status ' + response.getStatus());
        system.debug('status code ' + response.getStatusCode());
        //4. process the response
        if (response.getStatusCode() == 200) {
            string animalsJSON = response.getBody();
            system.debug(animalsJSON);

            //Object ob = JSON.deserializeUntyped(animalsJSON);
            //Map<string, object> results = (Map<string, object>)ob;

            Map<string, object> results = (Map<string, object>)JSON.deserializeUntyped(animalsJSON);
            system.debug('results = ' + results);

            Object ob1 = results.get('animals');
            List<object> animals = (List<object>) ob1;
            system.debug('======object animals list START=====');
            for (object a : animals) {
                system.debug(a);
            }
            system.debug('======object animals list END=====');
        } else {
            system.debug('something went wrong people');
        }
    }

    public static HttpResponse fetchAnimals2() {
        //1. prepare request
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');

        //2. prepare http
        Http http = new http();

        //3. send request, receive response
        HttpResponse response = http.send(request);
        system.debug('status ' + response.getStatus());
        system.debug('status code ' + response.getStatusCode());
        //4. process the response
        if (response.getStatusCode() == 200) {
            AnimalsCalloutResponse animalResponse = 
                (AnimalsCalloutResponse)JSON.deserialize(response.getBody(), AnimalsCalloutResponse.class);
            system.debug('====STRING animals list START ======');
            list<string> allAnimals = animalResponse.animals;
            for (string a : allAnimals) {
                system.debug(a);
            }
            system.debug('====STRING animals list END ======');

        } else {
            system.debug('something went wrong people');
        }

        return response;
    }

    public static HttpResponse postAnimal() {
        //1. prepare request
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        string jsonReq = '{"name":"fluffykins"}';
        request.setBody(jsonReq);
        request.setHeader('Content-Type', 'application/json');

        //2. prepare http
        Http http = new http();

        //3. send request, receive response
        HttpResponse response = http.send(request);
        system.debug('status ' + response.getStatus());
        system.debug('status code ' + response.getStatusCode());
        //4. process the response
        if (response.getStatusCode() == 201) {
            system.debug('response ' + response.getBody());
            AnimalsCalloutResponse animalResponse = 
                (AnimalsCalloutResponse)JSON.deserialize(response.getBody(), AnimalsCalloutResponse.class);
            system.debug('====STRING animals list START ======');
            list<string> allAnimals = animalResponse.animals;
            for (string a : allAnimals) {
                system.debug(a);
            }
            system.debug('====STRING animals list END ======');

        } else {
            string result = 'failed';
            system.debug('something went wrong people');
        }
        return response;
    }
    
}
