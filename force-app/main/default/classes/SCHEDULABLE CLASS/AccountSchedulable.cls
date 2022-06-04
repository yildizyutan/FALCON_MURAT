public with sharing class AccountSchedulable implements Schedulable{
    public void execute(SchedulableContext sc){
        database.executeBatch(new accountsBatch());
    }
}
//Bu kod belli bir tarihe ve saat e schedule etmek icin ORG a gidip setup dan Scheduled Apex aramasi yapilir ve orada schedule edilir.
