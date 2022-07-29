//Bu uygulama icin Contact object i uzerinde iki adet Record Type kurduk. 

import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import CONTACT_OBJECT from '@salesforce/schema/Contact';

export default class ADAPTER_getObjectInfo_Contact extends LightningElement {

    defaultRtId;
    supplierRtId;

    @wire(getObjectInfo, {objectApiName: CONTACT_OBJECT})
    contactInfoHandler({data, error}){
        if (data) {
            console.log(data);
            this.defaultRtId = data.defaultRecordTypeId;
            const rtids = data.recordTypeInfos;
            this.supplierRtId = Object.keys(rtids).find(rtid => rtids[rtid].name === "Supplier Contact");
        }
        if (error) {
            console.log(error);
            //this.supplierRtId = data.defaultRecordTypeId;
        }
        
    }
}