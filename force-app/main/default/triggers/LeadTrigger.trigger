//When lead status updated to 'Closed - Not Converted' assigh the lead created date field as today and now. And when a new lead created, assign the created date for today.
// BEFORE TRIGGER, UPDATE on SAME OBJECT

trigger LeadTrigger on Lead (before insert, before update, after insert, after update) {
   
    if(trigger.isBefore){
        //Boolean Flag
        Boolean wantToUpdateDate = FALSE;
        for (Lead eachLead : trigger.New) {
            if (trigger.old == null) {
                wantToUpdateDate = TRUE;
            }
            if (trigger.old != null) {
                if (trigger.oldMap.get(eachLead.Id).Status != eachLead.Status) {
                    wantToUpdateDate = TRUE;
                }
            }
        }
        if(wantToUpdateDate){
           for (lead eachLead : trigger.new) {
               switch on eachLead.Status {
                   when null {
                       eachLead.Created_Date__c = datetime.now();
                   }
                   when '' {
                        eachLead.Created_Date__c = datetime.now();
                   }
                   when 'Open - Not Contacted' {
                        eachLead.Created_Date__c = datetime.now();
                   }
                   when 'Working - Contacted' {
                        eachLead.Created_Date__c = datetime.now();
                   }
                   when 'Closed - Converted' {
                        eachLead.Created_Date__c = datetime.now();
                    }
                    when 'Closed - Not Converted' {
                        eachLead.Created_Date__c = datetime.now();
                    }
               }
           }
       }
       if(wantToUpdateDate){
           for(lead eachLead : trigger.new){
               if (eachLead.Status == 'Closed - Not Converted') {
                    eachLead.Created_Date__c = datetime.now();
               }
           }
       }
   }
}