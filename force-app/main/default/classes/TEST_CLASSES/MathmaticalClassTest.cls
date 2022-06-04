@isTest
public  class MathmaticalClassTest {
    @isTest
    public static void testAddition() {
        Integer a = 3;
        Integer b = 5;
        
        System.assertEquals(8, MathmaticalClass.addition(a, b));
    }
    @isTest
    public static void testSubstraction(){
        Integer c = 4;
        Integer d = 2;
        Integer sub = MathmaticalClass.subtraction(c, d);
        System.assertEquals(2, sub);
    }
    @isTest
    public static void testMultiplication(){
        Integer e = 5;
        Integer f = 2;
        Integer multi = MathmaticalClass.multiplication(5,2);
        System.assertEquals(10, multi);
    }
    @isTest
    public static void testDivision(){
        Integer g = 9;
        Integer h = 3;
        Integer div = MathmaticalClass.division(g, h);
        System.assertEquals(3, div);
    }
}
