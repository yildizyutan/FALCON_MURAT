//PART 2_1
List<Opportunity> opps = [SELECT Id, name, Account.name, Account.annualrevenue FROM Opportunity WHERE Account.annualrevenue > 5000];

System.debug(opps);

//PART 2_2
List<Contact> contA = [SELECT Id, Name FROM Contact WHERE name LIKE 'a%' ];

System.debug('Contacts starting with a ; '+contA);

//Part 2_3
List<Opportunity> oppSum = [SELECT name, COUNT(Id) FROM Opportunity GROUP BY StageName];

System.debug(oppSum);