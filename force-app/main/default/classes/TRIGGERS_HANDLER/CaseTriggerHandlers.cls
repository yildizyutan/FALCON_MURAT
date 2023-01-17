public with sharing class CaseTriggerHandlers {
    public static void createDefaultTask(List<Case> caseTriggerNew, Map<Id, Case> casetriggerMap){
        //Create task List
        List<Task> createTasks = new List<Task>();

        //for loop on case 'trigger.new' list
        for (Case eachCase : caseTriggerNew) {
            //Create a task
            Task t = new Task();
            //Set Fields
            t.Subject = 'Email';
            t.Priority = 'Normal';
            t.WhoId = eachCase.ContactId;
            t.ActivityDate = date.today();
            createTasks.add(t);      
        }
        if (!createTasks.isEmpty()) {
            insert createTasks;
        }
    }


    /*
    //Booklet 17 Page 9
    public static integer countTriggerExecution = 0;
    public static integer countRecordsUpdate = 0;
    */
 }
