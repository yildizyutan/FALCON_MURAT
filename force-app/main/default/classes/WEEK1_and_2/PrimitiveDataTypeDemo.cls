public class PrimitiveDataTypeDemo {
    public void printNewDate() {

       System.debug('create new Date Instance');

       // create date

       Date newDate = Date.newInstance(1995, 2, 17);
       System.debug(newDate);
       Date newDate2 = Date.newInstance(2021, 10, 7);
       System.debug(newDate2);
       Date todayDate = date.today();
       System.debug(todayDate);
    }

public void printNewTime() {

// Create time

Time newTime = Time.newInstance(18, 20, 2, 30);
Time newTime2 = Time.newInstance(15, 27, 27, 27);
System.debug(newTime);
System.debug(newTime2);

}

public void printDateTime(){

// today's date

Date newDate = Date.today();
System.debug(newDate);

//new time

Time newTime = Time.newInstance(9, 12, 37, 27);
System.debug(newTime);

//1. create new datetime from date and time

Datetime dt1 = Datetime.newInstance(newDate, newTime);
System.debug(dt1);

// 2. create date time using YEAR, MONTH, DAY.=> Time 
//will be midnight.

Datetime dt2 = Datetime.newInstance(2022, 04, 08);
System.debug('dt2 is '+dt2);

// 3. create date time with date and time,

Datetime dt3 = Datetime.newInstance(2022, 04, 08, 15, 09, 37);
System.debug('date and time is '+dt3);

// 4. current time

Datetime currentDT = Datetime.now();
System.debug(currentDT);
// current time will be always GMT when we print it. may // need to chech GMT current time from google to 
// calculate while we writing code.

// 5. create GMT dateTime using Year, Month, Day, 
// Hour, Minute, Second

Datetime dt5 = DateTime.newInstanceGmt(1992, 3, 23, 10, 56, 53);

System.debug('dt5; '+ dt5 );

// 6. Long number in milisecond date time.

Long longtime = 1341828183000L;

Datetime dt6 = DateTime.newInstance(longtime);
System.debug('dt6(converted from long number in milisecond) is; '+dt6);

Datetime dt7 = DateTime.now();
System.debug('the time now; '+dt7 );



}

}
