
public with sharing class DummyPostCallout {
    
    // Asagidaki uc satir Custom Metadata ile dinamik hale getirebilmek icin yazildi. 'GET' ve 'POST' icin URL ler ORG da Custom Metadata altindaki Endpoint__c field in icine eklendi. biz burada bir instance olusturduk ve boylece ORG dan buraya gelmeden ve hic kod ile ugrasmadan endpoint adresi degisebilir.
    private static string GET_DUMMYPOST_ENDPOINT = CalloutInfo__mdt.getInstance('GET_DUMMYPOST').Endpoint__c;
    private static string HTTP_GET = 'GET';
    private static string HTTP_POST = 'POST';
    // Yukaridaki instance lar asagidaki kod yaziminda kullaniyoruz ve yazdigimiz kodu dinamik hale getiriyoruz.

    public static void postCallout() {
        //1. create request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(GET_DUMMYPOST_ENDPOINT);
        request.setMethod(HTTP_GET);

        //2. prepare http
        http http = new http();

        //3. send request, get response
        HttpResponse response = http.send(request);

        system.debug(response);
        if(response.getStatusCode() == 200){
            system.debug(response.getBody());
        } else {
            system.debug(response.getStatus());
        }
    }
}


//7. adim

public with sharing class DummyPostCallout {
    // ilk once karsi tarafin gonderecegi bilgileri inceliyoruz ve bize gelen bilgiye gore hazirlik yapiyoruz.
    // Asagidaki uc satir Custom Metadata ile dinamik hale getirebilmek icin yazildi. 'GET' ve 'POST' icin URL ler ORG da Custom Metadata altindaki Endpoint__c field in icine eklendi. biz burada bir instance olusturduk ve boylece ORG dan buraya gelmeden ve hic kod ile ugrasmadan endpoint adresi degisebilir. 
    private static string GET_DUMMYPOST_ENDPOINT = CalloutInfo__mdt.getInstance('GET_DUMMYPOST').Endpoint__c;
    private static string HTTP_GET = 'GET';
    private static string HTTP_POST = 'POST';

    public static void postCallout() {
        //1. create request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(GET_DUMMYPOST_ENDPOINT);
        request.setMethod(HTTP_GET);

        //2. prepare http
        http http = new http();

        //3. send request, get response
        HttpResponse response = http.send(request);

        system.debug(response);
        if(response.getStatusCode() == 200){
            system.debug(response.getBody());
            
            // WRAPPER ile yazilmis satir, wrapper bizin icin bir yapi insa ediyor. neden insa ediyoruz, cunku deserialize methodunda wrapper class olmadan birden fazla degisken kullanamiyoruz. wrapper class i ile birden fazla degiskeni sistemimizde taninir ve gorunur hale getirdik.
            DummyPostResponseWrapper dummywrapper = (DummyPostResponseWrapper)JSON.deserialize(response.getBody(), DummyPostResponseWrapper.class);
            // Yukaridaki satirda 'DummyPostResponseWrapper' adinda bi klasimiz var ve bu klas icinde data type lari belirlenmis. 
            // Bize disardan gelen data 1 den fazla data type iceriyorsa wrapper class i gelen bu datalari karsilayabilmek icin kullaniyoruz.

            system.debug('dummy wrapper = '+dummywrapper);
        } else {
            system.debug(response.getStatus());
        }
    }
}

//WRAPPER KULLANILARAK YAPILAN YONTEM, EN EN ONEMLISII,
// Bu sekilde gelen bilgileri ORG a insert ediyoruz. wrapper class gelen bilgileri insert e hazirlamak icin gerekli.

public with sharing class DummyPostCallout {
    private static string GET_DUMMYPOST_ENDPOINT = CalloutInfo__mdt.getInstance('GET_DUMMYPOST').Endpoint__c;
    private static string HTTP_GET = 'GET';
    private static string HTTP_POST = 'POST';

    public static void postCallout() {
        //1. create request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(GET_DUMMYPOST_ENDPOINT);
        request.setMethod(HTTP_GET);

        //2. prepare http
        http http = new http();

        //3. send request, get response
        HttpResponse response = http.send(request);

        system.debug(response);
        if(response.getStatusCode() == 200){
            system.debug(response.getBody());

            DummyPostResponseWrapper dummywrapper = (DummyPostResponseWrapper)JSON.deserialize(response.getBody(), DummyPostResponseWrapper.class);
            system.debug('dummy wrapper = '+dummywrapper);
            //List<post__c> 
            system.debug('dummywrapper.posts = ' + dummywrapper.posts);
            //Asagidaki liste yardimi ile for-each loop icinde hazirlanmis bilgi depolaniyor ve org a insert ediliyor.
            List<post__c> listPosts = new list<post__c>();
            //Asagidaki liste ile Wrapper class yardimi ile gelen bilgi liste icine aliniyor ve for-each loop yardimi ile insert veya update e hazir hale geliyor.
            List<DummyPostResponseWrapper.Cls_Post> listClsPost = dummywrapper.posts;
            for (DummyPostResponseWrapper.Cls_Post dpost : listClsPost) {
                post__c p = new post__c();
                p.id__c = dpost.id;
                p.title__c = dpost.title;
                p.body__c = dpost.body;
                listPosts.add(p);
            }
            //Database.insert(listPosts, false);
            insert listPosts;

            // if (External) ID is found ----> Update
            // if (External) ID is NOT found ----> Insert
            // insert + update
            //  ****  upsert listPosts;  ****
            
            //for each loop on list<post> from wrapper class
                //Post__c p = new post__c();
                //map all fields of wrapper post to post__c object fields
                //add in list<post__c>
            //database.insert(list of post__c);
        } else {
            system.debug(response.getStatus());
        }
    }
}