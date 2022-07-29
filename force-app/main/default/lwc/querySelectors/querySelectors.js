import { LightningElement } from 'lwc';

export default class QuerySelectors extends LightningElement {
    
    fruits = ['Apple', 'Orange', 'Banana', 'Grapes'];
    
    clickHandler(){
        //querySelector
        const elem = this.template.querySelector('h1');
        console.log(elem.innerText);
        //We can add some styling from here for html file.
        elem.style.border="2px solid green";
        elem.style.backgroundColor="yellow";

        //querySelectorAll
        //const fruitElems = this.template.querySelectorAll('div');
        const fruitElems = this.template.querySelectorAll('.fruit');
        fruitElems.forEach(item=>{
            console.log(item.innerText)

            if(item.innerText ==='Apple'){
                item.style.color ='red';
            }else if(item.innerText === 'Banana'){
                item.style.color = 'blue';
            }

            //item.style.color = 'blue';
            item.setAttribute('class', 'slds-align_absolute-center');
        })

    }
}