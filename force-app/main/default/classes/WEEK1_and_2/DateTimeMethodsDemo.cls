public class DateTimeMethodsDemo {
    public void calculateAgeInMonths() {

System.debug('METHOD 1');
System.debug(' ');
        Date birthDate = Date.newInstance(1985, 03, 13);

        Date todayDate = Date.today();

        Integer ageInMonths = birthDate.monthsBetween(todayDate);

        System.debug('age in months; '+ageInMonths);
System.debug(' ');
    }

    public void calculateAgeInDays() {

System.debug('METHOD 2');
System.debug(' ');

        Date birthDate = Date.newInstance(1985, 03, 13);

        Date todayDate = Date.today();

        Integer ageInDays = birthDate.daysBetween(todayDate);

        System.debug('age in days; '+ageInDays);
System.debug(' ');
    }

    public void printSubscriptionEndDate() {

System.debug('METHOD 3');
System.debug(' ');
        Date subscriptionStartDate = Date.today();
        System.debug('Subscription Start Date; '+subscriptionStartDate);

        Date subscriptionEndDate = subscriptionStartDate.addDays(1000);
        System.debug('Subscription End date is; '+subscriptionEndDate);

        Integer subscriptionEndYear = subscriptionEndDate.year();
        System.debug('Subscription End Year is; '+subscriptionEndYear);

        Integer subscriptionEndMonth = subscriptionEndDate.month();
        System.debug('Subscription End Month is; '+subscriptionEndMonth);
System.debug(' ');

    }

    public void printOfferEndDateTime() {

System.debug('METHOD 4');
System.debug(' ');
        Datetime offerStartTime = Datetime.now();
        System.debug('The date for today is; '+offerStartTime);

        Datetime offerEndDate = offerStartTime.addHours(51);

        System.debug('The date and time for offer end date; '+offerEndDate);


System.debug(' ');

}


    public boolean leapYearCheck(date dt){

    integer year = dt.year();

    Boolean lp = Date.isLeapYear(year);
            
    return lp;

}



    
            


}
