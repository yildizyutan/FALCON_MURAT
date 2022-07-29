
import { LightningElement } from 'lwc';
​
export default class C2pProgressBarParent extends LightningElement {
    value = 10;
    changeHandler(event) {
        this.value = event.target.value;
    }
    resetprogressBar() {
        this.value = 50;
        this.template.querySelector('c-c2p-progress-bar-child').resetProgress();
    }
}