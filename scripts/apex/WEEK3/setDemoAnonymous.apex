SetDemo.citySet();

SetDemo.setInteger();

List<Integer> listOfIntegers = new List<integer>();

    listOfIntegers.add(7);
    listOfIntegers.add(8);
    listOfIntegers.add(9);
    listOfIntegers.add(7);

Set<Integer> sInt = SetDemo.setFromList(listOfIntegers);

System.debug('set is; '+sInt);

/*  an other way to build a list,

List<Integer> l = new List<Integer>{10, 12,13};

l.add(14);
l.add(11);

SetDemo.setFromList(l);

 */


Set<String> cities = new set<String>();

    cities.add('Tokyo');
    cities.add('Lisbon');
    cities.add('Nairobi');
    cities.add('Tokyo');
    cities.add('Berlin');
    cities.add('Nairobi');

Set<String> capsCities = SetDemo.capitalizeSet(cities);

    System.debug('caps cities; '+capsCities);