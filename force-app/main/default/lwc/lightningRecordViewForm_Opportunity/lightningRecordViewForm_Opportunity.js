import { LightningElement } from 'lwc';

import OPP_OBJECT from '@salesforce/schema/Opportunity';

import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import ACC_NAME_FIELD from '@salesforce/schema/Opportunity.AccountId';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import LEADSOURCE_FIELD from '@salesforce/schema/Opportunity.LeadSource';

export default class LightningRecordViewForm_Opportunity extends LightningElement {
    recordId = "0068c00000pUBJuAAO";
    objectApiName = OPP_OBJECT;

    fields = {
    oppName : NAME_FIELD,
    accName : ACC_NAME_FIELD,
    oppType : TYPE_FIELD,

    oppStage : STAGE_FIELD,
    oppAmount : AMOUNT_FIELD,
    oppLeadSource : LEADSOURCE_FIELD
    };

}