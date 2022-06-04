public class TryCatchAssignment {
    public static void tryCatchMethod(List<Integer> aAndb) {
        try{
            Integer sum = 0;
            
            for (Integer intEach : aAndb) {
                sum = intEach + sum; 
            }
            if (sum>0) {
                System.debug('The sum is; '+sum);
            }
        }catch(Exception ex){
            for(Integer intEach : aAndb){
                System.debug('Error to calculate sum');
            }
        }
        
    }

    public static void tryCatchHandler(List<Contact> listContNew) {
        
            for (Contact contEach : listContNew) {
            
                if (contEach.status__c == NULL) {
                    contEach.status__c.addError('status is required');
                }
            }
        
        
    }

}
