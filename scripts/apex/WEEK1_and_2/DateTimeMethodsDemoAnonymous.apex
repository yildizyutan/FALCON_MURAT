
DateTimeMethodsDemo dt = new DateTimeMethodsDemo();
dt.calculateAgeInMonths();
dt.calculateAgeInDays();
dt.printSubscriptionEndDate();
dt.printOfferEndDateTime();

date newDate = date.today();
boolean newDateLCheck = dt.leapYearCheck(newDate);
System.debug(newDateLCheck);
