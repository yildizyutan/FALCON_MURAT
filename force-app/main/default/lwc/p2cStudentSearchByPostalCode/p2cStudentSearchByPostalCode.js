
import { LightningElement } from 'lwc';
import searchStudentsByPostalCode from '@salesforce/apex/studentCtrl.searchStudentsByPostalCode';

const COLUMNS =[
    {label:"Student Name", fieldName:"Student_Name__c", type:"text"},
    {label:"Student Class", fieldName:"Student_Class__c", type:"number"},
    {label:"Mobile Phone", fieldName:"Mobile_Phone__c", type:"phone"},
    {label:"Email", fieldName:"Email__c", type:"email"},
    {label:"Postal Code", fieldName:"Postal_Code__c", type:"text"}
];

export default class P2cStudentSearchByPostalCode extends LightningElement {
    searchWord;
    students;
    columns = COLUMNS;
    error= "Type Postal Code to match the results";
    
    changeHandler(event){
        this.searchWord=event.target.value;
        searchStudentsByPostalCode({postalCode: this.searchWord})

        .then(result =>{
            this.students = result;
            if(this.students.length == 0){
                this.error = "No matching students found. Try with an other postal code"
            }else{
                this.error = undefined;
            }
        })
        .catch(error=>{
            this.error = error.body.message;
            this.students = undefined;
        })
    }   
}