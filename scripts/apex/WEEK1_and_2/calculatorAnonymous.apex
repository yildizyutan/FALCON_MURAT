Integer sum1 = Calculator.add(10, 12, 1);
System.debug(sum1);

/*
Calculator calc = new Calculator();
calc.welcomeMessage();
calc.printNewMessage('This is new age calc.');

integer addInteger = calc.add(10,15,12);
System.debug('sum = '+ addInteger );
*/

List<Integer> ListInteger = new List<Integer>();
ListInteger.add(10);
ListInteger.add(11);
ListInteger.add(9);

Integer rsum = Calculator.add( ListInteger);
System.debug(rsum);