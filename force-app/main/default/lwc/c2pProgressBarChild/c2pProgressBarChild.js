
import { api, LightningElement } from 'lwc';

export default class C2pProgressBarChild extends LightningElement {
    @api progressValue;

    @api resetProgress() {
        this.progressValue = 50;
    }
}