import { api, LightningElement } from 'lwc';

export default class P2cPrimitivesChild extends LightningElement {
    
    @api name; //we are making public with @api. yukarida, line-1 de api {} icine eklenmesi gerek.
    @api age;
    @api placeOfLiving;
}