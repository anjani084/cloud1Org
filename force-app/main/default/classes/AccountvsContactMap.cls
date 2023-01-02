public class AccountvsContactMap {
    public static void mappingOperation(){
        try{
            Map<Id,List<Contact>> accountContactMap=new Map<Id,List<Contact>>();
            List<Contact> conList=new List<Contact>();
            conList=[SELECT Id,Name,accountId FROM Contact WHERE accountId!=null LIMIT 50000];
            List<Contact> tempList=new List<Contact>();
            if(conList!=null && conList.size()>0){
                for(Contact each:conList){
                    // Checking that Key is Present or not
                    if(AccountContactMap.containskey(each.AccountId)){
                        tempList=accountContactMap.get(each.AccountId);
                        tempList.add(Each);
                        accountContactMap.put(each.AccountId,tempList);
                    }
                    // If key is not present then add it
                    else{
                        tempList.add(each);
                        accountContactMap.put(each.AccountId,tempList);
                    }
                }
            }
            system.debug(accountContactMap);
        }catch(exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}