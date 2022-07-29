import { getFieldValue, getRecord, updateRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

//3. adim
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import DESC_FIELD from '@salesforce/schema/Case.Description';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
//4. adim
const FIELDS = [SUBJECT_FIELD, DESC_FIELD, PRIORITY_FIELD];

export default class UpdateRecordCase extends LightningElement {
    //1. adim,
    recordId = "5008c00001KvKitAAF";
    //12. adim
    formdata = {};
    //6. adim
    subject;
    desc;
    priority;

    //2. adim
    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
    //5. adim
    caseRecordHandler({data, error}){
        if(data){
            //7. adim
            this.subject = getFieldValue(data, SUBJECT_FIELD);
            this.desc = getFieldValue(data, DESC_FIELD);
            this.priority = getFieldValue(data, PRIORITY_FIELD);

        }
        if(error){
            console.error(error);
            
        }
    }

//8. adim  Html

//9. adim
    get priorities(){
        return [
            {label: "High", value: "High"},
            {label: "Medium", value: "Medium"},
            {label: "Low", value: "Low"}
        ]
    }

    //10. adim
    changeHandler(event){
        const{name, value} = event.target;
        this.formdata[name] = value;
        this.formdata["Id"] = this.recordId;
    }
    updateCase(){
        const recordInput = {fields: this.formdata};
        updateRecord(recordInput)

        .then(result =>{
            console.log(result);
            this.prepareToast("Success", "Case Updated!", "success");
        })
        .catch(error=>{
            console.log(error);
            this.prepareToast("Error", "Case has not been Updated!", "error");
        })
    }
    prepareToast(title, message, variant){
        const toast = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(toast);
    }
}