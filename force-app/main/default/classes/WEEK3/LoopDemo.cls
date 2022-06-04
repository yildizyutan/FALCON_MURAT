public class LoopDemo {
 //while loop
    public void print_int_while() {

        Integer count = 1;
        while (count <=5){
            System.debug('count is '+count);
            count++;
        }

    }

    public void print_while(){

        Integer count2 = 10;
        while (count2 >= 6){

            System.debug('The count is '+count2);
            count2--;

        }

    }
//for loop
    public void print_N_Numbers(Integer n){

        for (Integer i=0;  i<n;  i++ ){

            System.debug(i);

        }

    }
//String of Value metod u ---  (***   string.valueOf(p)  ***)
    public void stringValueOfString(Integer p){
        
            String s = '';

        for (Integer i = 0; i < p; i++) {
            
            s += string.valueOf(i)+','; 

        }

            System.debug('print '+s);

    }

    //addition

    public Integer print_sum_N_Numbers(Integer n){
        
        Integer sum = 0;
       
        for (Integer i = 0; i <= n; i++) {
            
            sum += i;

        }

        System.debug('summation is '+sum);

        return sum;
    }
       


}
