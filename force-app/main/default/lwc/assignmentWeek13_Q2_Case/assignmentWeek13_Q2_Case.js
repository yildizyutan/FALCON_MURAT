import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';

export default class AssignmentWeek13_Q2_Case extends LightningElement {
    recordId="5008c00001Kw6UGAAZ";

    accountName;
    subject;
    priority;
    reason;
    type;
    status;

    @wire(getRecord, {recordId: '$recordId', layoutTypes:['Full'], modes:['View']})

    caseHandler({data, error}){

        if(data){
            console.log(data);

            this.accountName = data.fields.Account.displayValue;
            this.subject = data.fields.Subject.value;
            this.priority = data.fields.Priority.displayValue;
            this.reason = data.fields.Reason.displayValue;
            this.type = data.fields.Type.displayValue;
            this.status = data.fields.Status.displayValue;
            
        }
        if(error){
            console.log(error);
        }
    }

}