public class CopyAddressFromAccount {
    public static void CopyAddressOperation(List<Contact> conList){
        try{
            Set<Id> idSet=new Set<Id>();
            if(ConList.size()>0){
                for(Contact each:ConList){
                    idSet.add(each.AccountId);
                }
            }
            List<Account> accList=[SELECT Id, BillingCity,BillingState,BillingCountry,BillingPostalCode,
                                   BillingStreet FROM Account WHERE Id in:idSet LIMIT 50000];
            List<Contact>tempList=new List<Contact>();
            if(accList!=null && accList.size()>0){
                for(Account each:accList){
                    if(ConList!=null && ConList.size()>0){
                        for(Contact each1:ConList){
                            if(each.Id==each1.AccountId){
                                if(each1.Copy_Address_From_Account__c==True){
                                    each1.MailingCity=each.BillingCity;
                                    each1.MailingCountry=each.BillingCountry;
                                    each1.MailingState=each.BillingState;
                                    each1.MailingPostalCode=each.BillingPostalCode;
                                    each1.MailingStreet=each.BillingStreet;
                                    tempList.add(each1);
                                }
                            }
                        }
                    }
                   
                }
            }
            if(tempList.size()>0){
                Upsert tempList;
            }
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}