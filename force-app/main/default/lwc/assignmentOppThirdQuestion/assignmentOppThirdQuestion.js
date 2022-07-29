
import { LightningElement, wire } from 'lwc';

import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import opportunityByStage from '@salesforce/apex/assignmentOpportunityThirdQ.opportunityByStage';

const COLUMNS = [
    {label: "Opportunity Name", fieldName:"Name", type:"text"},
    {label: "Type", fieldName:"Type", type:"text"},
    {label: "Stage Name", fieldName:"StageName", type:"text"},
    {label: "Amount", fieldName:"Amount", type:"currency"},
    {label: "Close Date", fieldName:"CloseDate", type:"date"},
    
];


export default class AssignmentOppThirdQuestion extends LightningElement {
    columns = COLUMNS;
    selectedStage;
    opportunities;
   
    rtId;
   stageOptions=[];
   
   
  
    @wire(getObjectInfo,{objectApiName: OPPORTUNITY_OBJECT})
    objectInfoHandler({data,error}){
        if(data){
            this.rtId=data.defaultRecordTypeId;
        }
    }
    @wire(getPicklistValues,{
        fieldApiName: STAGE_FIELD, recordTypeId: "$rtId"
    })


    stageNameHandler({data,error}){
        if(data){
            this.stageOptions=this.pickListHandler(data);
        }   
    }
    

    pickListHandler(data){
        return data.values.map(item=>({
            label: item.label, 
            value: item.value
        }));
    }


    changeHandler(event) {
        
        if (event.target.name==="Stage") {
            this.selectedStage=event.target.value
        } 
        opportunityByStage({stage:this.selectedStage})
        .then(result=>{
            this.opportunities=result;
        })
        .catch(error=>{
            console.log(error);
        })
    } 
}