@isTest
public class CalculatorTest {
    @isTest
    public static void testMessages() {
        Calculator.welcomeMessage();
        Calculator.printNewMessage('This message is from TEST class');
    }
    @isTest
    public static void addTest1(){
        integer i = 10;
        integer j = 15;
        integer k = 11;
        integer calcAdd = Calculator.add(i, j, k);
        System.assertEquals(36, calcAdd);
    }
    @isTest
    public static void addTest2(){
        List<Integer> intList = new List<Integer>{1,2,3,4,5,6,7,8};

        Calculator.add(intList);
        System.assertEquals(36, Calculator.add(intList));
    }
}
