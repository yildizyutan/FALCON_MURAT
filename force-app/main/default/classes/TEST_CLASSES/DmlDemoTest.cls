@isTest
public class DmlDemoTest {
    @isTest
    public static void testDmlInsertDemo_stdnObj() {
        DmlDemo.dmlInsertDemo_stdnObj();
            List<Account> listAcc = [SELECT id, name FROM Account WHERE name = 'SoftInnovas' ];//SOQL ile cagirma
                System.assertEquals(1, listAcc.size());
                System.assertEquals('SoftInnovas', listAcc[0].name); 
    }
    @isTest
    public static void testDmlInsertDemo_cstmObj(){
        DmlDemo.dmlInsertDemo_cstmObj();
            List<Salesforce_project__c> listSp = [SELECT Project_Name__c, Description__c FROM Salesforce_project__c WHERE Project_Name__c = 'Teach DML to Falcons'];
                System.assertEquals('Teach DML to Falcons', listSp[0].project_name__c);
                System.assertEquals('All 50% are great learners', listSp[0].description__c);
    }
    
    @isTest
    public static void testDmlUpdateDemo(){
        Account acc = new Account();
        acc.name = 'SoftInnovas Inc.';
        insert acc;

        DmlDemo.dmlUpdateDemo_1();
            List<Account> listAccUp = [SELECT id, name FROM Account WHERE name = 'SoftInnovas Inc.'];
                System.assertEquals('SoftInnovas Inc.', listAccUp[0].Name);
                System.assertEquals(1, listAccUp.size());
    }
}