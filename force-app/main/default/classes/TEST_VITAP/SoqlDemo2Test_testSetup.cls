@isTest
public with sharing class SoqlDemo2Test_testSetup {
    @testSetup
    public static void setupData() {
        Account acc1 = new account();
        acc1.Name ='acc1';
        //acc1.Industry ='Banking';
            Account acc2 = new account();
            acc2.Name ='acc2';
            //acc2.Industry ='Banking';
                Account acc3 = new account();
                acc3.Name = 'acc3';
                //acc3.Industry = 'Banking';
        list<account> accList = new list<account>{acc1, acc2, acc3};
        insert accList;

        list<contact> contList = new list<contact>();
            for (Integer i = 0; i < 300; i++) {
                Contact cont = new contact();
                cont.LastName = 'Deneme';
                if (i < 100) {
                    cont.accountid = acc1.id; 
                } else if (i < 200) {
                    cont.accountid = acc2.id; 
                } else if(i < 300){
                    cont.accountid = acc3.id;   
                }
                contList.add(cont);
            }
        insert contList;
        /*
        List<Opportunity> oppList = new List<Opportunity>();
            for (Integer i=0; i<30; i++){
                Opportunity opp = new Opportunity();
                if(i < 10){
                    opp.AccountId = acc1.Id;
                    opp.Name = 'opp '+i;
                    opp.Amount = i*1000;
                    opp.StageName = 'ClosedWon';
                }
                    else if(i < 20) {
                        opp.AccountId = acc2.Id;
                        opp.Name = 'opp '+i;
                        opp.Amount = i*1000;
                        opp.StageName = 'ClosedWon';
                    }
                        else if(i < 30) {
                            opp.AccountId = acc3.Id;
                            opp.Name = 'opp '+i;
                            opp.Amount = i*1000;
                            opp.StageName = 'ClosedWon';
                        }
                oppList.add(opp);
            }
        insert oppList;
        */
    }
    @isTest
    public static void soqlDemoTest1() {
        //in preparing data, we consumed FEW governor limits.
        //ex: 2 dmls. 303 DML rows
        //some heap size, some cpu time etc.
        List<Account> accList =[SELECT  id, name, Industry FROM Account];
            Integer n = 0;
            for (Account accEach : accList) {
                n += n;
                accEach.Name = 'acc '+n;
                accEach.Industry = 'Energy';    
            }
            update accList;

        List<Contact> contList =[SELECT id, lastname FROM Contact];
            for (Contact contEach : contList) {
                n += n;
                contEach.lastname = 'cont '+n;   
            }
            update contList;

        Test.startTest();
        SoqlDemo2.childToParent_Soql1();
        Test.stopTest();
    }
    /*
    @isTest
    private static void sampleSoql4TEST() {
        
        list<account> listAccounts = [SELECT id, name, type FROM account];
        
        for (account acc : listAccounts) {
            acc.type = 'Customer - Direct';
        }
        update listAccounts;

        List<Opportunity> createOpps = new List<Opportunity>();
        for (Integer i = 0; i < 300; i++) {
            Opportunity o = new Opportunity();
            o.Name = 'opp1';
            o.StageName = 'Closed Lost';
            o.CloseDate = date.today();
            if(i < 100){
                o.AccountId = listAccounts[0].id;
            }
            else if(i< 200){
                o.AccountId =  listAccounts[1].id;
            }
            else if(i< 300){
                o.AccountId =  listAccounts[2].id;
            }
            createOpps.add(o);
        }
        insert createOpps;

        Test.startTest();
        SoqlDemo2.sampleSoql4();
        Test.stopTest();
    }*/
}