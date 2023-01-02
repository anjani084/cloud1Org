public class CountContactOperation {
    public static void CoutOpeartion(){
        try{
            List<Opportunity> oppList= New List<Opportunity>();
            oppList=[SELECT Id, name, AccountId FROM Opportunity WHERE AccountId!=null LIMIT 50000];
            Set<Id> accIdList=new Set<Id>();
            if(oppList!=null && oppList.size()>0){
                for(Opportunity each:oppList){
                    accIdList.add(each.accountId);
                }
            }
            List<Contact>contList=new List<Contact>();
            contList=[SELECT AccountId,Id,Name FROM Contact WHERE AccountId in:accIdList LIMIT 50000];
            if(oppList!=null && oppList.size()>0){
                for(Opportunity each:oppList){
                    Integer i=0;
                    if(contList!=null && contList.size()>0){
                        for(Contact each1:contList){
                            if(each1.name==each.Name && each1.accountId==each.AccountId){
                                i++;
                            }
                        }
                    }
                    system.debug('Total Contact: '+i+'on Account'+each.accountId);
                }
            }
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at line: '+e.getLineNumber());
        }
    }

}