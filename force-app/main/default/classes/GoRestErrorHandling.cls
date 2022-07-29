public with sharing class GoRestErrorHandling {
    
    public static void createLog(String logType, String message) {
        Application_Log__c newAppLog = new Application_Log__c();
        //newAppLog.Message__c = status;
        newAppLog.Log_Type__c = logType;
        newAppLog.Stack_Trace__c = message;

        insert newAppLog;


    }
}
