public class CountCasesAndContacts {
    Public static void CountingOperation(){
        try{
            Map<Id,List<Contact>> accConMap=new Map<Id,List<Contact>>();
            Map<Id,List<Case>> conCasMap=new Map<Id,List<Case>>();
            
            // Mapping of account Id with their contactId:
            List<Contact> conList=new List<Contact>();
            conList=[SELECT Id,AccountId,Name FROM Contact WHERE AccountId!=null LIMIT 50000];
            If(conList!=null && conList.size()>0){
            for(Contact each:conList){
                if (accConMap.containskey(each.AccountId)){
                    List<Contact> tempList=new List<Contact>();
                    tempList=accConMap.get(each.AccountId);
                    tempList.add(each);
                    accConMap.put(each.AccountId,tempList);
                }
                else{
                    List<Contact> tempList=new List<Contact>();
                    tempList.add(each);
                    accConMap.put(each.AccountId,tempList);
                }
            }
            }
            
            //Mapping of ContactId with their Cases
            List<Case> casList=new List<Case>();
            casList=[SELECT Id,ContactId FROM Case WHERE ContactId!=null LIMIT 50000];
            if(casList!=null && casList.size()>0){
                for(Case each:casList){
                    if(conCasMap.containskey(each.ContactId)){
                        List<Case> tempList=new List<Case>();
                        tempList=conCasMap.get(each.ContactId);
                        tempList.add(each);
                        conCasMap.put(each.ContactId,tempList);
                    }
                    else{
                        List<Case> tempList=new List<Case>();
                        tempList.add(each);
                        conCasMap.put(each.ContactId,tempList);
                    }
                }
            }
            //Filling of Number_of_contact field with help of accConMap Map. 
            List<Account> accList=new List<Account>();
            accList=[SELECT Id,Number_of_Contact__c,Number_of_Cases__c FROM Account WHERE Id in:accConMap.keySet() LIMIT 50000];
            if(accList!=null && accList.size()>0){
            For(Account each:accList){
                each.Number_of_Contact__c=accConMap.get(each.Id).size();
            }
            }
            if(accList!=null && accList.size()>0){
            upsert accList;
            }
            // Filling of Number_of_Cases field with help of conCasMap.
            if(accList!=null && accList.size()>0){
                for(Account each1:accList){
                    integer k=0;
                    if(conList!=null && conList.size()>0){
                        for(Contact each2:conList){
                            if(each2.AccountId==each1.Id){
                                if(conCasMap.get(each2.Id)!=null && conCasMap.get(each2.Id).size()>0){
                                k=k+integer.valueof(conCasMap.get(each2.Id).size());
                            }
                            }
                        }
                    }
                    each1.Number_of_Cases__c=k;
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