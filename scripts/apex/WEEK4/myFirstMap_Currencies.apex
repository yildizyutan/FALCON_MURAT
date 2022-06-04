
// MAP (most Important COLLECTION).

// Building MAP,
    //key\\value//      mapName                   
    Map<String,String> currenciesOfCountries = new Map<String,String>();

// Adding key and values in to the MAP, // mapName.put(key, value) \\
    currenciesOfCountries.put('USA', 'Dollar');
    currenciesOfCountries.put('JAPAN', 'Yen');
    currenciesOfCountries.put('FRANCE', 'Euro');
    currenciesOfCountries.put('INDIA', 'Rupees');
    currenciesOfCountries.put('INDIA', 'Rupee');
    currenciesOfCountries.put('TURKEY', 'Lira');
    currenciesOfCountries.put('ITALY', 'Liret');

// Debugging MAP
    System.debug('The Map for currencies is; '+ currenciesOfCountries );

// Getting a value from a MAP, // mapName.get(key) \\
    String indiaCurrency = currenciesOfCountries.get('INDIA');
        System.debug('The currency for India; '+indiaCurrency);

    String turkeyCurrency = currenciesOfCountries.get('TURKEY');
        System.debug('The currency for Turkey; '+turkeyCurrency);

// Getting all keys from MAP, // mapName.keySet() \\(using "SET" format)
    Set<String> countrySet = currenciesOfCountries.keySet();
        System.debug('The countries in "SET" format from the MAP ; '+ countrySet);

// Getting all values from MAP, // mapName.values() \\(using "LIST" format)
    List<String> currenciesList = currenciesOfCountries.values();
        System.debug('The currencies in "LIST" format from the MAP; '+ currenciesList);

// printing MAP; Getting and printing (key and values) together by FOR LOOP, we need to use key or value.

    for(String eachKey: countrySet){

        String printingMapWithKey = 'Country is; '+eachKey;
        
        String eachValue = currenciesOfCountries.get(eachKey);
        String printingValue = 'Currency is; '+ eachValue;

        printingMapWithKey += ', and currency for '+eachKey+' is '+eachValue;

        System.debug(printingMapWithKey);

    }

// Building a MAP for months and their order numbers,

String rMonth = MapDemo.retrieveMonth(12);
    System.debug(rMonth);