public with sharing class OpportunityCtrlLWC {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpps(){
        List<Opportunity> opps = [SELECT Name, Amount, StageName, Type 
                                    FROM Opportunity 
                                    WHERE Amount > 1000000 WITH SECURITY_ENFORCED];
        return opps;
    }
    
}
