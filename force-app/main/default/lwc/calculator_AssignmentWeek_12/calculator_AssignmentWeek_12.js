import { LightningElement, track } from 'lwc';

export default class Calculator_AssignmentWeek_12 extends LightningElement {
    @track firstNum;
    @track secondNum;
    

    handleChange1(event){
        this.firstNum = event.target.value;
    }

    handleChange2(event){
        this.secondNum = event.target.value;
    }

    get totalNum(){
        return Number(this.firstNum) * Number(this.secondNum);
    }
}