public class SetDemo {
    
    public static void citySet() {

        Set<String> cities = new set<String>();

            cities.add('Tokyo');
            cities.add('Lisbon');
            cities.add('Nairobi');
            cities.add('Tokyo');
            cities.add('Berlin');
            cities.add('Nairobi');

            System.debug('set of cities are; '+cities);

    }

    public static void setInteger() {

        Set<Integer> integers = new set<Integer>();

            integers.add(10);
            integers.add(15);
            integers.add(21);
            integers.add(15);
            integers.add(15);
            integers.add(21);

            System.debug('set of integers are; '+integers);

    }

    public static Set<Integer> setFromList(List<Integer> intList){

        Set<Integer> intSet = new Set<Integer>();
        
            intSet.addAll(intList);
        
            return intSet;

    }

    public static Set<String> capitalizeSet(set<String> setString){

        Set<String> capsSet = new set<String>();

        for (String eachStr : setString) {

            String tempStr = eachStr.toUpperCase();
            capsSet.add(tempStr);
            
        }
        
            return capsSet;

    }

}
