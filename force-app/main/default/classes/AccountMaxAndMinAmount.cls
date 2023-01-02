public class AccountMaxAndMinAmount {
    public static void MaxAndMinAmountOperation(){
        try{
            List<Account> accList=new List<Account>();
            List<Opportunity> oppList=new List<Opportunity>();
            oppList=[SELECT Id,AccountId,Amount FROM Opportunity WHERE AccountId!=null LIMIT 50000];
            Set<Id> idSet=new Set<Id>();
            if(oppList!=null && oppList.size()>0){
                for(Opportunity each:oppList){
                    idSet.add(each.AccountId);
                }
            }
            accList=[SELECT Id,Min_Amount__c,Max_Amount__c FROM Account WHERE Id in:idSet LIMIT 50000];
            if(accList!=null && accList.size()>0){
                for(Account each:accList){
                    integer s=0;
                    if(oppList!=null && oppList.size()>0){
                        for(Opportunity each1:oppList){
                            if(each.Id==each1.AccountId){
                                if(s==0){
                                    each.Max_Amount__c=each1.Amount;
                                    each.Min_Amount__c=each1.Amount;
                                    s=1;
                                }
                                else{
                                    if(each.Max_Amount__c<each1.Amount){
                                        each.Max_Amount__c=each1.Amount;
                                    }
                                    if(each.Min_Amount__c>each1.Amount){
                                        each.Min_amount__c=each1.Amount;
                                    }
                                }
                                
                            }
                        }
                    }
                }
            }
            if(accList!=null && accList.size()>0){
                Upsert accList;
            }

            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}