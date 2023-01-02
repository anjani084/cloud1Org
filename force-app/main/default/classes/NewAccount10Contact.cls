public class NewAccount10Contact {
    Public static void NewAccountCreation(){
        try{
            List<Account> accList=new List<Account>();
            accList=[SELECT Id,Name FROM Account LIMIT 50000];
            Set<Id> idSet=new Set<Id>();
            if(accList!=Null && accList.size()>0){
                for(Account each:accList){
                    idSet.add(each.Id);
                }
            }
            List<Contact> conList=new List<Contact>();
            conList=[SELECT Id,AccountId FROM Contact WHERE AccountId in:idSet LIMIT 50000];
            List<Account> tempList=new List<Account>();
            if(accList!=Null && accList.size()>0){
                for(Account each:accList){
                    integer i=0;
                    if(conList!=null && conList.size()>0){
                        for(Contact each1:conList){
                            if(i>10){
                                Account newAcc=new Account();
                                newAcc.Name=each.Name;
                                each1.AccountId=newAcc.Id;
                                tempList.add(newAcc);
                            }
                            i++;
                        }
                    }
                }
            }
            if(conList!=null && conList.size()>0){
                Upsert conList;
            }
            if(tempList!=null && tempList.size()>0){
                Upsert tempList;
            }
            system.debug(tempList);
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}