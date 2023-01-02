public class MultiEmailManager {
    public static void sendMail(List<String> address, String subject, String body,List<String> bccAddress, List<String> ccAddress,List<String> ListOfIdes) {
        // Create an email message object
        try{
        system.debug('address size'+address.size());
        system.debug('bccaddress size'+bccAddress.size());
        system.debug('ccAddress size'+ccAddress.size());
            
        
        if(address.size()!=null && bccAddress.size()!=null && ccAddress.size()!=null){
            system.debug('1st case:');
        List<Messaging.SingleEmailMessage> mail=new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage sendmail=new Messaging.SingleEmailMessage();
       
        sendmail.setToAddresses(address);
        sendmail.setbccaddresses(bccAddress);
        sendmail.setccaddresses(ccAddress);
        sendmail.setSubject(subject);
        sendmail.setHtmlBody(body);
            if(ListOfIdes!=null){
            sendmail.setEntityAttachments(ListOfIdes);
                }
        // Pass this email message to the built-in sendEmail method 
        // of the Messaging class
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
                                 new Messaging.SingleEmailMessage[] { sendmail });
        // Call a helper method to inspect the returned results
        inspectResults(results);
    }
    else if(ccAddress.size()!=null && bccAddress.size()==null){
        system.debug('2nd case:');
        List<Messaging.SingleEmailMessage> mail=new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage sendmail=new Messaging.SingleEmailMessage();
       
        sendmail.setToAddresses(address);
        sendmail.setccaddresses(ccAddress);
        sendmail.setSubject(subject);
        sendmail.setHtmlBody(body);
         if(ListOfIdes!=null){
            sendmail.setEntityAttachments(ListOfIdes);
                }
        // Pass this email message to the built-in sendEmail method 
        // of the Messaging class
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
                                 new Messaging.SingleEmailMessage[] { sendmail });
        // Call a helper method to inspect the returned results
        inspectResults(results);
    }
    else if(ccAddress.size()==null){
        if(bccAddress.size()!=null){
        system.debug('3rd case:');
        List<Messaging.SingleEmailMessage> mail=new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage sendmail=new Messaging.SingleEmailMessage();
       
        sendmail.setToAddresses(address);
        sendmail.setbccaddresses(bccAddress);
             if(ListOfIdes!=null){
            sendmail.setEntityAttachments(ListOfIdes);
                }
        sendmail.setSubject(subject);
        sendmail.setHtmlBody(body);
        // Pass this email message to the built-in sendEmail method 
        // of the Messaging class
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
                                 new Messaging.SingleEmailMessage[] { sendmail });
        // Call a helper method to inspect the returned results
        inspectResults(results);
        }
    }
        else{
            system.debug('4th case:');
            List<Messaging.SingleEmailMessage> mail=new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage sendmail=new Messaging.SingleEmailMessage();
       
        sendmail.setToAddresses(address);
        sendmail.setSubject(subject);
             if(ListOfIdes!=null){
            sendmail.setEntityAttachments(ListOfIdes);
                }
        sendmail.setHtmlBody(body);
        // Pass this email message to the built-in sendEmail method 
        // of the Messaging class
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
                                 new Messaging.SingleEmailMessage[] { sendmail });
        // Call a helper method to inspect the returned results
        inspectResults(results);
        }
        }catch(exception e){
            system.debug('error : '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }
    // Helper method
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult = true;
        // sendEmail returns an array of result objects.
        // Iterate through the list to inspect results. 
        // In this class, the methods send only one email, 
        // so we should have only one result.
        for (Messaging.SendEmailResult res : results) {
            if (res.isSuccess()) {
                System.debug('Email sent successfully');
            }
            else {
                sendResult = false;
                System.debug('The following errors occurred: ' + res.getErrors());                 
            }
        }
        return sendResult;
    }

}