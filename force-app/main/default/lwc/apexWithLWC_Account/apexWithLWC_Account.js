import getBioTechAccounts from '@salesforce/apex/AccountCtrl_LWC.getBioTechAccounts';
import { LightningElement, wire } from 'lwc';

const COLUMNS = [
    {label: "Account Name", fieldName: "Name", type:"text"},
    {label: "Account Type", fieldName: "Type", type:"text"},
    {label: "Industry", fieldName: "Industry", type:"text"},
    {label: "Annual Revenue", fieldName: "AnnualRevenue", type:"currency"}

];

export default class ApexWithLWC_Account extends LightningElement {
    accounts;
    columns = COLUMNS;
    
    @wire(getBioTechAccounts)
    accountHandler({data, error}){
        if(data){
            this.accounts = data;
        }
        if(error){
            console.log(error);
        }
    }
}