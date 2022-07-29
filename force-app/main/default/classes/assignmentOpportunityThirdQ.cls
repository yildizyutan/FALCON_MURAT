public with sharing class assignmentOpportunityThirdQ {
    
    @AuraEnabled(cacheable=false)
    
    public static List<Opportunity> opportunityByStage(String stage) {
        return [SELECT Name, Type, StageName, Amount, CloseDate 
                FROM Opportunity 
                WHERE StageName= : stage ];
    }
}
