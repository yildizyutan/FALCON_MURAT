public with sharing class ContactInvocable {
    @InvocableMethod(label='Send data to Go Rest' description='Sample Description' category='Contact')
    public static void ContactInvocable(List<Id> contactIds) {
        ContactCalloutForAssighnmentFlow_2.sendDataGo(contactIds);

    }
}
