import { LightningElement } from 'lwc';

import CONTACT_OBJECT from '@salesforce/schema/Contact';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import ACCOUNTNAME_FIELD from '@salesforce/schema/Contact.AccountId';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import OWNER_FIELD from '@salesforce/schema/Contact.OwnerId';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import MOBILE_FIELD from '@salesforce/schema/Contact.MobilePhone';

export default class LightningRecordViewForm_Contact extends LightningElement {
    recordId = "0038c00002or6hUAAQ";
    objectName = CONTACT_OBJECT;

    name = NAME_FIELD;
    accountName = ACCOUNTNAME_FIELD;
    email = EMAIL_FIELD;
    owner = OWNER_FIELD;
    title = TITLE_FIELD;
    phone = PHONE_FIELD;
    mobile = MOBILE_FIELD;

    /*Asagidaki sekilde de variable lari kurabiliriz.c/conditionalRendering1
    fields = {
        name : NAME_FIELD,
        accountName : ACCOUNTNAME_FIELD,
        email : EMAIL_FIELD,
        owner : OWNER_FIELD,
        title : TITLE_FIELD,
        phone : PHONE_FIELD,
        mobile : MOBILE_FIELD, 
    }
    */

}