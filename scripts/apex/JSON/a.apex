// VITAP-DERS NOTU
// Account to JSON
// PART 1
Account a = new account();
a.Name = 'Mona';
a.phone = '';
a.AnnualRevenue = 90909854;

account b = new account();
b.name = 'Lisa';
b.Phone = '987654123';
b.site = '';

List<account> ab = new list<account>{a,b};
string accountJSON1 = JSON.serialize(ab);
system.debug(accountJSON1);

// PART 2
list<account> listAccount = [select id, name, phone, site, annualrevenue from account limit 5];
string accountJSON22 = JSON.serialize(listAccount);
system.debug(accountJSON22);


// JSON to Account and List of Account
string jsonAccountString = '{"Name":"JsonToApex", "Type":"Prospect", "AnnualRevenue":50}';
Object ob = JSON.deserialize(jsonAccountString, Account.class);
Account acc = (Account)ob;
insert acc;


string jsonAccountString2 = '[{"Name":"HERO", "Type":"Prospect", "AnnualRevenue":50}, {"Name":"Json To Apex HERO", "Type":"Prospect", "AnnualRevenue":509999999999}]';
Object ob = JSON.deserialize(jsonAccountString2, List<Account>.class);
List<Account> listacc = (List<Account>)ob;
insert listacc;

// Buraya kadar





Account acc1 = new Account();
acc1.Name = 'JSON-1_serialize';
acc1.Phone = '78562443889';
acc1.AnnualRevenue= 150000 ;

Account acc2 = new Account(Name = 'JSON-2_serialize', phone = '987653452', AnnualRevenue = 260000);
Account acc3 = new Account(Name = 'Json-3_serialize', phone = '', AnnualRevenue = 300000);
Contact cont1 = new Contact();
cont1.AccountId = acc3.Id;
cont1.LastName = ' JSON';
cont1.FirstName = 'Method';

List<Account> listAcc = new List<Account>{acc1, acc2, acc3};
List<Contact> listCont = new List<Contact>{cont1};

// SERIALIZE islemi sonrasi disaridan bize gelen veya SOQL ile sistemden cektigimiz bilgileri daha kolay okunabilmesi icin "JSON.serializePretty()" methodu ile yazdiriyoruz.
String jsonAcc = JSON.serializePretty(listAcc);
System.debug(jsonAcc);

String jsonCont = JSON.serializePretty(listCont);
System.debug(jsonCont);

//DESERIALIZE ; Bu islem yapildiktan sonra olusan liste DML icin hazir hale geliyor. Insert, update veya upsert yapabiliriz.
//Asagida jsonToAcc degiskeni yukarida olusturulan acc1, acc2, acc3 e ait. 
String jsonToObAcc = '[ { "attributes" : {"type" : "Account"},"Name" : "JSON-1_serialize","Phone" : "78562443889" , "AnnualRevenue" : 150000}, {"attributes" : {"type" : "Account"},"Name" : "JSON-2_serialize","Phone" : "987653452","AnnualRevenue" : 260000}, {"attributes" : {"type" : "Account"},"Name" : "Json-3_serialize","Phone" : "","AnnualRevenue" : 300000} ]';

List<Account> accJSON = (List<Account>)JSON.deserialize(jsonToObAcc, List<Account>.class);
System.debug(accJSON);

String jsonToObCont = ' [ {"attributes" : {"type" : "Contact"},"AccountId" : null,"LastName" : " JSON","FirstName" : "Method"} ] ';

List<Contact> contJSON = (List<Contact>)JSON.deserialize(jsonToObCont, List<Contact>.class);
System.debug(contJSON);
