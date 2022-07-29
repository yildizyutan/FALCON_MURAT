import { LightningElement, track } from 'lwc';

export default class TrackProperty extends LightningElement {
    @track location={
        city:'Houston',
        country:'USA',
        postalCode:'50021'
    };

    handleChange(event){
        this.location.city = event.target.value;
    }
}
