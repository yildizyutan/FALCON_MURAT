public class PrimitiveDataTypeDemoClass {
    public void printBasicDataTypeDemoMethod() {

    String batchName = 'Falcons';
    Integer totalCandidate = 40;
    Boolean isAdminCompleted = true;

    System.debug('  batch name is '+ batchName);
    System.debug('  total # of candidate is '+totalCandidate);
    System.debug('  admin completed '+isAdminCompleted);

//Decimal Value
    Decimal decValue = 27.01;
    System.debug('  Decimal: '+decValue);

//Long Value
    Long longValue = 214723564895L;
    System.debug('  Long Value: '+longValue);

//Object Value
    Object obj = '  This is sample for object';
    Object obj2 = '       '+10;

    System.debug('Object: ' + obj);
    System.debug('Object2: ' + obj2);

// ID Value presents Salesforce ID
    Id id1 = '3D01p8c00000RWLZ3';
    System.debug('ID: '+ id1);

    }
}