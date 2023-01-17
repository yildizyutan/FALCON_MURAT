
public with sharing class studentCtrl {
    @AuraEnabled
    public static List<Student__c> searchStudentsByPostalCode(String postalCode) {
        postalCode= '%' + postalCode + '%';
       return  [Select Id, Student_Name__c, Class__c, Mobile_Phone__c,Email__c,Postal_Code__c FROM Student__c WHERE Postal_Code__c LIKE :postalCode ];
           
    }
}

