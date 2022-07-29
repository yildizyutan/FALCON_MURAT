/* QUESTION 1
  1. Create a lightning-input and display the value “username” from controller. Upon every letter change in this input, the controller has to understand that and update value in “this.username”. HINT: You need to write an event handler for this to happen
2. Create a combo box for role with the following values – 

LABEL	VALUE
Salesforce Admin	Salesforce Admin
Salesforce Developer	Salesforce Developer
Salesforce Architect	Salesforce Architect	

3. Every time user makes a selection, the same selected value has to be updated in “this.role”. HINT: You need to write an event handler for this to happen.
4. The username and role has to be displayed dynamically in the bottom section of the component in a div tag. Use appropriate stylings
*/

import { LightningElement, } from 'lwc';

export default class AssignmentWeek12_Q1_Name_Role extends LightningElement {
    username;
    role;

    roles = [
        {
            label: 'Salesforce Admin',
            value: 'Salesforce Admin'
        },

        {
            label: 'Salesforce Developer',
            value: 'Salesforce Developer' 
        },

        {
            label: 'Salesforce Architect',
            value: 'Salesforce Architect'
        }    
    ]
    handleUsernameChange(event){
        this.username = event.target.value;
    }
    handleRoleChange(event) {
        this.role = event.target.value;
    }


}