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