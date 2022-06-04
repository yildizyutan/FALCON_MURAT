public with sharing class OperationsHelper {
    //Assignment 2 Question 4.1 
    public decimal largestOutOfTwoNumbers(decimal a, decimal b){
        if(a > b){
            return a;
        }
        return b;
    }
    //Assignment 2 Question 4.2
    public static decimal smallestOutOfThreeNumbers(decimal a, decimal b, decimal c){
        if(a < b && a < c){
            return a;
        }
        else if(b < a && b< c){
            return b;
        }
        return c;
    }
    //Assignment 2 Question 4.3
    public static Integer sumofPositiveIntegers(Integer n){
        Integer sum;
        if(n<0){
            sum = null;
            system.debug('We are not calculating the sum for negative numbers');
        } else {
            sum = 0;
            for(Integer i = 1; i <= n; i++){
                sum = sum + i;
            }
        }
        return sum;
    }

    public static Integer sumofPositiveIntegers(Integer n1, Integer n2){
        Integer sum=n1;
        for(Integer i = n1+1; i <= n2; i++){
            sum = sum + i;
        }
        return sum;
    }
    //Assignment Week 3 Solution part 2.1.a
    public static decimal sumofListValues(List<Decimal> values){
        Decimal sum;
        if(values.size() > 0 ){
            sum = 0;
            for(Decimal val : values){
                sum = sum + val;
            }
        } else {
            system.debug('Please provide values to do the operation');
        }
        return sum;        
    }
    //Assignment Week 3 Solution part 2.1.b
    public static decimal averageOfListValues(List<Decimal> values){
        decimal average;
        if(values.size()>0){
            decimal sum = sumofListValues(values);
            average = sum/values.size();
            system.debug('values.size() '+values.size());
        } else  {
            average = NULL;
            system.debug('Please provide values to do the operation');
        }
        return average;
    }
    //Assignment Week 3 Solution part 2.1.c
    public static decimal highestOfListValues(List<Decimal> values){
        decimal highestElement;
        if(values.size()>0){
            highestElement = values[0];
            for(Decimal val : values){
                if(val > highestElement){
                    highestElement = val;
                }
            }
        } else {
            highestElement = NULL;
            system.debug('Please provide values to do the operation');
        }
        return highestElement;
    }
    //Assignment Week 3 Solution part 2.1.d
    public static decimal lowestOfListValues(List<Decimal> values){
        decimal lowestElement;
        if(values.size()>0){
            lowestElement = values[0];
            for(Decimal val : values){
                if(val < lowestElement){
                    lowestElement = val;
                }
            }
        } else {
            lowestElement = NULL;
            system.debug('Please provide values to do the operation');
        }
        return lowestElement;
    }
    //Assignment Week 3 Solution part 2.2
    public static List<Decimal> reverseOrderPrint(List<Decimal> values){
        List<Decimal> rValues = new List<Decimal>();
        if(values.size() > 0){
            for(integer i=values.size()-1; i>=0; i--){
                System.debug(values[i]);
                rValues.add(values[i]);
            }
        }
        else {
            system.debug('Please provide values to do the operation');
        }
        return rValues;
    }
}
