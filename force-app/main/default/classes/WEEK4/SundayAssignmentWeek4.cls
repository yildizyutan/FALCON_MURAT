/*
PART D → SOQL In Apex and DML 
Create a class named as AccConAndOppOperations and Write methods for each of the following 
requirements:
*/
public with sharing class SundayAssignmentWeek4 {
    /*
    1. Write the logic to fetch and return all the accounts. Include account name, annual revenue, type, and source of account.
    */
    public static List<Account> part_D_1() {

        List<Account> partD1 = [SELECT name, annualrevenue, type, AccountSource FROM Account];
        
            return partD1;
            
    }
    /* 
    2. Find all the opportunities which has Lead Source as 'Web' and Stage as 'Closed Lost'. Make it 
    dynamic so that it works for other stages and Lead sources as well.
    */
    public static void part_D_2(String source, String stage){

        List<Opportunity> partD2 = [SELECT id, name FROM Opportunity WHERE LeadSource = :source AND stageName = :stage];

        System.debug('The list is '+ PartD2);
    }
    /*
    3. Print the Annual revenue and name of all the accounts of type 'Customer - Direct' and print the Opportunity Name and Amount for the related 'Closed Won' opportunities. Each opportunity record should be printed in different line.
    */
    public static void part_D_3(){

        List<Account> partD3acc_opp = new List<Account>();
        
        partD3acc_opp = [SELECT annualrevenue, name, (SELECT name, amount FROM Opportunities WHERE stagename = 'Closed Won') FROM Account WHERE Type = 'Customer - Direct'];

        for (Account acc : partD3acc_opp) {
            System.debug('Account Name is; '+ acc.name+' Account Annual Revenue; '+acc.AnnualRevenue);

            for (Opportunity opp : acc.Opportunities) {
                System.debug('Opportunity Name is; '+opp.name);
                System.debug('Opportunity Amount; '+opp.amount);
            }
        }  
    }

    /*
    4. Write a method which should return the account record after creating it. Take Name, Annual 
    Revenue, Type as input parameters and populate the values in account record. If Name is not 
    provided, then do not create the account and show a message like Account without name 
    cannot be created. 
    */

    public static Account part_D_4(String accName, Decimal annRev, String accType){

        Account acc = new Account();
        acc.name = accName;
        acc.annualrevenue = annRev;
        acc.type = accType;

        //insert acc;
        return acc;

    }
}
