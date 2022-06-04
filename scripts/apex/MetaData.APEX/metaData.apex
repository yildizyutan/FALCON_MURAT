//List<email_domain_mdt> list = [SELECT Id, MasterLabel, Domain__c FROM Email_Domain_mdt];

Map<String, email_domain_mdt> mapEd = Email_Domain_mdt.getAll();
System.debug(allDomains);
