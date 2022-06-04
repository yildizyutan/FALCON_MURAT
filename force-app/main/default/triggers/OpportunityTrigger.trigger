trigger OpportunityTrigger on Opportunity (before insert, before update, after Insert, after update) {
    //Assignment week6 part3-q2
        if (trigger.isBefore && trigger.isInsert) {
            for (Opportunity oppEach : trigger.new) {
                if (oppEach.StageName == 'Closed Lost' && oppEach.StageName == 'Closed Won') {
                    oppEach.CloseDate = date.today();
                } else {
                    oppEach.CloseDate = date.today().addDays(15);
                }
            }
        }
    
    /*
    if(trigger.isBefore && trigger.isUpdate){
        //ASSIGNMENT 28 and Assignment week 6 Part 1 - Q2
        Map<Id,Opportunity> mapNew = new Map<Id,Opportunity>();
        mapNew = trigger.newMap;
        Map<Id,Opportunity> mapOld = new Map<Id,Opportunity>();
        mapOld = trigger.oldMap;
        Set<Id> setNewOld = new Set<Id>();
        setNewOld = mapNew.keySet();

        for (Id idEach : setNewOld) {
            Opportunity oppNew = mapNew.get(idEach);
            Opportunity oppOld = mapOld.get(idEach);
            Integer sizeOfTrigger = trigger.new.size();

            if (oppNew.Amount != oppOld.Amount && oppNew.StageName != oppOld.StageName) {
                System.debug('Amount is updated, new Amount; '+oppNew.Amount+', old Amount; '+oppOld.Amount+'.');
                System.debug('Stage is updated, new Stage; '+oppNew.StageName+', old Stage; '+oppOld.StageName+'.');
                System.debug('The size of trigger is; '+sizeOfTrigger);
                oppNew.Description = 'Amount is updated, new Amount; '+oppNew.Amount+', old Amount; '+oppOld.Amount+'.'+' Stage is updated, new Stage; '+oppNew.StageName+', old Stage; '+oppOld.StageName+'.';
            }
            if (oppNew.Amount == oppOld.Amount && oppNew.StageName == oppOld.StageName) {
                    System.debug('Amountand Stage are not updated');
                    
                    oppNew.Description = 'Amountand Stage are not updated';
            }
            if (oppNew.Amount == oppOld.Amount && oppNew.StageName != oppOld.StageName) {
                    System.debug('Amount is not updated, ');
                    System.debug('Stage is updated, new Stage; '+oppNew.StageName+', old Stage; '+oppOld.StageName+'.');

                    oppnew.Description = 'Amount is not updated, '+' Stage is updated, new Stage; '+oppNew.StageName+', old Stage; '+oppOld.StageName+'.';
            }
            if (oppNew.Amount == oppOld.Amount && oppNew.StageName != oppOld.StageName) {
                    System.debug('Amount is updated, new Amount; '+oppNew.Amount+', old Amount; '+oppOld.Amount+'.');
                    System.debug('Stage is not updated');

                    oppNew.Description = 'Amount is updated, new Amount; '+oppNew.Amount+', old Amount; '+oppOld.Amount+'. '+'Stage is not updated';
                }
        }
    }    
   */
 /*   //Print the new and old field values for (Opportunity Name and Amount) fields whenever an opportunity is updated.
    if (trigger.isBefore && trigger.isUpdate) {
        
        List<Opportunity> oppListNew = trigger.new;
        List<Opportunity> oppListOld = trigger.old;

        for (Opportunity oppEachNew : oppListNew) {
            System.debug('The name for new record is; '+ oppEachNew.Name+', and the amount is; '+ oppEachNew.Amount);
        }

        for (Opportunity oppEachOld : oppListOld) {
            System.debug('The name for old record is; '+ oppEachOld.Name+', and the amount is; '+ oppEachOld.Amount);
        }
    }
    */
}