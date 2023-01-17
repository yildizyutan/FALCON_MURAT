
import { LightningElement, wire } from 'lwc';

import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';

import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';

export default class AssignmentWeek13_Q1_Opportunity extends LightningElement {
   rtId;
   stageOptions=[];
   typeOptions=[];
   oppName;
   selectedStage;
   selectedType;
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
    @wire(getPicklistValues,{
        fieldApiName: TYPE_FIELD, recordTypeId: "$rtId"
    })
    typeHandler({data,error}){
        if(data){
            this.typeOptions=this.pickListHandler(data);
        }   
    }
    pickListHandler(data){
        return data.values.map(item=>({
            label: item.label, 
            value: item.value
        }));
    }
    changeHandler(event) {
        if (event.target.name==="oppName") {
            this.oppName=event.target.value
        } 
        if (event.target.name==="Type") {
            this.selectedType=event.target.value
        } 
        if (event.target.name==="Stage") {
            this.selectedStage=event.target.value
        } 
    } 
}