public class AlertContactEmail {
    public static void AlertMessageEmailOperation(List<Contact> conList){
        try{
            List<Contact> newconList=new List<Contact>();
            newConList=[SELECT Id,OwnerId,Email,Name,Phone,
                        MailingAddress FROM Contact WHERE Id in:conList Limit 50000];
            for(Contact each:newConList){
                EmailManager.sendMail(each.Id,'[Alert Contact]','New Contact Inserted of name: '+each.Name+
                                      ' and the Phone is: '+each.Phone+', Address is: '+each.MailingAddress);
                EmailManager.sendMail(each.Email,'[Alert Contact]', 'New Contact Inserted of name: '+each.Name+
                                      ' and the Phone is: '+each.Phone+', Address is: '+each.MailingAddress);
                EmailManager.sendmail(each.OwnerId,'[Alert Contact]','New Contact Inserted of name: '+each.Name+
                                      ' and the Phone is: '+each.Phone+', Address is: '+each.MailingAddress);
            }
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}