import { LightningElement } from 'lwc';
// ?
import { ShowToastEvent } from "lightning/platformShowToastEvent";
//Asagida istedigimiz kadar field contact object inden cekiyoruz ve form a yerlestiriyoruz.
import CONTACT_OBJECT from'@salesforce/schema/Contact';
import NAME_FIELD from "@salesforce/schema/Contact.Name"
import TYPE_FIELD from '@salesforce/schema/Contact.Title';
import INDUSTRY_FIELD from '@salesforce/schema/Contact.AccountId';
import MOBILE_FIELD from '@salesforce/schema/Contact.MobilePhone';


export default class LightningRecordForm_Contact extends LightningElement {
    //Asagida ID si verilen contact icin bilgiler gelecek ve tum degisiklikler bu ID ile gelen contact uzerinde yapilacak.
    recordId = "0038c00002or6hUAAQ";
    objectName = CONTACT_OBJECT;

    successHandler(){
        const successEvent = new ShowToastEvent({
            title: "Success",
            message: "The contact record has been saved successfully!",
            variant: "success"
        });
        this.dispatchEvent(successEvent);
    }

    errorHandler(){
        const errorEvent = new ShowToastEvent({
            title: "Error",
            message: "An Error occured while saving the contact record!",
            variant: "error"
        });
        this.dispatchEvent(errorEvent);
    }
}