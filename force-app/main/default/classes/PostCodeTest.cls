@istest
public with sharing class PostCodeTest {
    @istest
    private static void testFetchPostCode() {
        PostCodeMock pC = new PostCodeMock();
        Test.setMock(HttpCalloutMock.class, pC );

        Test.startTest();

        PostalCodeCallout.fetchPostalCode('33162');
        HttpResponse response = PostalCodeCallout.fetchPostalCode('33162');

        Test.stopTest();

        system.assertEquals(200, response.getStatusCode());
    }
}


