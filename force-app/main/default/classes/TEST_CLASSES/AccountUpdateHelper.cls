// This Class is for @InvacableMethod annotation.

public class AccountUpdateHelper {
    @invocableMethod
    public static void updateAccountWebsite(List<Id> accIds) {
        List<Account> accountsToUpdate = new List<Account>();
        List<Account> accounts = [SELECT Id, Name, Website FROM Account WHERE Id in :accIds];
        for(Account eachAcc : Accounts){
            eachAcc.Website = 'www.softinnovas.com';
            accountsToUpdate.add(eachAcc);
        }
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}
