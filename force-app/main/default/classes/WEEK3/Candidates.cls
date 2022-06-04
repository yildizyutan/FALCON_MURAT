public class Candidates {
    public String name = '';
    public String gender = '';
    public Static String companyName = '';


    public void printCandidates() {

        System.debug( ' The candidate name is '+name+' ( '+gender+' ) ');
        System.debug('Company name is '+companyName);

        /* 
        We can use STATIC variables in NON-STATIC methods.
        */

    }

    public static void printCandidateInfoSt(){

        System.debug('Company Name is '+companyName);  

        /* 
        We can not use NON-STATIC variables in STATIC methods.

        we can only use STATIC variable in static methods. we can not print the name variable here in static method.
        */

    }

}
