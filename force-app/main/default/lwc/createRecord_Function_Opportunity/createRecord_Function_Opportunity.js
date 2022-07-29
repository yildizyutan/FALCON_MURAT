import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName' 
import { createRecord } from 'lightning/uiRecordApi';

export default class CreateRecord_Function_Opportunity extends LightningElement {
    formdata = {};

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
        
        const {name, value} = event.target;
        this.formdata[name] = value;
        console.log(this.formdata);

    }

    createOpportunity(){

        const recordInput = {
            
            apiName: OPPORTUNITY_OBJECT.objectApiName, 
            
            //yukarida apiName oldugu icin objectAPI Name i alabilmek icin CONTACT_OBJECT in sonuna ekliyoruz. boylece contact a ait tum fiel lara ulasabiliyoruz.
            
            fields: this.formdata

        }
        
        //asagida createRecord(recordInput: recordInput) olmasi gerekiyor ancak const adi ile ayni oldugu icin sadece bir kez yazilir ve mapping isini js halleder.
        
        createRecord(recordInput)
            .then(result => {
                //console.log(success);              
                //this.template.querySelector('form.contact').reset();
                console.log(result);
                this.displayToast("Success", "Opportunity has been created successfully!", "success");
                this.template.querySelector('form.OpportunityForm').request();
                this.formdata={};
            })
            .catch(error => {
                //console.log(error);
                console.error(error);
                this.displayToast("Error", error.body.message, "error");
            })
            
    }
    displayToast(title, message, variant){
        const toast = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(toast);
    }    
}
