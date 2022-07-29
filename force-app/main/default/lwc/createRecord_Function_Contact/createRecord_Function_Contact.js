import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CONTACT_OBJECT from '@salesforce/schema/Contact';
import { createRecord } from 'lightning/uiRecordApi';



export default class CreateRecord_Function_Contact extends LightningElement {
    //recordId="$recordId";
    //apiName =  CONTACT_OBJECT.objectApiName;  
    formdata = {};

    changeHandler(event){
        
        const {name, value} = event.target;
        this.formdata[name] = value;
        console.log(this.formdata);

    }

    createContact(){

        const recordInput = {
            
            apiName: CONTACT_OBJECT.objectApiName, 
            
            
            //yukarida apiName oldugu icin objectAPI Name i alabilmek icin CONTACT_OBJECT in sonuna ekliyoruz. boylece contact a ait tum fiel lara ulasabiliyoruz.
            
            fields: this.formdata

        }
        
        //asagida createRecord(recordInput: recordInput) olmasi gerekiyor ancak const adi ile ayni oldugu icin sadece bir kez yazilir ve mapping isini js halleder.
        
        createRecord(recordInput)
            .then(result => {
                //console.log(success);              
                //this.template.querySelector('form.contact').reset();
                console.log(result);
                this.displayToast("Success", "Contact has been created successfully!", "success");
                this.template.querySelector('form.contactForm').request();
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