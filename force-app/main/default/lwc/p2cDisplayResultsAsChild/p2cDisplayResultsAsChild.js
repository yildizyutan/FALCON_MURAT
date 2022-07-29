import { api, LightningElement } from 'lwc';

export default class P2cDisplayResultsAsChild extends LightningElement {
    @api result;
    @api error;
    @api columns;
}