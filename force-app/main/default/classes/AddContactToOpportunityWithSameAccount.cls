public class AddContactToOpportunityWithSameAccount {
    public static void AddContactsToOpportunityOperation(List<Opportunity> oppList){
        try{
            List<Opportunity> newOppList=[SELECT Id,AccountId FROM Opportunity WHERE Id in:oppList LIMIT 50000];
            Set<Id> idSet=new Set<Id>();
            if(newOppList!=null && newOppList.size()>0){
                for(Opportunity each:newOppList){
                    idSet.add(each.AccountId);
                }
            }
            List<Contact>conList=[SELECT Id,AccountId FROM Contact WHERE AccountId in:idSet LIMIT 50000];

            List<OpportunityContactRole> oppConRoleList=new List<OpportunityContactRole>();
            if(newoppList.size()>0){
                for(Opportunity each:newoppList){
                    if(conList.size()>0){
                        for(Contact each1:conList){
                            if(each.accountId==each1.accountId){
                                opportunityContactRole temp=new OpportunityContactRole();
                                temp.OpportunityId=each.Id;
                                temp.ContactId=each1.Id;
                                oppConRoleList.add(temp);
                            }
                        }
                    }
                }
            }
            if(!oppConRoleList.isempty()){
                insert oppConRoleList;
            }
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
            
        }
    }

}