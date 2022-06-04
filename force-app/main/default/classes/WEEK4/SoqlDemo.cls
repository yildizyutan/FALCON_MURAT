public with sharing class SoqlDemo {
    public Static void accountSOQL_1() {

        // SOQL Query allways return as a LIST<Object>
        List<Account> listAcc = [ SELECT id, name, phone FROM Account WHERE phone LIKE 'A%'];
            System.debug('The list for contacts starting with \'a\' is; '+ listAcc);
            System.debug(listAcc.size());

        Account acc = [SELECT name,id FROM Account ORDER BY CreatedDate DESC LIMIT 1 ];

        System.debug(acc);

    }

    public static void accountSOQL_2(){

        Account acc1 = [SELECT name,id,phone FROM Account ORDER BY CreatedDate DESC LIMIT 1];
            System.debug('The latest account created is; '+ acc1);

        String acc1Name = acc1.Name;
        String acc1Phone = acc1.Phone;
        Id acc1Id = acc1.Id;

        System.debug('The name for account is; '+ acc1.Name+', The ID for account is; ' + acc1Id+', and the phone number for account is; ' + acc1Phone);

    }

    public static void accountSOQL_3(){

        List<Account> listAcc = [SELECT name, id, phone, accountnumber FROM Account ORDER BY CreatedDate DESC ];

            System.debug('the account list is; '+listAcc );

        for (Account eachAccount : listAcc) {
            
            String accName = eachAccount.Name;
            String accPhone = eachAccount.Phone;
            
                System.debug('the Name for account is; '+accName);
                System.debug('the phone number for account is; '+accPhone);
                
            //String accSC = eachAccount.ShippingCity;
                //System.debug('the shipping city is; '+accSC);

        }
    }   

    Public Static void accountSOQL_Filter1(){

        String accNameFilter = 'Salesforce Inc.';

        List<Account> listAcc = [SELECT name, id FROM Account WHERE name = :accNameFilter];

    }

    public static void accountSOQL_Filter2(String accNameFilter){

        List<Account> listAcc = [SELECT id, name FROM Account WHERE name = :accNameFilter];

    }

    
}
