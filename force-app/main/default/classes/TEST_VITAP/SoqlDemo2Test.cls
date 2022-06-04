@isTest
public with sharing class SoqlDemo2Test {
    @isTest
    private static void testChildToParent_Soql1() {
        Account acc1 = new account();
        acc1.Name = 'SI Test';
        acc1.Industry = 'Energy';

        Account acc2 = new account();
        acc2.Name = 'UI Test';
        acc2.Industry = 'Energy';

        Account acc3 = new account();
        acc3.Name = 'PI Test';
        acc3.Industry = 'Banking';

        list<account> listAcc = new list<account>{acc1, acc2, acc3};
        insert listAcc;

        list<contact> listContact = new list<contact>();
        /*
        for (Integer i = 0; i < 300; i++) {
            Contact c = new contact();
            c.LastName = 'Test SOQL';
            if (i < 100) {
                c.accountid = acc1.id;
            } else if (i < 200) {
                c.accountid = acc2.id;
            } else if(i < 300){
                c.accountid = acc3.id;
            }
            listContact.add(c);
        }
        */
        for (Integer i = 0; i < 100; i++) {
            Contact cont1 = new Contact();
            cont1.AccountId = acc1.id;
            cont1.LastName = 'Cont1 '+i+' for acc1';
            listContact.add(cont1);
        }

        for (Integer i = 100; i < 200; i++) {
            Contact cont2 = new Contact();
            cont2.AccountId = acc2.id;
            cont2.LastName = 'Cont2 '+i+' for acc2';
            listContact.add(cont2);
        }
        for (Integer i = 200; i < 300; i++) {
            Contact cont3 = new Contact();
            cont3.AccountId = acc3.id;
            cont3.LastName = 'Cont3 '+i+' for acc3';
            listContact.add(cont3);
        }

        insert listContact;
        Test.startTest();
        soqldemo2.childToParent_Soql1();
        Test.stopTest();
    }
    @isTest
    private static void testSampleSoql4() {
        Account acc1 = new account(); // 1. account
        acc1.Name = 'acc1';
        acc1.AnnualRevenue = 10000;
        acc1.type = 'Customer-Direct';
            Account acc2 = new account();  // 2. account
            acc2.Name = 'acc2';
            acc2.AnnualRevenue = 20000;
            acc2.type = 'Customer-Direct';
                Account acc3 = new account();  // 3. account
                acc3.Name = 'acc3';
                acc3.AnnualRevenue = 30000;
                acc3.type = 'Customer-Direct';
        
        list<account> listAcc = new list<account>{acc1, acc2, acc3}; //yukarida olusturulan accountlarin listesi
            insert listAcc; // listeyi inser ediyoruz, bu liste sampleSoql4 methodundaki SOQL sorgusunda cekilecek ACCOUNT listesi.
       
        list<contact> contList = new list<contact>(); // Asagida olusturulan contact larin add yapildigi liste.
        List<Opportunity> oppList = new List<Opportunity>();  // Asagida olusturulan oppotunities lerin add yapildigi liste.
            
            // Contacts need to be created and assigned to accounts.
            for (Integer i = 0; i < 10; i++) {
                Contact contAcc1 = new Contact();
                contAcc1.AccountId = acc1.id;
                contAcc1.LastName = 'ContAcc1 '+i+' for acc1';
                contList.add(contAcc1);
            } // 1. Contact
                for (Integer i = 10; i < 20; i++) {
                    Contact contAcc2 = new Contact();
                    contAcc2.AccountId = acc2.id;  // Bu satirda contAcc2 acc2 ye baglaniyor
                    contAcc2.LastName = 'ContAcc2 '+i+' for acc2';
                    contList.add(contAcc2);
                }
                    for (Integer i = 20; i < 30; i++) {
                        Contact contAcc3 = new Contact();
                        contAcc3.AccountId = acc3.id;
                        contAcc3.LastName = 'ContAcc3 '+i+' for acc3';
                        contList.add(contAcc3);
                    }
            
            // Opportunities need to be created and assigned to accounts.
            for (Integer i = 0; i < 10; i++) {
                Opportunity oppAcc1 = new Opportunity();
                oppAcc1.AccountId = acc1.id;  // Bu satirda oppAcc1 acc1 e baglaniyor
                oppAcc1.Name = 'OppAcc1 '+i+' for acc1';
                oppAcc1.Amount = 1000;
                oppAcc1.StageName = 'Closed Won';
                oppList.add(oppAcc1);
            }
                for (Integer i = 10; i < 20; i++) {
                    Opportunity oppAcc2 = new Opportunity();
                    oppAcc2.AccountId = acc2.id;
                    oppAcc2.Name = 'OppAcc2 '+i+' for acc2';
                    oppAcc2.Amount = 2000;
                    oppAcc2.StageName = 'Closed Won';
                    oppList.add(oppAcc2);
                }
                    for (Integer i = 20; i < 30; i++) {
                        Opportunity oppAcc3 = new Opportunity();
                        oppAcc3.AccountId = acc3.id;
                        oppAcc3.Name = 'OppAcc3 '+i+' for acc3';
                        oppAcc3.Amount = 3000;
                        oppAcc3.StageName = 'Closed Won';
                        oppList.add(oppAcc3);
                    }
        insert contList; // Contact listesini inser ediyoruz sampleSoql4 methodundaki SOQL sorugunda bu liste cekiliyor.
        insert oppList;  // Opportunity listesini inser ediyoruz sampleSoql4 methodundaki SOQL sorugunda bu liste cekiliyor.

            Test.startTest();
            soqldemo2.sampleSoql4();
            Test.stopTest();
    }

}