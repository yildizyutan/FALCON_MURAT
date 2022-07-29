import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import LEAD_OBJECT from '@salesforce/schema/Lead';
import LEADSOURCE_FIELD from '@salesforce/schema/Lead.LeadSource';

export default class getPickListValue_Lead extends LightningElement {
    accountRtId;
    leadSourceOptions = [];
    selectedLeadSource;

    @wire(getObjectInfo, {objectApiName: LEAD_OBJECT})
    accountInfoHandler({data, error}){
        if(data){
            this.accountRtId = data.defaultRecordTypeId;
        }
    }
    @wire(getPicklistValues, {fieldApiName: LEADSOURCE_FIELD, recordTypeId: '$accountRtId'})
    // $ isareti onune geldigi degiskeni dinamik ve reaktif yapiyor. herbir degisimde onene geldigi degiskeni update ediyor.

    //asagidaki data ve error birer object dir yanliz sObject degiller.
    pickllistHandler({data, error}){
        if(data){
            console.log(data);
            this.leadSourceOptions = this.picklistGenerator(data);
        }
        if(error){
            console.error(error);
        }
    }
    picklistGenerator(data){
        return data.values.map(item => ({
            label: item.label,
            value: item.value
        }));
    }
    changeHandler(event){
        this.selectedLeadSource = event.target.value;
    }
    
}