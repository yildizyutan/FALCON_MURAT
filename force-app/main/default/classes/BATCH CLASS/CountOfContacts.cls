public class CountOfContacts implements Database.Batchable<sObject> {
    public integer count = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        Database.QueryLocator accList = database.getQueryLocator([SELECT Id, Name, (SELECT AccountID, lastName FROM Contacts) FROM Account]);
        return accList;
    }
    public void execute(Database.BatchableContext bc, List<Account> accList){
        // process each batch of records
        List<Account> accListUD = new List<Account>();
        for(Account accEach: accList){
            accEach.Number_of_Contacts__c = accEach.Contacts.size();
            accListUD.add(accEach);
            count = count + 1; //veya count++; seklinde de yazabiliriz.
        }
        update accListUD;
    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        System.debug('Batch Class execution is completed');

        AsyncApexJob a = [SELECT Id, Status,ExtendedStatus,NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =:BC.getJobId()];
          
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {a.CreatedBy.Email};
            mail.setToAddresses(toAddresses);
            mail.setSubject('Match Merge Batch ' + a.Status);
            mail.setPlainTextBody('records processed ' + a.TotalJobItems +
           'with '+ a.NumberOfErrors + ' failures.');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}
