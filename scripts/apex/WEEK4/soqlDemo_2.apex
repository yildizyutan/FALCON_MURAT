SoqlDemo_2.childToParent_Soql1();
SoqlDemo_2.sampleSoql4();

// CHILD TO PARENT

//SELECT Id, name, Account.name FROM Contact WHERE Account.Industry = 'Energy'

/*
SELECT 
Id, name, Subject__c, priority__c, 

Salesforce_project_r.Project_name__c, Salesforce_Project__r.status__c 

FROM Salesforce_ticket__c
*/

SELECT id, name, project_name__c, 

(SELECT name, Subject__c, priority__c FROM Salesforce_tickets__r) 

FROM Salesforce_Project__c
