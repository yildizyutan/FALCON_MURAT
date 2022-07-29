import { LightningElement } from 'lwc';

import { ShowToastEvent } from "lightning/platformShowToastEvent";

import OPP_OBJECT from '@salesforce/schema/Opportunity';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import ACC_NAME_FIELD from '@salesforce/schema/Opportunity.AccountId';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import LEADSOURCE_FIELD from '@salesforce/schema/Opportunity.LeadSource';

export default class LightningRecordForm_Opportunity extends LightningElement {
    recordId = "";
    objectApiName = OPP_OBJECT;
    fields = [NAME_FIELD, ACC_NAME_FIELD, TYPE_FIELD, STAGE_FIELD, AMOUNT_FIELD, LEADSOURCE_FIELD];

    successHandler(){
        const successEvent = new ShowToastEvent({
            title:"Success",
            message:"The opportunity record has been saved successfully!",
            variant:"success"
        });
        this.dispatchEvent(successEvent);
    }

}