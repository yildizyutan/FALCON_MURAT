public with sharing class DmlDemo2 {
    public static void dmlMultipleRecordUpdate_right() {
        List<Account> listAcc = [SELECT id, name, Description FROM account ORDER BY CreatedDate DESC LIMIT 150];
     
        list<account> updateAccounts = new list<account>();
 
        for (account acc : listAcc) {
            acc.Name += ' vB';
            acc.Description = 'Update via bulk DML';
            updateAccounts.add(acc);
        }
        if(!updateAccounts.isEmpty()){
            update updateAccounts;
        }
        System.debug(updateAccounts);
 
    }
}
