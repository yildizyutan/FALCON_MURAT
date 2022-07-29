public with sharing class AccountCtrl_LWC {
    @AuraEnabled(cacheable=true)
    public static List<Account> getBioTechAccounts(){
        List<Account> accounts = [SELECT Name, Type, Industry, AnnualRevenue 
                                    FROM Account
                                    WHERE Industry='Biotechnology'
                                    WITH SECURITY_ENFORCED];
        return accounts;
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsByType(String type){
        List<Account> accounts = [SELECT Name, Type, Industry, AnnualRevenue 
                                    FROM Account
                                    WHERE Type= :type
                                    WITH SECURITY_ENFORCED
                                    LIMIT 4];
        return accounts;
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsByIndustry(String industry){
        return [SELECT Name, Type, Industry, AnnualRevenue 
                FROM Account
                WHERE Industry=:industry
                WITH SECURITY_ENFORCED];
    }
}
