import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import ACCOUNT_OBJECT from '@salesforce/schema/Account'
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry'

export default class getPickListValue_Adapter_Account extends LightningElement {
    accountRtId;
    industryOptions = [];
    selectedIndustry;

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    accountInfoHandler({data, error}){
        if(data){
            this.accountRtId = data.defaultRecordTypeId;
        }
    }
    @wire(getPicklistValues, {fieldApiName: INDUSTRY_FIELD, recordTypeId: '$accountRtId'})
    // $ isareti onune geldigi degiskeni dinamik ve reaktif yapiyor. herbir degisimde onene geldigi degiskeni update ediyor.

    //asagidaki data ve error birer object dir yanliz sObject degiller.
    pickllistHandler({data, error}){
        if(data){
            console.log(data);
            this.industryOptions = this.picklistGenerator(data);
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
        this.selectedIndustry = event.target.value;
    }
    
}