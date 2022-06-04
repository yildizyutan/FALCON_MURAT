@isTest
public class DmlDemoTest_Vitap {
    @isTest
    public static void dmlDemoTest1() {
        DmlDemo.dmlInsertDemo_stndObj();

        List<Account> listAcc = [select id, name from account];
        system.assertEquals(1, listAcc.size());
        system.assertEquals('SoftInnovas', listAcc[0].Name);
    }
    @istest
    public static void dmlDemoUpdate2Test() {
        // 1. kisim dmlUpdateDemo_2 methodu icinde yazilan SOQL sorgusu icin.
        Account acc = new account();
        acc.Name = 'SoftInnovas';
        insert acc;

        // 2. kisim test edilecek methodun belirlendigi kisim.
        DmlDemo.dmlUpdateDemo_2();
        
        // 3. kisim ise insert edilen contact in SOQL ile test methodu icine cagrilmasi.
        list<contact> listCnt = [SELECT id, lastname 
                                FROM contact];
        
        system.assertEquals(1, listCnt.size());
        system.assertEquals('Biden', listCnt[0].lastname);
    }
    @isTest
    public static void testDMLUpdateDemo_2_CO(){

        

        Salesforce_Project__c sp1 = new Salesforce_Project__c();
        sp1.Project_Name__c = 'sp1';
       
        /*
        Account sp2 = new Account();
        sp2.Name = 'sp2';
        spList.add(sp2);
        Account sp3 = new Account();
        sp3.Name = 'sp3';
        spList.add(sp3);
        Account sp4 = new Account();
        sp4.Name = 'sp4';
        spList.add(sp4);
        */
        insert sp1;

        DmlDemo.dmlUpdateDemo_2_CO();

        List<Salesforce_Ticket__c> stList = [SELECT subject__c, Priority__c, Requested_by_date__c 
                                            FROM Salesforce_Ticket__c 
                                            WHERE subject__c = 'Learn APEX'
                                            ORDER BY CreatedDate 
                                            DESC 
                                            LIMIT 1];
            System.assertEquals(1, stList.size());
            System.assertEquals('Learn APEX', stList[0].subject__c);


    }
}
