trigger TryCatchOverTrigger on Contact (before insert, before update, after insert, after update) {
    if (trigger.isBefore) {
        List<Contact> listContNew = trigger.new;
        TryCatchAssignment.tryCatchHandler(listContNew);
        
    }
}