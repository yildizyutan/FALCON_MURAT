
account acc = new account();
acc.name = 'trigger account3';
insert acc;
acc.name = 'updated trigger name';
update acc;


account acc1 = new account();
acc1.name = 'account trigger test 2';
insert acc1;

List<Contact> contList = new List<Contact>();
for (Integer i = 0; i < 7; i++) {
    Contact cont = new Contact();
    cont.AccountId = acc1.Id;
    cont.lastname = i+1 +'. contact';
    contList.add(cont);
}
if (!contList.isEmpty()) {
    insert contList;
}
///// for-i dongusu ile birden cok Account olusturulmasi(insert yapilmasi.)
list<account> listAcc = new list<account>();

for (Integer i = 0; i < 4; i++){
    account acc2 = new account();
    acc2.Name = 'SoftInnovas 10-May v'+i+' May-11-2022';
    acc2.AccountNumber = 'asci-1'+i;
    acc2.Active__c = 'Yes';
    listAcc.add(acc2);
}
if(!listAccUpdated.isEmpty()){
    insert listAcc;
}
// Yukaridaki kod coklu account un for-i dongusu ile olusturulmasi islemi.

//Buradaki kod calisir durumda
List<Account> listAccUpdated = new List<Account>();
List<Account> last5AccUpdated = [SELECT Id, Name FROM Account ORDER BY createdDate DESC LIMIT 5];
System.debug(last5AccUpdated);
for( Account accEach: last5AccUpdated){
    accEach.name = 'updated at May 10 2022';
    listAccUpdated.add(accEach);
}
if(!listAccUpdated.isEmpty()){
    update listAccUpdated;
}
//Buraya kadar olan kod son eklenen 5 tane account um SOQL ile cagrilip update edilmesi islemini iceriyor.






/* ********** */
//ASSIGNMENT 25
/*
25 - Apex Anonim kısmını kullanarak verilen bilgilerle bir tane Account insert edin. 
       Name           : Summer Fest LLC
       Parent Account : University of Arizona
       Type           : Technology Partner
       Rating         : Hot
       Annual Revenue : 200,000,000
*/
Account accNew = new Account();
accNew.Name = 'Summer Fest LLC';
accNew.Type = 'Technology Partner';
accNew.Rating = 'Hot';
accNew.AnnualRevenue = 200000000;
System.debug('accNew is; '+accNew);  //7. satir on debug screen
//insert accNew;

//ASSIGNMENT 26
/*
26 - Birinci adımda oluşturduğumuz Accounta, bağlı ve verilen bilgilerle 3 tane Contact create edin.
            Last Name    : Event Planner ( 1, 2 , 3)
            Phone        : +1 2345 7896
            Account Name : Summer Fest LLC
            Lead Source  : Web
*/
Contact cntNew = new Contact();
    cntNew.AccountId = accNew.Id;

List<Contact> cntList = new List<Contact>();
    for(Integer i=0; i<3 ;i++){
        cntNew.LastName =  'Event Planner '+ i;
        cntNew.Phone = '+1 2345 7896 '+i;
        cntNew.LeadSource = 'Web';
        cntList.add(cntNew);
    }
    System.debug('cntNew is; '+cntNew); //30. satir on debug screen