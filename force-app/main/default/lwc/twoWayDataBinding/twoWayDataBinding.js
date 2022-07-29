import { LightningElement } from 'lwc';

export default class TwoWayDataBinding extends LightningElement {
    fullName = 'Murat Eti';
    title = 'Salesforce Developer';

    handleChange(event){
        this.title = event.target.value;
    }
}