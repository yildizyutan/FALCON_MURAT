//Bu kod birinci yol ve ikinci yol olarak getFieldValue_Function_Opportunity LWC component i kullanilabilir.

import { getRecord } from 'lightning/uiRecordApi';
import { wire, LightningElement } from 'lwc';

export default class GetRecord_Layout_Opportunity extends LightningElement {
    
    recordId ="0068c00000pUBK7AAO";
    name;
    account;
    owner;
    amount;
    closeDate;

    @wire(getRecord, {recordId: '$recordId', layoutTypes: ['Compact'], modes: ['View']})

    oppHandler({data, error}){
        if(data){
            console.log(data);
            this.name = data.fields.Name.value;
            this.account = data.fields.Account.displayValue;
            this.owner = data.fields.Owner.displayValue;
            this.amount = data.fields.Amount.displayValue;
            this.closeDate = data.fields.CloseDate.displayValue;

        }
        if(error){
            console.error(error);
            
        }
    }
}