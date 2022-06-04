
trigger CaseTrigger on Case (before insert, before update) {
   //Booklet 17, page 9 
    
    if(trigger.isInsert){
        system.debug('before insert trigger called.');
    }
    if(trigger.isUpdate){
        CaseTriggerHandler.countTriggerExecution++;
        system.debug('# of times trigger executed: ' + CaseTriggerHandler.countTriggerExecution);

        CaseTriggerHandler.countRecordsUpdate += trigger.size;
        system.debug('# of records updated = ' + CaseTriggerHandler.countRecordsUpdate);
    }
    
}

/*
trigger CaseTrigger on Case (before insert, before update, after insert, after update) {
    
    if(trigger.isBefore && trigger.isUpdate){
        for(case caseEach : trigger.new){
            case oldCase = trigger.oldMap.get(caseEach.id);
            if(caseEach.origin != oldCase.origin){ 
                System.debug( ' değişti'+caseEach.CaseNumber);
            }    
        }
    }      
}
*/