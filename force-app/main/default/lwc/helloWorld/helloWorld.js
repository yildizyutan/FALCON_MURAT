import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {
    name; //undefined
    fullname = "Salesforce Developer"; //String
    age = 30; //Integer
    location = {
        city: "Houston",
        country: "United States",
        postalCode: "50033"

    }; //this what, how to build a OBJECT

    fruits = ["Banana", "Orange", "Pomegranate", "Pineapple"]; //array(List)

    //writing Method;
    getLocation(){
        return this.location.city;
    }
}