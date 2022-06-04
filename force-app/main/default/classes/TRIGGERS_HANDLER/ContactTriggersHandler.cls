public class ContactTriggersHandler {
    
        public static void contactUpdateValidation1(List<contact> cntTriggerNew, List<contact> cntTriggerOld,
                                              Map<id, contact> cntTriggerNewMap, Map<id, contact> cntTriggerOldMap){
                 //.AddError is allowed in Trigger.NEW.
                 //it is not allowed in trigger.old
                 for(contact eachContact: cntTriggerNew){
                     contact oldContact = cntTriggerOldMap.get(eachContact.id);
                     if(oldContact.LeadSource == 'Partner Referral'){
                         eachContact.addError('Cannot update contact where lead source is Partner Referral');
                     }
                 }
     
        }
     
        public static void contactUpdateValidation2(List<contact> cntTriggerNew, List<contact> cntTriggerOld,
         Map<id, contact> cntTriggerNewMap, Map<id, contact> cntTriggerOldMap){
             for(contact eachContact: cntTriggerNew){
                     contact oldContact = cntTriggerOldMap.get(eachContact.id);
                     if(oldContact.LeadSource != eachContact.LeadSource){
                         string customValidation = system.label.ContactValidation2;
                         eachContact.LeadSource.addError(customValidation);
                     }
                 }
         }
//TEST FOR YUKARDAKI CODE try catch kullanilarak test yapildi.
         @isTest
        public with sharing class ContactTriggerTest {
        @istest
        private static void testValidation1() {
            Contact c1 = new contact();
            c1.LastName = 'testLastName';
            c1.LeadSource = 'Email';
            insert c1;
            try{
                c1.LeadSource = 'Phone';
                update c1; //not allowed to update lead source. from trigger?
            } catch(DmlException ex){
                system.debug(ex.getMessage());
                system.assert(ex.getMessage().contains('FIELD_CUSTOM_VALIDATION_EXCEPTION'));
            }
            
        }
}










     


    
    /*
    public static void contactUpdateValidation1(List<contact> cntTriggerNew, List<contact> cntTriggerOld,
                                          Map<id, contact> cntTriggerNewMap, Map<id, contact> cntTriggerOldMap){
             //.AddError is allowed in Trigger.NEW.
             //it is not allowed in trigger.old
             for(contact eachContact: cntTriggerNew){
                 contact oldContact = cntTriggerOldMap.get(eachContact.id);
                 if(oldContact.LeadSource == 'Partner Referral'){
                     eachContact.addError('Cannot update contact where lead source is Partner Referral');
                 }
             }
 
    }
 
    public static void contactUpdateValidation2(List<contact> cntTriggerNew, List<contact> cntTriggerOld,
     Map<id, contact> cntTriggerNewMap, Map<id, contact> cntTriggerOldMap){
         for(contact eachContact: cntTriggerNew){
                 contact oldContact = cntTriggerOldMap.get(eachContact.id);
                 if(oldContact.LeadSource != eachContact.LeadSource){
                     eachContact.LeadSource.addError('CANNOT UPDATE LEAD SOURCE. Please user!');
                 }
             }
     }
     */
}
