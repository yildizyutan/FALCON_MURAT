import { LightningElement, wire } from 'lwc';
import getAccByType from '@salesforce/apex/AccountCtrl_LWC.getAccountsByType';

export default class WiredApexAccountsByType extends LightningElement {
    accountType="Prospect";
    accounts;

    @wire(getAccByType, {type:'$accountType'})
    
    accountHandler({data, error}){
        if(data){
            console.log(data);
            this.accounts = data;
        }
        if(error){
            console.log(error);
        }
    }
}