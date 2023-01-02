public class AddContactstoOpportunityContactRole {
    public static void AddContactsOperation(){
        try{
            List<Account> accList=[SELECT ID FROM Account LIMIT 50000];
            Set<Id> accSet=new Set<Id>();
            if(accList!=null && accList.size()>0){
                for(Account each:accList){
                    accSet.add(each.Id);
                }
            }
            List<Contact>conList=[SELECT Id,AccountId,Name FROM Contact WHERE AccountId in:accSet LIMIT 50000];
            List<Opportunity> oppList=[SELECT Id,AccountId FROM Opportunity WHERE AccountId in:accSet LIMIT 50000];
            List<OpportunityContactRole> oppConList=new List<OpportunityContactRole>();
            if(oppList.size()>0){
                for(Opportunity each:oppList){
                    if(conList.size()>0){
                        for(Contact each1:conList){
                            if(each.accountId==each1.accountId){
                                opportunityContactRole temp=new OpportunityContactRole();
                                temp.OpportunityId=each.Id;
                                temp.ContactId=each1.Id;
                                oppConList.add(temp);
                            }
                        }
                    }
                }
            }
            if(!oppConList.isempty()){
                insert oppConList;
            }
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
            
        }
    }

}