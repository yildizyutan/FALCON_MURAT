@isTest
public class OperationsHelperTest {
    @isTest
    public static void testLargestOutOfTwoNumbers() {
        Decimal a = 5;
        Decimal b = 3;
        
        OperationsHelper op = new OperationsHelper();
        op.largestOutOfTwoNumbers(a, b);

        System.assertEquals(a, op.largestOutOfTwoNumbers(a, b));
    }

    @isTest
    public static void testSmallestOutOfThreeNumbers() {
        
        System.assertEquals(4, OperationsHelper.smallestOutOfThreeNumbers(6, 4, 7));

        
        System.assertEquals(3, OperationsHelper.smallestOutOfThreeNumbers(3, 5, 7));

        
        System.assertEquals(3, OperationsHelper.smallestOutOfThreeNumbers(56, 67, 3));
    }
    @isTest
    public static void testsumofPositiveIntegers() {
      
        System.assertEquals(6, OperationsHelper.sumofPositiveIntegers(3));
        System.assertEquals(Null, OperationsHelper.sumofPositiveIntegers(-3));
        //System.assertEquals(6, OperationsHelper.sumofPositiveIntegers(4));
        //System.assertEquals(6, OperationsHelper.sumofPositiveIntegers(-3));
        
    }
    @isTest
    public static void testsumofPositiveIntegers2() {
      
        System.assertEquals(10, OperationsHelper.sumofPositiveIntegers(1, 4));
        
        
    }

    @isTest
    public static void testsumofListValues() {
      
        List<Decimal> values = new List<Decimal>{1,2,3};
        System.assertEquals(6, OperationsHelper.sumofListValues(values));
        
        
    }

    @isTest
    public static void testaverageOfListValues() {
      
        List<Decimal> values = new List<Decimal>{1,2,3};
        System.assertEquals(2, OperationsHelper.averageOfListValues(values));
        
        List<Decimal> values2 = new List<Decimal>{};
        System.assertEquals(NULL, OperationsHelper.averageOfListValues(values2));
        
        
    }
    @isTest
    public static void testhighestOfListValues() {
      
        List<Decimal> values = new List<Decimal>{1,2,3};
        System.assertEquals(3, OperationsHelper.highestOfListValues(values));

        List<Decimal> values2 = new List<Decimal>{};
        System.assertEquals(NULL, OperationsHelper.highestOfListValues(values2));
        
        
    }
    @isTest
    public static void testlowestOfListValues() {
      
        List<Decimal> values = new List<Decimal>{1,2,3};
        System.assertEquals(1, OperationsHelper.lowestOfListValues(values));

        List<Decimal> values2 = new List<Decimal>{};
        System.assertEquals(NULL, OperationsHelper.lowestOfListValues(values2));
        
        
    }
    @isTest
    public static void testreverseOrderPrint() {
      
        List<Decimal> values = new List<Decimal>{1,2,3};
        List<Decimal> values2 = new List<Decimal>{3,2,1};
        
        System.assertEquals(values2, OperationsHelper.reverseOrderPrint(values));
        System.assertEquals(values, OperationsHelper.reverseOrderPrint(values2));
        
        
    }
    
    
}
