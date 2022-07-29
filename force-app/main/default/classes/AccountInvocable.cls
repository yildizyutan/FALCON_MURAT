public with sharing class AccountInvocable {
   
    @InvocableMethod(label='Delete Closed Opps'
                     description='Delete all the closed opps when account goes Inactive or Hold'
                     category='Account')
    public static void deleteOpportunities(List<Id> accountIds){
        
        List<Opportunity> opps =[SELECT Id FROM Opportunity WHERE AccountId IN :accountIds AND StageName IN ('Closed Won', 'Closed Lost')];

        if(!opps.isEmpty()){
            delete opps;
        }
        

    }

}
