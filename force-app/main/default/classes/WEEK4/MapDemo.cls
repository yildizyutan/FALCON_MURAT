
public with sharing class MapDemo {

// Building a MAP for months and their order numbers,
    
    public static string retrieveMonth(Integer mNum) {

        String month = '';

        Map<Integer, String> monthMap = new Map<Integer, String>();

            monthMap.put(1, 'JANUARY');
            monthMap.put(2, 'FEBRUARY');
            monthMap.put(3, 'MARCH');

            monthMap.put(4, 'APRIL');
            monthMap.put(5, 'MAY');
            monthMap.put(6, 'JUNE');

            monthMap.put(7, 'JULY');
            monthMap.put(8, 'AUGUST');
            monthMap.put(9, 'SEPTEMBER');

            monthMap.put(10, 'OCTOBER');
            monthMap.put(11, 'NOVEMBER');
            monthMap.put(12, 'DECEMBER');

            Boolean validateKey = monthMap.containsKey(mNum);

            if (validateKey) {
                
                month = monthMap.get(mNum);

            } else {
                
                month = 'Please provide numbers between 1 to 12';

            }
        
        return month;

        }
}
