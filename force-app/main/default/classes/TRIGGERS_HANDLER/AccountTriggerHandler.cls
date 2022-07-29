public with sharing class AccountTriggerHandler {
    public static void getKanyeQuote(List<Account> newList, Map<Id,Account> oldMap){
        //In this method we will identify all the account Ids 
        //for which quote needs to be updated
        Set<Id> accIdsSet = new Set<Id>();
        if(oldMap != null){
            //This will run when the record is updated
            for(Account acc : newList){
                Account oldRec = oldMap.get(acc.Id);
                if(oldRec.GetKanyeQuote__c != acc.GetKanyeQuote__c && acc.GetKanyeQuote__c){
                    accIdsSet.add(acc.Id);
                }
            }
        } else {
            //This will run when new record is created
            for(Account acc : newList){
                if(acc.GetKanyeQuote__c){
                    accIdsSet.add(acc.Id);
                }
            }
        }
        if(!accIdsSet.isEmpty()){
            updateKanyeQuote(accIdsSet);
        }
    }
    @future(callout=true)
    public static void updateKanyeQuote(Set<Id> accIdsSet){
        String quote = QuoteCallout.makeGetCallout();
        List<Account> accList = new List<Account>();
        for(Id accId : accIdsSet){
            Account acc = new Account();
            acc.Id = accId;
            acc.Kanye_Quote__c = quote;
            acc.GetKanyeQuote__c = false;
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            Update accList;
        }
    }
}



/*
//TEST FOR TRIGGERS START
public class AccountTriggerHandler {
    public static void updateAccountDescription(List<account> accTriggerNew,
                                                List<account> accTriggerOld,
                                                Map<id, account> accTriggerNewMap,
                                                Map<id, account> accTriggerOldMap){
        system.debug('inside handler method');
         for(account eachAcc: accTriggerNew){
            boolean updateDesc = false;
            if(accTriggerOldMap == null && eachAcc.Active__c == 'Yes'){
                updateDesc = true;
            }
            if(accTriggerOldMap != null){
                Account oldAccount = accTriggerOldMap.get(eachAcc.ID);
                
                string oldAccountActive = oldAccount.Active__c;
                //check if active is updated
                //active is changed to 'Yes'
                if(eachAcc.Active__c == 'Yes' &&
                    oldAccountActive != 'Yes'
                ) {
                    updateDesc = true;
                }
            }
            if(updateDesc){
                eachAcc.Description = 'Account is now active. Enjoy!';
            }
        }
    }
    */



    /*
    public static void updateVipForAllAcontacts(list<account> accTriggerNew, list<account> accTriggerOld, 
                                    Map<id, account> accTriggerNewMap, map<id, account> accTriggerOldMap){
            system.debug('update all contact\'s VIP field');
            set<id> setAccIds = new Set<id>();
            for(account eachAcc: accTriggerNew){
                if(eachAcc.Vip__c != accTriggerOldMap.get(eachAcc.Id).Vip__c){
                    setAccIds.add(eachAcc.Id);
                }
            }

            List<contact> listContacts = [select id, name, account.id, vip__c from contact where account.id in :setAccIds];

            for(contact eachContact : listContacts){
                Account newAccount = accTriggerNewMap.get(eachContact.account.id);
                boolean newAccVip = newAccount.vip__c;

                eachContact.vip__c = newAccVip;
            }
            if(!listContacts.isEmpty()){
                update listContacts;
            }


    }
    */





//TEST FOR TRIGGERS END
/*
public class AccountTriggerHandler {
    //BOOKLET 16 Page 20
    public static void updateAccountDescription(List<account> accTriggerNew, List<account> accTriggerOld,Map<id, account> accTriggerNewMap,Map<id, account> accTriggerOldMap){

        system.debug('inside handler method');

         for(account eachAcc: accTriggerNew){
            boolean updateDesc = false;
            
            if(accTriggerOldMap == null && eachAcc.Active__c == 'Yes'){
                updateDesc = true;
            }
            if(accTriggerOldMap != null){
                Account oldAccount = accTriggerOldMap.get(eachAcc.ID);
                
                string oldAccountActive = oldAccount.Active__c;
                //check if active is updated
                //active is changed to 'Yes'
                if(eachAcc.Active__c == 'Yes' &&
                    oldAccountActive != 'Yes'
                ) {
                    updateDesc = true;
                }
            }
            if(updateDesc){
                eachAcc.Description = 'Account is now active. Enjoy!';
            }
        }
    }
    public static void updateVipForAllAcontacts(list<account> accTriggerNew, list<account> accTriggerOld, Map<id, account> accTriggerNewMap, map<id, account> accTriggerOldMap){

            system.debug('update all contact\'s VIP field');
            set<id> setAccIds = new Set<id>();
            for(account eachAcc: accTriggerNew){
                if(eachAcc.Vip__c != accTriggerOldMap.get(eachAcc.Id).Vip__c){
                    setAccIds.add(eachAcc.Id);
                }
            }
            List<contact> listContacts = [select id, name, account.id, vip__c from contact where account.id in :setAccIds];

            for(contact eachContact : listContacts){
                Account newAccount = accTriggerNewMap.get(eachContact.account.id);
                boolean newAccVip = newAccount.vip__c;

                eachContact.vip__c = newAccVip;
            }
            if(!listContacts.isEmpty()){
                update listContacts;
            }
    }
}
*/


/*
public class AccountTriggerHandler {
    public static void updateAccountDescription(List<account> accTriggerNew,
                                                List<account> accTriggerOld,
                                                Map<id, account> accTriggerNewMap,
                                                Map<id, account> accTriggerOldMap){
         for(account eachAcc: accTriggerNew){
            boolean updateDesc = false;
            if(accTriggerOldMap == null && eachAcc.Active__c == 'Yes'){
                updateDesc = true;
            }
            if(accTriggerOldMap != null){
                Account oldAccount = accTriggerOldMap.get(eachAcc.ID);
                
                string oldAccountActive = oldAccount.Active__c;
                //check if active is updated
                //active is changed to 'Yes'
                if(eachAcc.Active__c == 'Yes' &&
                    oldAccountActive != 'Yes'
                ) {
                    updateDesc = true;
                }
            }
            if(updateDesc){
                eachAcc.Description = 'Account is now active. Enjoy!';
            }
        }
    }
}
*/