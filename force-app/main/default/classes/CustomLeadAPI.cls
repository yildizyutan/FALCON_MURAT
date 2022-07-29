@RestResource(urlMapping = '/LeadCustom/*')     
global class CustomLeadAPI {
    @HttpGet
    global static Lead getLeadId(){
        System.debug('custom lead api call success.');

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
        // below lines to convert ID variable type from Integer to string.
        String leadID = uri.substring(idStartIndex);
        System.debug('ContactID: '+leadID);

        // simdide 
        Lead l = [SELECT firstname, company, status, lastname FROM Lead WHERE id=:leadID];
        System.debug(l);
        return l;
    }

    
    // asagidaki method ile disardaki bir sistemden bizim org da yeni bir contact olusturmasina izin veriyoruz ve onun icin hazirlik yapiyoruz. external system POSTMAN oluyor burada.

    @HttpPost
    global static String createLead(
        string fName, string lName, string company, string status
    ){

        //Asagidaki degiskenler ,yukarida parantesin icindeki parameter lar, aynen POSTMAN de key olarak yazilmali ve karsisina degrleri JSON formati ile yazilmali. POSTMAN de POST metodu ile bir body olusturarak send yapiliyor ve donen tek sey c.id olacak.

        Lead l = new Lead();
        l.FirstName = fName;
        l.LastName = lName;
        l.company = company;
        l.status = status;
        

        insert l;
        // asagida return yaptigimiz deger bizden kim bu istegi yaparsa ona gonderilecek degeri icermekte.
        //return l.id;
        return 'Lead with id: '+l.id + 'created';
    } 


    
    @HttpDelete
    global static string deleteLead(){
        System.debug('custom Lead api call success.');

        // GET URI
        RestRequest request = RestContext.request;
        string uri = request.requestURI;
        system.debug('URI : '+request.requestURI);

        //Fetch contact ID from URI
        Integer idStartIndex = uri.lastIndexOf('/')+1;
        System.debug('idStartIndex: '+idStartIndex);

        String leadId = uri.substring(idStartIndex);
        System.debug('contactId: '+leadId);

        Lead l = new Lead();
        l.id = leadId;

        delete l;
        return 'Lead deleted with id: '+leadId;
    }
    
    @HttpPatch
    global static string updateLead(String company, String status){
        System.debug('custom lead api call success.');

        // GET URI
        RestRequest request = RestContext.request;
        string uri = request.requestURI;
        system.debug('URI : '+request.requestURI);

        //Fetch contact ID from URI
        Integer idStartIndex = uri.lastIndexOf('/')+1;
        System.debug('idStartIndex: '+idStartIndex);

        String leadId = uri.substring(idStartIndex);
        System.debug('contactId: '+leadId);

        Lead l = new Lead();
        l.id = leadId;
        l.Company = company;
        l.Status = status;
        

        update l;
        return 'Lead with id: '+leadId + 'updated for status and company';
    }


    /*
    @HttpPut   //upsert yapmak istedigimizde.
    global static String upsertContact(Lead l){
        String returnString;
        if(l.id == null){
            returnString = 'Lead created with id:';
        }else{
            returnString = 'Contact updated with id:';
        }

        upsert l;
        return returnString + l.id;
    }
     */
    //@HttpPut methodu sadece bir kez kullanilabilir. dolayisi ile yukaridaki code comented out.
    
    
    @HttpPut   //bir listeyi upsert yapmak istedigimizde.
    global static List<id> upsertContact(List<Lead> listL){
        
        
        upsert listL;

        //Asagidaki kod ile sadece islem yapilan contactlara ait ID leri bulup return yapiyoruz ki karsi tarafta bulunan kisi hangi ID ler ile/icin kayit yapildigini bilsin.

        list<id> ids =  new list<id>();
        for(Lead l: listL){
            ids.add(l.id);
        }
        return ids;
    }

}