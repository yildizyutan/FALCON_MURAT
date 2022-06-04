
//List<Integer> listInt = new List<Integer>{2, 5};
//TryCatchAssignment.tryCatchMethod(listInt);

/*
try {
    Contact cont1 = new Contact();
    cont1.lastname = 'test';
    insert cont1;
} catch (Exception ex) {
    System.debug('status is required');
}
*/


Contact cont1 = new Contact();
cont1.lastname = ' test 1';
cont1.status__c = 'Completed';

Contact cont2 = new Contact();
cont2.lastname = ' test 2';
cont2.status__c = 'Completed';

Contact cont3 = new Contact();
cont3.lastname = ' test 1';


Contact cont4 = new Contact();
cont4.lastname = ' test 2';

List<Contact> listCont = new List<Contact>{cont1, cont2, cont3, cont4};

List<Database.SaveResult> results = Database.insert(listCont, false);

for(Database.SaveResult eachResult: results){
    if (eachResult.isSuccess()) {
        System.debug('Contact is successfully inserted and contact Id is; '+ eachResult.getId());
    }else{
        System.debug('Error; '+ eachResult.getErrors());
    }
}
