
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity'
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName'

export default class getPickListValue_Adapter_Opportunity extends LightningElement {
    opportunityRtId;
    stageOptions = [];
    selectedStage;

    @wire(getObjectInfo, {objectApiName: OPPORTUNITY_OBJECT})
    accountInfoHandler({data, error}){
        if(data){
            this.opportunityRtId = data.defaultRecordTypeId;
        }
    }
    @wire(getPicklistValues, {fieldApiName: STAGE_FIELD, recordTypeId: '$opportunityRtId'})
    // $ isareti onune geldigi degiskeni dinamik ve reaktif yapiyor. herbir degisimde onene geldigi degiskeni update ediyor.

    //asagidaki data ve error birer object dir yanliz sObject degiller.
    pickllistHandler({data, error}){
        if(data){
            console.log(data);
            this.stageOptions = this.picklistGenerator(data);
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
        this.selectedStage = event.target.value;
    }
    
}
