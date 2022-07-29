import { LightningElement } from 'lwc';

export default class Getters extends LightningElement {
    fruits=['Apple', 'Banana', 'Orange'];

    get firstFruit(){
        return this.fruits[0];
    }

    num1=20;
    num2=10;

    get sumOfNumbers(){
        return this.num1+this.num2;
    }
}
