@istest
public with sharing class QuoteCalloutTest {
    @istest
    private static void testFetchQuote() {
        QuoteCalloutMock qm = new QuoteCalloutMock();
        Test.setMock(HttpCalloutMock.class, qm );

        Test.startTest();

        QuoteCallout.fetchQuotes();
        HttpResponse response = QuoteCallout.fetchQuotes();


        //HttpResponse response = QuoteCallout.fetchQuotes();
        Test.stopTest();

        system.assertEquals(200, response.getStatusCode());
    }
}
