

import { LightningElement, track } from "lwc";
export default class AssignmentWeek12_Q4_Calculator extends LightningElement {
    @track firstNum=0;
    @track secondNum=0;
    total=0;
    
    handleChange1(event){
        this.firstNum = event.target.value;
        this.total=Number(this.firstNum) + Number(this.secondNum)
    }
    handleChange2(event){
        this.secondNum = event.target.value;
        this.total=Number(this.firstNum) + Number(this.secondNum)
    }    
}