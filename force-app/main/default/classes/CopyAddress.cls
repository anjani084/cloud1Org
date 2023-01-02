public class CopyAddress {
     public static void CopyOperation(){
        try{
            List<Contact> conList=new List<Contact>();
            List<Account> accList=new List<Account>();
            accList=[SELECT Id,BillingCity,BillingCountry,BillingPostalCode,BillingState,BillingStreet FROM Account LIMIT 50000];
            conList=[SELECT Id,AccountId,Name,copy_Address__c,MailingCity,MailingCountry,MailingPostalCode,MailingState,MailingStreet FROM Contact WHERE AccountId in:accList LIMIT 50000];
            if(conList!=null && conList.size()>0){
                for(Contact each:conList){
                    if(each.copy_Address__c==True){
                        if(accList!=null && accList.size()>0){
                            for(Account each1:accList){
                                if(each.AccountId==each1.Id){
                                    system.debug(each.Name);
                                    each.MailingCity=each1.BillingCity;
                                    each.MailingCountry=each1.BillingCountry;
                                    each.MailingPostalCode=each1.BillingPostalCode;
                                    each.MailingState=each1.BillingState;
                                    each.MailingStreet=each1.BillingStreet;
                                }
                            }
                        }
                    }
                }
            }
            if(conList!=null && conList.size()>0){
                update conList;
            }
            
        }catch(exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}