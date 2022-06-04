Account a = new account();
a.Name = 'Mona';
a.phone = '';
a.AnnualRevenue = 90909854;

account b = new account();
b.name = 'Lisa';
b.Phone = '987654123';
b.site = '';
//from list we created
List<account> ab = new list<account>{a,b};
string accountJSON1 = JSON.serialize(ab);
system.debug(accountJSON1);

//from SOQL
list<account> listAccount = [select id, name, phone, site, annualrevenue from account limit 5];
string accountJSON22 = JSON.serialize(listAccount);
system.debug(accountJSON22);
// after execute this code here in apex file go to org copy the debug message and copy it in .json file then right click and choose the format type as .json.