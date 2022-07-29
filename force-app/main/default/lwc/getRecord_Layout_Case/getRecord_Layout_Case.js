

import { getRecord } from 'lightning/uiRecordApi';
import { wire, LightningElement } from 'lwc';

export default class GetRecord_Layout_Case extends LightningElement {
    
    recordId ="5008c00001HkRLlAAN";

    caseNumber;
    status;
    priority;

    subject;
    description;
    origin;

    @wire(getRecord, {recordId: '$recordId', layoutTypes: ['Full'], modes: ['View']})

    caseHandler({data, error}){
        if(data){

            console.log(data);
            
            this.caseNumber = data.fields.CaseNumber.value;
            this.status = data.fields.Status.displayValue;
            this.priority = data.fields.Priority.displayValue;
            
            this.subject = data.fields.Subject.value;
            this.description = data.fields.Description.value;
            this.origin = data.fields.Origin.displayValue;


        }
        if(error){
            console.error(error);
            
        }
    }
}