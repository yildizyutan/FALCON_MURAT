public with sharing class DmlDemo {
    //INSERT Standard object
    public static void dmlInsertDemo_stndObj() {

        Account acc = new Account();
        acc.name = 'SoftInnovas';
        acc.Site = 'www.softinnovas.com';
        acc.Description = 'Salesforce Bootcamp';

        insert acc;
        system.debug(acc);

    }
    //INSERT Custom Object
    public static void dmlInsertDemo_cstmObj() {

        Salesforce_project__c sp = new salesforce_project__c();

        sp.project_name__c = 'Teach DML to Falcons';
        sp.description__c = 'All 50% are great learners';

        insert sp;
        system.debug(sp);

    }
    //UPDATE Standard Object
    public static void dmlUpdateDemo_1() {

        Account accU = new Account();
            accU.name = 'SoftInnovas';
            accU.name = 'SoftInnovas Inc.';
        update accU;
        system.debug(accU);

    }
    //UPDATE-2 (First SOQL then UPDATE data)
    public static void dmlUpdateDemo_3() {

        Account accU3 = [SELECT name FROM account WHERE name = 'SoftInnovas Inc.' limit 1];

        accU3.name = 'SoftInnovas';
        
        update accU3;
        system.debug(accU3);

    }
    //INSERT for related STANDARD Objects(contact and account)
    public static void dmlUpdateDemo_2() {

        Account accU2 = [SELECT id, name 
                        FROM account 
                        WHERE name = 'SoftInnovas' 
                        LIMIT 1];

        Contact cnt = new Contact();
        cnt.lastname = 'Biden';
        cnt.AccountId = accU2.Id;

        Insert cnt;

        system.debug(accU2);

    }

    //INSERT for related CURTOM Objects(Project and Ticket)
    public static void dmlUpdateDemo_2_CO() {

        Salesforce_Project__c sp = [SELECT id, Project_Name__c 
                                    FROM salesforce_project__c 
                                    ORDER BY createdDate 
                                    DESC 
                                    LIMIT 1];

        Salesforce_Ticket__c st = new Salesforce_Ticket__c();
        st.subject__c = 'Learn APEX';
        st.Priority__c = 'High';
        st.Requested_by_date__c = date.newInstance(2022, 4, 29);
        
        st.salesforce_project__c = sp.Id;

        Insert st;

        system.debug(st);

    }

    // INSERT Multiple record by using LIST
    public static void dmlMultipleRecordInsert_right() {

        List<Account> listAcc = new list<Account>();
            account acc1 = new account();
            acc1.name = 'bulk acc 1';
            listAcc.add(acc1);

            account acc2 = new account();
            acc2.name = 'bulk acc 2';
            listAcc.add(acc2);

            account acc3 = new account();
            acc3.name = 'bulk acc 3';
            listAcc.add(acc3);

            insert listAcc;
            System.debug(listAcc);

    }




}
