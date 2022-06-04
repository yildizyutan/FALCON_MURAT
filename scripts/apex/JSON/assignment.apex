
List<account> acc = [SELECT name, Id FROM Account LIMIT 5];
string accountJSON1 = JSON.serialize(acc);
system.debug(accountJSON1);