public class StringDemoClass {
    public void stringMethod1() {

//Method Variable

String sessionDescription = 'learning string method in apex language';

//1. calling lenght(), return type is integer.

Integer lengthOfStr = sessionDescription.length();
System.debug('Length of string is: '+ lengthOfStr);

//3. calling toUpperCase(), return type is String
String inCaps = sessionDescription.toUpperCase();
System.debug(inCaps);

//4. calling contains(), return is Boolean.
Boolean con = sessionDescription.contains('apex');
System.debug('has apex? '+con);

Boolean con2 = sessionDescription.contains('salesforce');
System.debug('has salesforce? '+con2);

//5. containIgnoreCase() method
Boolean con3 = sessionDescription.containsIgnoreCase('APEX');
System.debug('has APEX? '+ con3);
 
//6. equals(stringOrId) method
String apexx = 'apex';
String ap = 'APEX';
Boolean apexCheck = apexx.equals(ap);
System.debug(apexCheck);





    }
}
