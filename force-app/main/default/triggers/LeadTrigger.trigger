trigger LeadTrigger on Lead (before insert, before update, after insert, after update) {
   
    if (trigger.isAfter && trigger.Insert) {
        
        List<Lead> newLeadList = trigger.new;
        
        for (Lead leadEach : newLeadList) {
            
            if (leadEach.LeadSource != 'Web') {
                System.debug(  'Rating should be hot');
            } else {
                System.debug('Rating should be cold');
            }
          
        }
        
    }

    

}