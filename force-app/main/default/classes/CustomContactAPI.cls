// Burada ilk once bu class olusturuluyor ve daha sonra Postman den herhangibir contact cagrilabiliyor. 
//Bu class deploy ediliyor ve daha sonra POSTMAN den veya eger baska bir sisteme kapi acildi ise oradan gonderilen callout a cevap bu class sayesinde gidiyor.

// asagidaki satir bir annotation ve parantez icindeki ContactCustom ifadesi POSTMAN de url adresi icinde kullaniliyor.
@RestResource(urlMapping = '/ContactCustom/*')     
global class CustomContactAPI {
    @HttpGet
    global static Contact getContactId(){
        System.debug('custom contact api call success.');

        //bir sonraki iki satir  sayfa 12/19 dan alinarak ayni kod gelistiriliyor.
        RestRequest request = RestContext.request;
        System.debug('URI: '+ request.requestURI);
        // yukaridaki iki satir ile debug mesajinda URI a ulasmis oluyoruz.
        // ORG un console unda mesaji almak icin POSTMAN den GET metodu ile ORG dan aldigimiz bir ID kullanarak bir contact cagiriyoruz. ve bize URI olarak bu class uzerinden debug ekranina cikti aliyoruz.
        
        // burada asagida yazilan code ile debug olarak  /CustomContact/ 'ID' , almamiz gerek ve /CustomContact/ kismini ID den ayirmak icin substring methodunu kullaniyoruz.
        String uri = request.requestURI;
        System.debug('URI: '+ uri);

        Integer idStartIndex = uri.lastIndexOf('/')+1;
        System.debug('idStartIndex: '+idStartIndex);

        String contactID = uri.substring(idStartIndex);
        System.debug('ContactID: '+contactID);

        // simdide 
        Contact c = [SELECT name, email, phone, account.name FROM Contact WHERE id=:contactID];
        System.debug(c);
        return c;
    }

    // asagidaki method ile disardaki bir sistemden bizim org da yeni bir contact olusturmasina izin veriyoruz ve onun icin hazirlik yapiyoruz. external system POSTMAN oluyor burada.

    @HttpPost
    global static Id createContact(
        string fName, string lName, string emailId, string phoneNumber, string accountId
    ){

        //Asagidaki degiskenler ,yukarida parantesin icindeki parameter lar, aynen POSTMAN de key olarak yazilmali ve karsisina degrleri JSON formati ile yazilmali. POSTMAN de POST metodu ile bir body olusturarak send yapiliyor ve donen tek sey c.id olacak.

        Contact c = new contact();
        c.FirstName = fName;
        c.LastName = lName;
        c.Email = emailId;
        c.Phone = phoneNumber;
        c.AccountId = accountId;

        insert c;
        // asagida return yaptigimiz deger bizden kim bu istegi yaparsa ona gonderilecek degeri icermekte.
        return c.id;
    } 

    @HttpDelete
    global static string deleteContact(){
        System.debug('custom contact api call success.');

        // GET URI
        RestRequest request = RestContext.request;
        string uri = request.requestURI;
        system.debug('URI : '+request.requestURI);

        //Fetch contact ID from URI
        Integer idStartIndex = uri.lastIndexOf('/')+1;
        System.debug('idStartIndex: '+idStartIndex);

        String contactId = uri.substring(idStartIndex);
        System.debug('contactId: '+contactId);

        Contact c = new Contact();
        c.id = contactId;

        delete c;
        return 'Contact delete with id: '+contactId;
    }

    @HttpPatch
    global static string updateContact(String emailId, String phoneNumber){
        System.debug('custom contact api call success.');

        // GET URI
        RestRequest request = RestContext.request;
        string uri = request.requestURI;
        system.debug('URI : '+request.requestURI);

        //Fetch contact ID from URI
        Integer idStartIndex = uri.lastIndexOf('/')+1;
        System.debug('idStartIndex: '+idStartIndex);

        String contactId = uri.substring(idStartIndex);
        System.debug('contactId: '+contactId);

        Contact c = new Contact();
        c.id = contactId;
        c.Phone = phoneNumber;

        update c;
        return 'Contact with id: '+contactId + 'updated';
    }


    /*
    @HttpPut   //upsert yapmak istedigimizde.
    global static String upsertContact(Contact con){
        String returnString;
        if(con.id == null){
            returnString = 'Contact created with id:';
        }else{
            returnString = 'Contact update with id:';
        }

        upsert con;
        return returnString + con.id;
    }
     
    //@HttpPut methodu sadece bir kez kullanilabilir. dolayisi ile yukaridaki code comented out.
    */

    @HttpPut   //bir listeyi upsert yapmak istedigimizde.
    global static List<id> upsertContact(List<Contact> listCon){
        
        
        upsert listCon;

        //Asagidaki kod ile sadece islem yapilan contactlara ait ID leri bulup return yapiyoruz ki karsi tarafta bulunan kisi hangi ID ler ile/icin kayit yapildigini bilsin.

        list<id> ids =  new list<id>();
        for(contact con: listCon){
            ids.add(con.id);
        }
        return ids;
    }
}
