import { LightningElement } from 'lwc';
import getAccountsByIndustry from '@salesforce/apex/AccountCtrl_LWC.getAccountsByIndustry';

const COLUMNS = [
    {label:"Account Name", fieldName:"AccountName", type:"text"},
    {label:"Account Type", fieldName:"Type", type:"text"},
    {label:"Industry", fieldName:"Industry", type:"text"},
    {label:"Annual Revenue", fieldName:"AnnualRevenue", type:"currency"}
];

export default class ImperativeApexSearchAccountsByIndustry extends LightningElement {
    columns = COLUMNS;
    selectedIndustry;
    accounts;
    error = "Select an industry to see the matching accounts...";

    handleChange(event){
        //asagidaki satir ile html arasinda baglanti kuruyoruz.
        this.selectedIndustry = event.target.value;
        //asagidaki satir ile apex cls arasinda iletisim kuruluyor.
        getAccountsByIndustry({industry: this.selectedIndustry})
            .then(result => {
                this.accounts = result;
                if(this.accounts.lenght == 0){
                    this.error = "There are no matching accounts for the selected type."
                }else{
                    this.error = undefined;
                }
            })
            .catch(error => {
                this.error = error.body.message;
                this.accounts = undefined;
            })

    }
    
    get industryOptions(){
        return[
            {label:"Agriculture", value:"Agriculture"},
            {label:"Banking", value:"Banking"},
            {label:"Biotechnology", value:"Biotechnology"},
            {label:"Consulting", value:"Consulting"}
        ];
    }
}