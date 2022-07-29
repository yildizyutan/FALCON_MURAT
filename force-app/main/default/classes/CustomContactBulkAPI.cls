@RestResource(urlMapping = '/ContactCustomBulk/*')
global with sharing class CustomContactBulkAPI {
    @httpPut
    global static list<contact> createContacts(
        List<CreateContactWrapper> contacts
    ) {
        list<contact> listContacts = new list<contact>();
        for(CreateContactWrapper con: contacts){
            Contact c = new contact();
            c.FirstName = con.fName;
            c.LastName = con.lName;
            c.Email = con.emailId;
            c.Phone = con.phoneNumber;
            c.AccountId = con.accountId;
            listContacts.add(c);
        }
        upsert listContacts;
        return listContacts;
    }
}
