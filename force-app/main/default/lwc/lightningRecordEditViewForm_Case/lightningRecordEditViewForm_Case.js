/*  
 Create a lightning base component that would display the following Case fields. User should be able to edit a few fields as mentioned below
	Account Name – Read Only
	Contact Name – Read Only
	Subject - Editable
	Priority - Editable
	Status - Editable
	Description - Editable
	Origin - Editable
Show a success message upon saving the record successfully else error message in case of any errors 
*/
import { LightningElement } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//Fields for Edit Form 
import CASE_OBJECT from '@salesforce/schema/Case';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';
// fields for View Form
import ACCOUNTNAME_FIELD from '@salesforce/schema/Case.AccountId';
import CONTACTNAME_FIELD from '@salesforce/schema/Case.ContactId';

export default class LightningRecordEditViewForm_Case extends LightningElement {
    recordId = "5008c00001K3Bu6AAF";
    objectName = CASE_OBJECT;
    fieldsE = {
        subject: SUBJECT_FIELD,
        priority: PRIORITY_FIELD,
        status:STATUS_FIELD,
        description:DESCRIPTION_FIELD,
        origin:ORIGIN_FIELD,
        accName: ACCOUNTNAME_FIELD,
        contName: CONTACTNAME_FIELD,
    };
    successHandler(){
        const successToast = new ShowToastEvent({
            title: 'Success',
            message: 'Case has been saved successfully!',
            variant: 'success'
        });
        this.dispatchEvent(successToast);
    }
}