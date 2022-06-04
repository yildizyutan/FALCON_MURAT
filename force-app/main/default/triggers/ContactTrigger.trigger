trigger ContactTrigger on Contact (before insert, after insert, before update, after update, after delete, after undelete) {
    
    // CUSTOM LABEL PRACTICE, trigger and handler in class.
    
        if(trigger.isBefore && trigger.isUpdate){
            ContactTriggersHandler.contactUpdateValidation1(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
            ContactTriggersHandler.contactUpdateValidation2(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        }
        Set<Id> accountIds = new Set<Id>();
        if(trigger.isAfter){
            if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
                for (contact c : trigger.new) {
                    if(c.accountid != null){
                        accountIds.add(c.AccountId);
                    }
                }
            }
            if(trigger.isUpdate || trigger.isdelete){
                for (contact c : trigger.old) {
                    if(c.accountid != null){
                        accountIds.add(c.AccountId);
                    }
                }
            }
    
            if(!accountIds.isEmpty()){
                List<account> accList = [select id, number_of_contacts__c, (select id from contacts)
                from account where id in :accountIds];
    
                if(!accList.isEmpty()){
                    list<account> updateAccList = new list<account>();
                    for (account eachAcc : accList) {
                        List<contact> listContacts = eachAcc.contacts;
                        
                        Account acc = new account();
                        acc.id = eachAcc.id;
                        acc.number_of_contacts__c = listContacts.size();
                        updateAccList.add(acc);
                    }
                    if(!updateAccList.isEmpty()){
                        update updateAccList;
                    }
                }
            }
        }
    
    


    /* //START
    trigger ContactTrigger on Contact (before insert, before update, after insert, after update, after delete, after undelete) {
        //BURAK HOCANIN YONTEMI
        Set<Id> accountIds = new Set<Id>();
        if(trigger.isAfter){
            if(trigger.isInsert || trigger.isUndelete){
                 for(contact c : trigger.new){
                     if(c.AccountId != null){
                         accountIds.add(c.AccountId);
                     }
                 }
            }
            if(trigger.isUpdate){
                for(contact c : trigger.new){
                    if(c.AccountId != trigger.oldMap.get(c.Id).AccountId){
                        accountIds.add(c.AccountId);
                        accountIds.add(trigger.oldMap.get(c.Id).AccountId);
                    }
                }
     
            }
            if(trigger.isDelete){
              for(contact c : trigger.old){
                  if(c.AccountId != null){
                     accountIds.add(c.AccountId);
                  }
              }
            }
            if(!accountIds.isEmpty()){
                List<Account> accList = [select id, name, Number_of_Contacts__c, (select id from contacts) from Account where id in :accountIds];
     
                if(!accList.isEmpty()){
                    list<Account> updateAccountList = new list<Account>();
                    for(Account eachAcc : accList){
                        List<Contact> contactsList = eachAcc.contacts;
     
                        Account acc = new Account();
                        acc.id = eachAcc.id;
                        acc.Number_of_Contacts__c = contactsList.size();
                        updateAccountList.add(acc);
                    }
                    if(!updateAccountList.isEmpty()){
                        update updateAccountList;
                    }
                }
            }
        }
     }   
     */ //END



    /*
    trigger ContactTrigger on Contact (before insert, after insert, before update, after update, after delete, after undelete) {
        //VITAP HOCANIN YAPTIGI YONTEM
        if(trigger.isBefore && trigger.isUpdate){
            ContactTriggerHandler.contactUpdateValidation1(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
            ContactTriggerHandler.contactUpdateValidation2(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        }
        Set<Id> accountIds = new Set<Id>();
        if(trigger.isAfter){
            if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
                for (contact c : trigger.new) {
                    if(c.accountid != null){
                        accountIds.add(c.AccountId);
                    }
                }
            }
            if(trigger.isUpdate || trigger.isdelete){
                for (contact c : trigger.old) {
                    if(c.accountid != null){
                        accountIds.add(c.AccountId);
                    }
                }
            }
    
            if(!accountIds.isEmpty()){
                List<account> accList = [select id, number_of_contacts__c, (select id from contacts)
                from account  account where id in :accountIds];
    
                if(!accList.isEmpty()){
                    list<account> updateAccList = new list<account>();
                    for (account eachAcc : accList) {
                        List<contact> listContacts = eachAcc.contacts;
                        
                        Account acc = new account();
                        acc.id = eachAcc.id;
                        acc.number_of_contacts__c = listContacts.size();
                        updateAccList.add(acc);
                    }
                    if(!updateAccList.isEmpty()){
                        update updateAccList;
                    }
                }
            }
        }
    
    }
    */

    
    /*
    trigger ContactTrigger on Contact (before insert, before update, after insert, after update) {
        //Last name değişirse/güncellenirse(Update) Description da 'Contactın name değişti'
        // version 1
        if(trigger.isBefore && trigger.isUpdate){
            for(contact cn : trigger.new){
                if(cn.lastName != trigger.oldMap.get(cn.id).lastName){ //isimler değişmişse
                    //Description da 'Contactın name değişti' yazacak
                    cn.Description = 'Contactın name değişti';
                } else {
                    cn.Description = '';
                }     
            }
        }
    
        // version 2
        if(trigger.isBefore && trigger.isUpdate){
            for(contact cn : trigger.new){
                contact oldCn = trigger.oldMap.get(cn.id);
                if(cn.lastName != oldCn.lastName){ //isimler değişmişse
                    //Description da 'Contactın name değişti' yazacak
                    cn.Description = 'Contactın name değişti';
                } else {
                    cn.Description = '';
                }     
            }
        }
        
    }
    */
}