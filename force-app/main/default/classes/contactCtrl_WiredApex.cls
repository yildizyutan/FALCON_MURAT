public with sharing class contactCtrl_WiredApex {
    @AuraEnabled(cacheable=true)
    public static List<Contact> searchContacts(String searchKey) {
        searchKey = '%'+searchKey+'%';

        return [SELECT FirstName, LastName, Title, Department 
                FROM Contact 
                WHERE FirstName LIKE :searchKey 
                OR LastName LIKE :searchKey 
                WITH SECURITY_ENFORCED];
    }
}
