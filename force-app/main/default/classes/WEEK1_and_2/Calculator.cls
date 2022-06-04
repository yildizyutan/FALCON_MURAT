public class Calculator {
    
    public static void welcomeMessage() {

        System.debug('Welcome to Apex calc (Calculator) Class');  

    }
    public static void printNewMessage(String msg){

        System.debug(msg);

    }
    public static integer add(integer a, integer b, integer c){

        integer sum = a+b+c;
        // return sum; 

        return a+b+c;    
    }

    public static integer add(List<integer> intList){

        integer sum = 0;

        for (integer eachInt : intList) {
            
            sum += eachInt; 

        }
        
        return sum;

    }

}
