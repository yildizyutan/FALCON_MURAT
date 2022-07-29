Trigger AccountTrigger on Account(After Insert, After Update){
    if(trigger.isAfter){
        if(trigger.isUpdate){
            AccountTriggerHandler.getKanyeQuote(Trigger.New, Trigger.oldMap);
        }
    }
}



//TEST FOR TRIGGERS START
    /*
    trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    if(trigger.isBefore){
        system.debug('before insert/update trigger called');
        AccountTriggerHandler.updateAccountDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        system.debug('before insert/update trigger end.');
        
    }
    /*
    if(trigger.isAfter && trigger.isUpdate){
        AccountTriggerHandler.updateVipForAllAcontacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    */




//TEST FOR TRIGGERS END
    /*
    trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    if(trigger.isBefore){
        system.debug('before insert/update trigger called');
        AccountTriggerHandler.updateAccountDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        system.debug('before insert/update trigger end.');
        
    }
    if(trigger.isAfter && trigger.isUpdate){
        AccountTriggerHandler.updateVipForAllAcontacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}


    trigger AccountTrigger on Account (before insert, after insert, before update, after update) {
        //MAY 12 2022
        //Booklet 16
        //We are usind below code to runhandler.
            if(trigger.isBefore){
                system.debug('before insert/update trigger called');
                AccountTriggerHandler.updateAccountDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
                
            }
    */       
    //MAY 11 2022 
        //Booklet 16 and page 7
        /*
        if(trigger.isBefore && trigger.isInsert){
            List<Account> listNew = new List<Account>();
            listNew = trigger.new;

            for(Account accEach: trigger.new){
                if(accEach.active__c == 'Yes'){
                    System.debug('Account is active');
                    accEach.description = 'Account is active';
                }
            }
        }
        if (trigger.isBefore && trigger.isUpdate) {
            Map<Id,Account> mapNew = new Map<Id, Account>();
            mapNew = trigger.newMap;
            
            Map<Id,Account> mapOld = new Map<Id,Account>();
            mapOld = trigger.oldMap;

            Set<Id> setNewOld = new Set<Id>();
            setNewOld = trigger.newMap.keySet();

            for (Id idEach : trigger.newMap.keySet()) {
                Account accOld = new Account();
                accOld = mapOld.get(idEach);
                String activeOld = accOld.active__c;

                Account accNew = new Account();
                accNew = mapNew.get(idEach);
                String activeNew = accNew.active__c;

                if (activeNew != activeOld && activeNew == 'Yes') {
                    System.debug('Account is active');
                    accNew.description = 'Account is active (before-update)';
                }
            }
        }
        */
        /*
        //REFACTORING CODE ABOVE AS BELOW
        if(trigger.isBefore && trigger.isInsert){
            
            for(Account accEach: trigger.new){
                if(accEach.active__c == 'Yes'){
                    System.debug('Account is active');
                    accEach.description = 'Account is active';
                }
            }
        }
        if (trigger.isBefore && trigger.isUpdate) {
        
            for (Id idEach : trigger.newMap.keySet()) {
            
                if (trigger.newMap.get(idEach).active__c != trigger.oldMap.get(idEach).active__c && trigger.newMap.get(idEach).active__c == 'Yes') {
                    System.debug('Account is active');
                    trigger.newMap.get(idEach).description = 'Account is active (before-update)';
                }
            }
        }
        */


        // Count the number of records, where 'WEBSITE' field is UPDATED in Account.
        // And print the following statement;
    // - in Account field of Web Site will be 'murat', then after trigger is set we will update it as 'murat.com'
    // - statement will be printed when a (record is UPDATED) **and** (the field of WEBSITE is UPDATED). 
    // FIRST DECIDE, to use step to to set trigger, AFTER-UPDATE.
    // SECOND DECIDE, how you can call data from Salesforce, (trigger.newMap) and (trigger.oldMap).
    //Burada MAP ve SET kullanmak zorundayiz, cunki soruda bir field in eski ve yeni hali karsilastirilacak. bu karsilastirmayi tek bir for-each dongusu icinde yapabiliriz. eger LIST ile eski ve yeni recordlari cagirir isek iki ayri for-Each dongusu kurmak zorunda kaliriz ve iki ayri LIST den cekilen field bilgilerini karsilastiramayiz, bir for-each dongusu icinden diger for-each dongusu icindeki degiskene ulasamayiz. bundan dolayi MAP ve SET kullanrak bir for-each dongusu icinde karsilastirmayi if-else ile yapabiliriz.
    /*
        if (trigger.isAfter && trigger.isUpdate) {
            Map<Id, Account> mapNew = new Map<Id, Account>();
            mapNew = trigger.newMap;
            
            Map<Id, Account> mapOld = new Map<Id, Account>();
            mapOld = trigger.oldMap;

            Set<Id> setNewOld = new Set<Id>();
            setNewOld = trigger.newMap.keySet();

            for (Id eachID : setNewOld) {
                
                Account accNew = new Account();
                accNew = mapNew.get(eachID);
                String wsNew = accNew.Website;
                
                Account accOld = new Account();
                accOld = mapOld.get(eachID);
                String wsOld = accOld.Website;
                
                    if (wsOld != wsNew) {
                        System.debug('there is update on account object');
                        System.debug('the website field is updated on Account Object');
                        System.debug('the new record is; '+wsNew);
                        System.debug('the old(previuos) record is; '+wsOld);
                    }else{
                        System.debug('There is update on account object records but There is no any update on website field record.');
                    }
            }
        }
        */

        // Print OLD and NEW Account.name for all the UPDATED accounts in AFTER-UPDATE.
        //Using **** MAP **** and ***** SET *****
        /*
        if (trigger.isAfter && trigger.isUpdate) {

            Map<Id, Account> newMap = trigger.newMap;
            Map<Id, Account> oldMap = trigger.oldMap;

            Set<Id> newSet = newMap.keySet();
            Set<Id> oldSet = oldMap.keySet(); //Bir tane set yeterli olack cunki, old ve new set deki ID ler ayni degismiyor.

            for (Id accIdEach : newSet) {
                
                Account accNew = new Account();
                accNew = newMap.get(accIdEach);
                String accNewName = accNew.Name;

                Account accOld = new Account();
                accOld = oldMap.get(accIdEach);
                String accOldName = accOld.name;
                
                System.debug('Account updated(new) name after update '+ accNewName);

                System.debug('Account previous(old) name after upfdate '+ accOldName);
            }     
        }
        */
        // Print OLD and NEW Account.name for all the UPDATED accounts in AFTER-UPDATE.
        //Using **** LIST ****
        /*
        if(trigger.isAfter && trigger.isUpdate){
            List<Account> accListNew = trigger.new;
            List<Account> accListOld = trigger.old;
        
            for (Account accEachNew : accListNew) {
                String accNewName = accEachNew.name;
                String accNewWeb = accEachNew.Website;

                System.debug('Account new Name after update is '+ accNewName+' '+accNewWeb+' '+accOldName);

            }
            for (Account accEachOld : accListOld) {
                String accOld = accEachOld.name;
                System.debug('Account previous(old) name after update is '+ accOld);
            }

        }
        //BURADA IKI AYRI YONTEM KULLANILARAK SORU COZULDU, ILKINDE MAP ve SET KULLANILDI, IKINCIDE LIST KULLANILDI.
        */

        //May 10 2022

        // ******************  //
        // Requirement;
        // Print the SET<ID> of all inserted/updated records.
        /*
        if(trigger.isAfter){
        if (trigger.isUpdate) {
            
        Set<Id> accIdSet = new Set<Id>();
        for (Account accEach : trigger.new) {
            
            accIdSet.add(accEach.Id);

        }
        System.debug(accIdSet);

        }
        }
        */

        // Requirement, Print old and new names of all updated accounts.
        // Test by Update Names of 5 Accounts..
        /*
        if (trigger.isAfter) {
        
        if (trigger.isUpdate) {
            for (Account accNew : trigger.new) {
                System.debug('account name is; '+accNew.name+' after update, and account ID is; '+ accNew.Id+' after update');
            }
            for (Account accOld : trigger.old) {
                System.debug('account name is; '+accOld.name+' before update, and account ID is; '+accOld.Id+' before update');
            }
        }

    }
    */

    /*
        if(trigger.isBefore && trigger.isUpdate){
            system.debug('trigger.new before update = ' + trigger.new);
            list<account> newAccounts = trigger.new;
            for (account acc :  newAccounts) {
                system.debug('accout id is = ' + acc.Id + ', account name is ' + acc.Name + ', acc modified date = ' + acc.LastModifiedDate);
            }
        }
        if (trigger.isAfter && trigger.isUpdate) {
            //trigger.new -> record(s) which were responsible for firing the trigger
            system.debug('trigger.new after update = ' + trigger.new);
            for (account acc :  trigger.new) {
                system.debug('accout id is = ' + acc.Id + ', account name is ' + acc.Name + ', acc modified date = ' + acc.LastModifiedDate);
            }
        }

        if(trigger.isBefore && trigger.isInsert){
            system.debug('trigger.new before insert = ' + trigger.new);
        }
        if (trigger.isInsert && trigger.isAfter) {
            //trigger.new -> record(s) which were responsible for firing the trigger
            system.debug('trigger.new after insert = ' + trigger.new);
        }
    */

        /*
        if (trigger.isInsert && trigger.isAfter) {
            //trigger.new -> record(s) which were responsible for firing the trigger
            system.debug('trigger.new after insert = ' + trigger.new);

            list<account> newAccounts = trigger.new;

            system.debug('total account inserted = ' + newaccounts.size());
            for (account acc : newAccounts) {
                system.debug('accout id is = ' + acc.Id + ', account name is ' + acc.Name);
            }
        }*/


        /*
        system.debug('---------START------------');
        system.debug('trigger.isBefore = ' + trigger.isBefore);
        system.debug('trigger.isAfter = ' + trigger.isAfter);
        system.debug('trigger.isInsert = ' + trigger.isInsert);
        system.debug('trigger.isUpdate = ' + trigger.isUpdate);
        if (Trigger.isInsert && Trigger.isBefore) {
            system.debug('before insert trigger fired');
        }
        if (Trigger.isInsert && Trigger.isAfter) {
            system.debug('after insert trigger fired');
        }
        if (Trigger.isUpdate && Trigger.isBefore) {
            system.debug('before update trigger fired');
        }
        if (Trigger.isUpdate && Trigger.isAfter) {
            system.debug('after update trigger fired');
        }
        system.debug('---------END------------');
        */

    //**********//
    //END OF MAY 10 2022
        /*
        if(Trigger.isBefore){
            System.debug('Before Insert Trigger.');
        }
        if (Trigger.isAfter) {
            System.debug('After Insert Trigger.'); 
        }
        if (Trigger.isBefore && Trigger.isAfter) {
            System.debug('**  AB  ** After and Before Insert Trigger');
        }
    */ /*
        //WRITING in ORDER CONDITION
        if(Trigger.isBefore && Trigger.isInsert){
            System.debug('Before Insert Trigger');
        }
        if (Trigger.isAfter && Trigger.isInsert) {
            System.debug('After Insert Trigger');
        }
        if(Trigger.isBefore && Trigger.isUpdate){
            System.debug('Before Update Trigger');
        }
        if (Trigger.isAfter && Trigger.isUpdate) {
            System.debug('After Update Trigger');
        }
    */
    /*
        //WRITING IN NESTED CONDITION
        if(Trigger.isBefore){
            if(Trigger.isInsert){
                System.debug('Before Insert condition Trigger');
            }
            if(Trigger.isUpdate){
                System.debug('Before update condition Trigger');
            }
        }
        if(Trigger.isAfter){
            if(Trigger.isInsert){
                System.debug('After insert condition Trigger');
            }
            if (Trigger.isUpdate) {
                System.debug('After update condition Trigger');
            }
        }
    */
    /*
        if (Trigger.isAfter && Trigger.isInsert) {
            System.debug('after insert durumunda trigger.new => '+trigger.new);
        }
        */
    /*
        if (trigger.isInsert && trigger.isAfter) {
            //trigger.new -> record(s) which were responsible for firing the trigger
            system.debug('trigger.new after insert = ' + trigger.new);

            list<account> newAccounts = trigger.new;

            system.debug('total account inserted = ' + newaccounts.size());
            for (account acc : newAccounts) {
                system.debug('accout id is = ' + acc.Id + ', account name is ' + acc.Name);
            }
        }
    */
    /*
        if(trigger.isBefore && trigger.isUpdate){
            system.debug('trigger.new before insert = ' + trigger.new);
        }
        if (trigger.isUpdate && trigger.isAfter) {
            //trigger.new -> record(s) which were responsible for firing the trigger
            system.debug('trigger.new after insert = ' + trigger.new);
        }
    */
    /*
        if (trigger.isBefore && trigger.isInsert) {
            System.debug('Before and Insert condition = '+ trigger.old);
        }
        if (trigger.isAfter && trigger.isInsert) {
            System.debug('after and Insert condition = '+ trigger.old);
        }
        if (trigger.isBefore && trigger.isUpdate) {
            System.debug('before and update condition = '+ trigger.old);
        }
        if (trigger.isAfter && trigger.isUpdate) {
            System.debug('after and update condition = '+ trigger.new);
        }
    */
    /*
        if (trigger.isAfter) {
            if (trigger.isUpdate){
                for (Account accNew : trigger.new) {
                    System.debug('New Account Id = '+accNew.Id+', New Account Name = '+accNew.Name);
                }
                for (Account accOld : trigger.old) {
                    System.debug('Old Account Id = '+accOld.Id+', Old Account Name = '+accOld.Name);
                }
                
            }
        }
    */
    /*
        if (trigger.isAfter) {
            System.debug('After trigger on Account Object');
            List<Account> newAccList = trigger.new;
            System.debug('New Accounts List creadted ; '+ newAccList);

            Set<Id> newAccIdSet = new Set<Id>();
            for (Account accNew : newAccList) {
                newAccIdSet.add(accNew.Id);
            }
            System.debug(newAccIdSet);
        }
        */
        /*
        Map<Id,Account> trgNewAcc = trigger.newMap;
        Map<Id,Account> trgOldAcc = trigger.oldMap;

        if (trigger.isBefore && trigger.isInsert) {
            System.debug('before and insert '+trgNewAcc);
            System.debug('before and insert '+trgOldAcc);
        }
        if (trigger.isBefore && trigger.isUpdate) {
            System.debug('before and update trgNewAcc'+trgNewAcc);
            System.debug('before and update trgOldAcc'+trgOldAcc);
        }
        if (trigger.isAfter && trigger.isInsert) {
            System.debug('after and insert '+trgNewAcc);
            System.debug('after and insert '+trgOldAcc);
        }
        if (trigger.isAfter && trigger.isUpdate) {
            System.debug('after and update '+trgNewAcc);
            System.debug('after and update '+trgOldAcc);
        }
    */
        /* VITAP in derste yazdigi ornekler.
    //////////1
    if (trigger.isInsert && trigger.isAfter) {
            //trigger.new -> record(s) which were responsible for firing the trigger
            system.debug('trigger.new after insert = ' + trigger.new);

            list<account> newAccounts = trigger.new;

            system.debug('total account inserted = ' + newaccounts.size());
            for (account acc : newAccounts) {
                system.debug('accout id is = ' + acc.Id + ', account name is ' + acc.Name);
            }
        }
    ///////////2
        list<account> listAcc = new list<account>();
    for (Integer i = 0; i < 4; i++){
        account acc2 = new account();
        acc2.Name = 'SoftInnovas 10-May v'+i;
        acc2.AccountNumber = 'asci-1'+i;
        acc2.Active__c = 'Yes';
        listAcc.add(acc2);
    }
    system.debug('size of list ' + listAcc.size());

    if(!listAcc.isEmpty()){
        insert listAcc;
    }
    /////////3
    if(trigger.isBefore && trigger.isInsert){
            system.debug('trigger.new before insert = ' + trigger.new);
        }
        if (trigger.isInsert && trigger.isAfter) {
            //trigger.new -> record(s) which were responsible for firing the trigger
            system.debug('trigger.new after insert = ' + trigger.new);
        }

    //////////4
    if(trigger.isAfter){
            if(trigger.isUpdate){
                List<account> oldAccounts = trigger.old;
                List<account> newAccounts = trigger.new;

                for(account oldAcc: oldaccounts){
                    system.debug('old acc.id = ' + oldAcc.id + ', old acc name = ' + oldAcc.Name);
                }
                for(account newAcc: newaccounts){
                    system.debug('new acc.id = ' + newAcc.id + ', new acc name = ' + newAcc.Name);
                }
            }
        }
        //////////5
        map<id, account> trgNewMap = trigger.newMap;
        map<id, account> trgOldMap = trigger.oldMap;

        if(trigger.isBefore &&  trigger.isInsert){
            system.debug('=======BEFORE INSERT=========');
            system.debug('Before insert OLD MAP = ' + trgOldMap);
            system.debug('Before insert NEW MAP = ' + trgNEWMap);
        }
        if(trigger.isAfter &&  trigger.isInsert){
            system.debug('=======AFTER INSERT=========');
            system.debug('AFter insert OLD MAP = ' + trgOldMap);
            system.debug('AFter insert NEW MAP = ' + trgNEWMap);
        }

        if(trigger.isBefore &&  trigger.isUpdate){
            system.debug('=======BEFORE UPDATE=========');
            system.debug('Before update OLD MAP = ' + trgOldMap);
            system.debug('Before update NEW MAP = ' + trgNEWMap);
        }
        if(trigger.isAfter &&  trigger.isUpdate){
            system.debug('=======AFTER UPDATE=========');
            system.debug('AFter update OLD MAP = ' + trgOldMap);
            system.debug('AFter update NEW MAP = ' + trgNEWMap);
        }

        /////////6
    }*/