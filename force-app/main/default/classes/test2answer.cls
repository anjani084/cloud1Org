public class test2answer{
      public static void AccountCreation(){
        try{
            List<Contact> conList=new List<Contact>();
            List<Account> accList=new List<Account>();
            conList=[SELECT Id,AccountId,Account.Name FROM Contact WHERE AccountId!=null LIMIT 50000];
            
            //Mapping of accountId with their associate Contact
            Map<Id,List<Contact>> accConMap=new Map<Id,List<Contact>>();
            if(conList!=null && conList.size()>0){
            for(Contact each:conList){
                if(accConMap.containskey(each.AccountId)){
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

            // Creating a new account if number of contact is more than 10.
            if(accConMap!=null && accConMap.size()>0){
                for(Id each:accCOnMap.keyset()){
                    if(accConMap.get(each).size()>10){
                        integer i=0;
                        for(Contact each1:accConMap.get(each)){
                            i=i+1;
                            if(Math.mod(i,10)==0){
                                Account acc=new account();
                                if(Math.mod(i,10)!=0){
                                acc.Name=each1.Account.Name;
                                each1.AccountId=acc.Id;
                                    accList.add(acc);}
                            }
                        }
                    }
                }
                system.debug(accList);
                if (accList!=null && accList.size()>0){
                    insert accList;
                }
            }
            
        }catch(exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }
}