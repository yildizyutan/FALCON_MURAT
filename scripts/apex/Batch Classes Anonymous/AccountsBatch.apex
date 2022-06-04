//AccountsBatch ab = new AccountsBatch();
//Id batchId = Database.executeBatch(ab, 5);

Map<String, Country_Code__c> msc = Country_Code__c.getAll();
System.debug('Country code ; '+ msc);

for (String eachCountry : msc.keySet()) {
    System.debug('Country = '+ eachCountry + ' , code; '+ msc.get(eachCountry).Country_Code__c);
}