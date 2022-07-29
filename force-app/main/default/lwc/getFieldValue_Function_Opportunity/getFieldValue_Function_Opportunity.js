//Bu kod ikinci yol ve birinci yol olarak getRecord_Layout_Opportunity LWC component i kullanilabilir.

import { getFieldValue, getRecord } from 'lightning/uiRecordApi'; 
// yukaridaki satirda getFieldValue ifadesi otomatik olarak geliyor, asagidaki getFieldValue function i seceneklerden secilmesi gerekiyor.
import { wire, LightningElement } from 'lwc';

import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.Account.Name';//burada Account degilde Account.Name kullanmaliyiz 
import OWNER_FIELD from '@salesforce/schema/Opportunity.Owner.Name';// Burada Owner yerine Owner.Name kullanmaliyiz. diger turlu hata veriyor.
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';

export default class getFieldValue_Function_Opportunity extends LightningElement {
    
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

            /* Burada getFieldValue function i ile yapmak icin asagidaki satirlar iptal olutor ve yukarida 4,5,6,7 ve 8 numarali satirlar ekleniyor. Tabi birde asagidaki fonksiyon satirlari.

            this.name = data.fields.Name.value;
            this.account = data.fields.Account.displayValue;
            this.owner = data.fields.Owner.displayValue;
            this.amount = data.fields.Amount.displayValue;
            this.closeDate = data.fields.CloseDate.displayValue;
            */ 

            this.name = getFieldValue(data, NAME_FIELD);
            this.account = getFieldValue(data, ACCOUNT_FIELD);
            this.owner = getFieldValue(data, OWNER_FIELD);
            this.amount = getFieldValue(data, AMOUNT_FIELD);
            this.closeDate = getFieldValue(data, CLOSEDATE_FIELD);
            

        }
        if(error){
            console.error(error);
            
        }
    }
}