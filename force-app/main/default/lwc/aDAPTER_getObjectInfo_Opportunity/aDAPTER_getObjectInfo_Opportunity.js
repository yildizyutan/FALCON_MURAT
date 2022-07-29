import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import OPP_OBJECT from '@salesforce/schema/Opportunity';

export default class ADAPTER_getObjectInfo_Opportunity extends LightningElement {
    defaultRtId;
    refinedRtId;
    
    @wire(getObjectInfo, {objectApiName: OPP_OBJECT})
    contactHandler({data, error}){
        if (data) {
            console.log(data);
            this.defaultRtId = data.defaultRecordTypeId;
            const rtids =data.recordTypeInfos;
            this.refinedRtId = Object.keys(rtids).find(rtid => rtids[rtid].name === "Refined Petrolium");
        }
        if (error) {
            console.log(error);
        }
    }
}