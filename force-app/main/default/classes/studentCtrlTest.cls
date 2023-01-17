@isTest
public with sharing class studentCtrlTest {
    @TestSetup
    static void testSetup(){
        List<Student__c> students = new List<Student__c>();
        for (Integer i = 0; i < 100; i++) {
            Student__c std= new Student__c();
            std.Student_Name__c= 'Student' +i;
            std.Class__c= i;
            std.Postal_Code__c='10'+i;
        students.add(std);
        }
        insert students;
        
    }
    @isTest
    static void searchStudentsByPostalCodeTest(){
        Test.StartTest();
        List<Student__c> studentTest =studentCtrl.searchStudentsByPostalCode('109');
        system.assert(studentTest.size() !=0);
        Test.StopTest();
    }
    
}

