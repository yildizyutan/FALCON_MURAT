

import { LightningElement } from 'lwc';

export default class TemplateLooping1 extends LightningElement {
    fruits = ['Apple', 'Banana', 'Mango', 'Orange'];
    

    
}
/*
lstAccounts = [
    {
        Id : '101',
        Name : 'Cristiano Ronaldo'
    },
    {
        Id : '102',
        Name : 'Lionel Messi'
    },
    {
        Id : '103',
        Name : 'Sachin Tendulkar'
    }
];
}
*/

/*
import SystemModstamp from '@salesforce/schema/AcceptedEventRelation.SystemModstamp';
import { LightningElement } from 'lwc';
​
export default class TemplateLooping1 extends LightningElement {
    fruits = ["Apple", "Banana", "Mango", "Orange"];
​
​
    contacts = [
        {firstname: "Jeff", lastname: "Bezos", title: "Executive Chairman"},
        {firstname: "Satya", lastname: "Nadella", title: "Chief Executive Officer"},
        {firstname: "Sundar", lastname: "Pichai", title: "Chief Executive Officer"}
    ]
}
/*
contacts = [
        
        {id:1, firstName: 'Jeff', lastName: 'Bezos'},
        {id:2, firstName: 'Steve', lastName: 'Jobs'}
    ];




        <div class = 'slds-var-m-around_medium'>

            <template for:each={fruits} for:item="fruits">
                <div key={fruits}>{fruits}</div>
            </template>

        </div> 

*/