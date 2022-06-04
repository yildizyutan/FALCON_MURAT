public class Cat {

    public string name = '';
    public string color ='';

    public Cat() {

        System.debug('constructor called');

    }

    public Cat(string n, string c) {

        this.name = n;
        this.color = c;
        sleeping();
    }

    public void sleeping(){

        System.debug(this.name + ' is sleeping');

    }
}
