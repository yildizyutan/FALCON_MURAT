public with sharing class CaseInvocable {
    
    @InvocableMethod(label='Send Email & Save Activity'
    description='Sends an Email and saves the same as an activity'
    category='Case')
    public static void sendEmail(List<FlowInput> inputs){
        FlowInput input = inputs[0];
        //Messaging 

        List<Messaging.SingleEmailMessage> msgs = new List<Messaging.SingleEmailMessage>();

        Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
        msg.setTargetObjectId(input.contactId);

        msg.setSaveAsActivity(true);

        msg.setSubject('Case created : ' +input.caseNumber);
        msg.setPlainTextBody('Hello There \n A case has been created for you to answer your query.' + 'One of our customer representative is going to reachout to you. Stay tuned!' + '\n Thank You');
        
        msgs.add(msg);

        Messaging.SendEmailResult[] results = Messaging.sendEmail(msgs);

        for(Messaging.SendEmailResult result : results){
            if(result.isSuccess()){
            
                //create success log
                System.debug('Susccesfully sent!');

            } else {
                System.debug(result.getErrors());
            }
        }

        // Messaging.sendEmail(msgs); // we can not sent single email, that is why we are prepering list and sending it.
    }
    
    public class FlowInput{
        
        @InvocableVariable(label='Case Number' description='To Get Case Number' required= true)
        public String caseNumber;

        @InvocableVariable(label='Contact Id' description='To Get Contact Id' required= true)
        public Id contactId;
    }


}
