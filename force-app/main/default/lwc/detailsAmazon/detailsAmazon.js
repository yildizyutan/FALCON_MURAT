import { LightningElement, track } from 'lwc';

export default class DetailsAmazon extends LightningElement {
    @track details={
        name:'Jeff Bezos',
        title:'CEO',
        company:'Amazon'
    };

    handleChange(event){
        this.details.company = event.target.value;
        
    }
    handleChange2(event){
        this.details.name = event.target.value;
    }

    handleChange3(event){
        this.details.title = event.target.value;
    }
}
