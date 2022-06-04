public  class SalesforceProjectTriggerHandler {
    public static void createDefaultSalesforceTicket(List<Salesforce_Project__c> spTriggerNew){
        
        List<Salesforce_Ticket__c> listST = new List<Salesforce_Ticket__c>();
 
        for(Salesforce_Project__c sp: spTriggerNew){
            Salesforce_Ticket__c st = new Salesforce_Ticket__c();
            st.Subject__c = 'Default ST';
            st.Description__c = 'A default ticket for project.';
            st.Salesforce_Project__c = sp.Id;
            listST.add(st);
        }
 
        if(!listST.isEmpty()){
            insert listST;
        }
    }
 }


