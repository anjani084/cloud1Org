public class FetchOppContactRole {
    public static void FetchingOperation(){
        try{
            List<OpportunityContactRole> oppConList=new List<OpportunityContactRole>();
            oppConList=[SELECT Id,Role,ContactId,Contact.AccountId FROM OpportunityContactRole WHERE Contact.accountId!=null LIMIT 50000];
            Map<Id,List<Contact>> IdvsConMap=new Map<Id,List<Contact>>();
            List<Contact> conList=new List<Contact>();
            conList=[SELECT Id,AccountId FROM Contact WHERE AccountId!=null LIMIT 50000];
            
            //Maping of accountID with the contacts
            if(conList.size()>0){
                for(Contact each:conList){
                    if(IdvsConMap.containsKey(each.accountId)){
                        List<Contact> tempList=new List<Contact>();
                        tempList=IdvsConMap.get(each.accountId);
                        tempList.add(each);
                        IdvsConMap.put(each.AccountId,tempList);
                    }else{
                        List<Contact> tempList=new List<Contact>();
                        tempList.add(each);
                        IdvsConMap.put(each.AccountId,tempList);
                    }
                }
            }
            if(oppConList.size()>0){
                for(OpportunityContactRole each: OppConList){
                    if(IdvsConMap.get(each.contact.AccountId).size()>2){
                        system.debug(Each.Role);
                    }
                }
            }
            
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}