import { LightningElement } from 'lwc';
import searchContacts from '@salesforce/apex/contactCtrl_WiredApex.searchContacts';

const COLUMNS = [
    {label:"First Name", fieldName:"FirstName", type:"text"},
    {label:"Last Name", fieldName:"LastName", type:"text"},
    {label:"Title", fieldName:"Type", type:"text"},
    {label:"Department", fieldName:"Department", type:"text"}
]

export default class ImperativeApexSearchContacts extends LightningElement {
    
    searchWord;
    contacts;
    error = 'Start entering key word to get matching contact...';
    columns = COLUMNS;

    handleChange(event){
        this.searchWord = event.target.value;
        searchContacts({searchKey: this.searchWord})
            .then(result=>{
                this.contacts=result;
                if(this.contacts.length == 0){
                    this.error = "There are no matching contact for your search..." + this.searchWord + ". Please try an other search.";
                }else{
                    this.error = undefined;
                }
            })
            .catch(error => {
                console.log(error)
                this.error = error.body.message;
                this.contacts = undefined;
            })
    }
}