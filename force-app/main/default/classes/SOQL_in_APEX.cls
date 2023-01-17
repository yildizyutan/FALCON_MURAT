public with sharing class SOQL_in_APEX {
    public static void contactWithEmail() {
        List<Contact> listEmailContact = [SELECT Name, Email FROM Contact WHERE Email != NULL ];
        for (Contact eachCont : listEmailContact) {
            System.debug('Contact name is; '+ eachCont.Name.toUpperCase()+', and the email is; '+ eachCont.Email.toUpperCase());
            System.debug('--------------***---------------');
        }
    }
    public static void childToParent(){
        List<Contact> listCont = [SELECT Name, Account.Name FROM Contact WHERE Name LIKE 'A%'];
        System.debug(listCont);
    }

    public static void childToParenOpp(){
        List<Opportunity> oppList = [SELECT Id, Name, Amount, StageName, AccountId, Account.Name, Account.Phone, Account.Type, Account.Industry FROM Opportunity WHERE (StageName != 'Closed Lost' AND StageName != 'Closed Won')];

        for (Opportunity oppEach : oppList) {
            String printString = ' Opp Name = '+oppEach.Name;
            printString += 'Opp Amount = '+oppEach.Amount;
            printString += ' Account name = '+oppEach.Account.Name;
            System.debug(printString);
        }

    }

    public Static Void soqlGROUPBY(){
        List<AggregateResult> listGbLeadSource = [SELECT leadSource, COUNT(Id) FROM Lead GROUP BY LeadSource];
        System.debug(listGbLeadSource);
    }

    
}
