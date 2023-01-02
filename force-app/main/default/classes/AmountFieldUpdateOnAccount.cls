public class AmountFieldUpdateOnAccount {
    public static void CurrentTotalAmountOnContact(List<Contact> conList){
        try{
            Set<id> idSet=new Set<Id>();
            if(conList.size()>0){
            for(Contact each:conList){
                idSet.add(each.Id);
            }
            }
            List<Contact> newConList=new List<Contact>();
            newConList=[SELECT Id, Amount__c,AccountId,Account.TotalAmount__c FROM Contact WHERE Id in:idSet LIMIT 50000];
            
            Map<Id,List<Contact>> AccountContactMap=new Map<Id,List<Contact>>();
            List<Contact> tempList=new List<Contact>();
            
             if(newConList!=null && newConList.size()>0){
                for(Contact each:newConList){
                    if(AccountContactMap.containskey(each.AccountId)){
                        tempList=accountContactMap.get(each.AccountId);
                        tempList.add(Each);
                        accountContactMap.put(each.AccountId,tempList);
                    }
                    else{
                        tempList.add(each);
                        accountContactMap.put(each.AccountId,tempList);
                    }
                }
             }
            
             Map<Id,double> AccountIdIntegerMap=new Map<Id,double>();
            double num;
            if(newConList!=null && newConList.size()>0){
                for(Contact each:newConList){
                    if(AccountIdIntegerMap.containskey(each.AccountId)){
                        num=AccountIdIntegerMap.get(each.AccountId);
                            num+=each.Amount__c;
                        AccountIdIntegerMap.put(each.AccountId,num);
                    }
                    else{
                        num=each.Amount__c;
                        AccountIdIntegerMap.put(each.AccountId,num);
                    }
                }
             }
            system.debug('AccountIdIntegerMap>>>>>>'+AccountIdIntegerMap);
            
            List<Account> accList=new List<Account>();
            List<Account> updatedAccounts=new List<Account>();
            accList=[select Id ,TotalAmount__c from account where Id in:AccountIdIntegerMap.keyset() Limit 50000];
            
            for(Account each:accList){
                each.TotalAmount__c=AccountIdIntegerMap.get(each.Id);
                updatedAccounts.add(each);
            }
            system.debug('updatedAccounts>>>>>'+updatedAccounts);
            if(updatedAccounts!=null){
                update updatedAccounts;
            }
            

            
            
        }catch(exception e){
            system.debug('error: '+e.getMessage()+' at Line'+e.getLineNumber());
        }

}
}