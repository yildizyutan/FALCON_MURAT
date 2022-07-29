import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import ACCOUNTID_FIELD from '@salesforce/schema/Contact.AccountId';
import DEPARTMENT_FIELD from '@salesforce/schema/Contact.Department';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';


export default class LightningRecordEditForm_Contact extends LightningElement {
    recordId = "0038c00002qqNrnAAE";
    objectName = CONTACT_OBJECT;
    fields = {
        firstname: FIRSTNAME_FIELD,
        lastname: LASTNAME_FIELD,
        title:TITLE_FIELD,
        accId:ACCOUNTID_FIELD,
        department:DEPARTMENT_FIELD,
        email:EMAIL_FIELD
    };

    successHandler(){
        const successToast = new ShowToastEvent({
            title: 'Success',
            message: 'Contact has been saved successfully!',
            variant: 'success'
        });
        this.dispatchEvent(successToast);
    }
    errorHandler(){
        const errorToast = new ShowToastEvent({
            title: 'Success',
            message: 'Contact has been saved successfully!',
            variant: 'error'
        });
        this.dispatchEvent(errorToast);
    }
}