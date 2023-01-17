public class DML_in_APEX {
    public static Id createAccount() {
        Account acc = new Account();
        acc.Name = 'Spur';
        Insert acc;
        return acc.Id;
    }
    public static void createContact(){
        //Below line is not necessary if we write method name directly.
        //ID accId = createAccount();
        Contact c = new Contact();
        c.LastName = 'Daily';
        //below line to relate the c to acc with Id, using createAccount(); is calling what we return in createAccount method.
        c.AccountId = createAccount();
        insert c;
    }     

    public Static Void tieConttoAcc (){
        /*
        Account acc = new Account();
        acc.Name = 'DEFAULT-X';
        insert acc;

        List<Contact> contList = new List<Contact>();
        for (Integer i = 0; i < 5; i++) {
            Contact cont =new Contact();
            cont.LastName = i +'. Contact';
            cont.AccountId = acc.Id;
            contList.add(cont);
        }
        insert contList;
        */
        List<Account> accList = [SELECT Id,Name, (SELECT LastName FROM Contacts) FROM Account WHERE Name = 'DEFAULT'];
        System.debug(accList);
    }
}
