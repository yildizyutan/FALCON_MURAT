@isTest
public class PopulationCalloutTest {
    @isTest
    public static void testFetchPopulationSuccess() {

       Test.setMock(HttpCalloutMock.class, new PopulationCalloutTestMock());

       Test.startTest();
       HttpResponse response = PopulationCallout.fetchPopulation();
       Test.stopTest();

       System.assertEquals(200, response.getStatusCode(), 'The response code is 200');
    }
}
