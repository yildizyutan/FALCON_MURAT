    /*
        1. Write the logic to fetch and return all the accounts. Include account name, annual revenue, type, and source of account.
    ***Burada bir list in return yapilmasi var***
    */

List<Account> rPartD1 = SundayAssignmentWeek4.part_D_1();

System.debug('the return list is '+rPartD1);


    /* 
    2. Find all the opportunities which has Lead Source as 'Web' and Stage as 'Closed Lost'. Make it 
    dynamic so that it works for other stages and Lead sources as well.
    */
SundayAssignmentWeek4.part_D_2('Web', 'Closed Lost');

/*
    3. Print the Annual revenue and name of all the accounts of type 'Customer - Direct' and print the Opportunity Name and Amount for the related 'Closed Won' opportunities. Each opportunity record should be printed in different line.
    */

    SundayAssignmentWeek4.part_D_3();

    /*
    4. Write a method which should return the account record after creating it. Take Name, Annual 
    Revenue, Type as input parameters and populate the values in account record. If Name is not 
    provided, then do not create the account and show a message like Account without name 
    cannot be created. 
    */

 Account acc1 = SundayAssignmentWeek4.part_D_4('a', 12, 'Customer - Direct');
insert acc1;
 System.debug(acc1);   




