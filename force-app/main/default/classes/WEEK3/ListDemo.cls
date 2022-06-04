public class ListDemo {
    
    
    public static void candidatesList() {
        // writing list
        List<String> listOfCandidates = new List<String>();
       
        //Adding elements in list
        listOfCandidates.add('Marc');
        listOfCandidates.add('Elon');
        listOfCandidates.add('Bill');
        listOfCandidates.add('Marc');

        System.debug('Candidates are '+ listOfCandidates);


    }

    public static void randomIntegerList(){

        List<Integer> listOfInteger = new List<Integer>();

        listOfInteger.add(10);
        listOfInteger.add(15);
        listOfInteger.add(21);
        listOfInteger.add(15);
        listOfInteger.add(15);

        System.debug('List of random Integers are '+ listOfInteger );

        // get(...); index of list element as below.
        
        // first way
        Integer indexOf3rdElement = listOfInteger.get(3);

        // second way
        Integer indexOf3rdElement2 = listOfInteger[3];
        
        System.debug( 'The index is '+ indexOf3rdElement + ' and '+ indexOf3rdElement2 +' for 4th element in the list');

    }

    public static void iterateIntegerList(){

        List<Integer> listInteger = new List<Integer>();
            
            listInteger.add(10);
            listInteger.add(15);
            listInteger.add(21);
            listInteger.add(15);

        for (integer eachInteger : listInteger) {
            
        } 



    }
}
