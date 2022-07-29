import { api, LightningElement } from 'lwc'; //burada api ekleyerek ve asgida @api ekleyerek edit formu record sayfasinda gorunecekse hangi record un sayfasinda bulunuyorsa o opp record u gosterir.
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import ACCOUNTID_FIELD from '@salesforce/schema/Opportunity.AccountId';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';


export default class LightningRecordEditForm_Opp extends LightningElement {
    //recordId = ""; if we comment this line, form will be the creating edit form
    @api recordId; // yukaridaki @api icin yazilmis aciklama bu satir a atif yapiyor.
    objectName = OPPORTUNITY_OBJECT;
    fields = {
        name: NAME_FIELD,
        stageName: STAGENAME_FIELD,
        type:TYPE_FIELD,
        amount:AMOUNT_FIELD,
        accountId:ACCOUNTID_FIELD,
        closeDate:CLOSEDATE_FIELD
    };

    successHandler(){
        const successToast = new ShowToastEvent({
            title: 'Success',
            message: 'Opportunity has been saved successfully!',
            variant: 'success'
        });
        this.dispatchEvent(successToast);
    }
}
