import getOpps from '@salesforce/apex/OpportunityCtrlLWC.getOpps';
import { LightningElement, wire } from 'lwc';

const COLUMNS = [
    {label: "Opp Name", fieldName:"Name", type:"text"},
    {label: "Opp Amount", fieldName:"Amount", type:"currency"},
    {label: "Opp Stage", fieldName:"StageName", type:"text"},
    {label: "Opp Type", fieldName:"Type", type:"text"},
]

export default class ApexWithLwc_Opportunity extends LightningElement {
    opps;
    columns = COLUMNS;

    @wire(getOpps)
    oppHandler({data, error}){
        if(data){
            this.opps = data;
        }
        if(error){
            console.log(error);
        }
    }
}
