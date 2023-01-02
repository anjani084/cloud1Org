public class DeleteOppLineItem {
    public static void DeletionOperation(){
        try{
            List<OpportunityLineItem> oppLineList=new List<OpportunityLineItem>();
            oppLineList=[SELECT Id,OpportunityId,Opportunity.contactId FROM OpportunityLineItem where opportunity.contactId!=null LIMIT 50000];
            Set<Id> IdconSet=new Set<Id>();
            if(oppLineList.size()>0){
                for(opportunityLineItem each:oppLineList){
                    IdconSet.add(each.Opportunity.ContactId);
                }
            }
            List<Contact> conList=new List<Contact>();
            conList=[SELECT Id,name FROM Contact WHERE Id in:IdconSet AND name LIKE '%a%' LIMIT 50000];
            List<OpportunityLineItem> tempList=new List<OpportunityLineItem>();
            
            //DELETION PROCESS:
            if(conList.size()>0){
                for(Contact each:ConList){
                    if(oppLineList.size()>0){
                        for(OpportunityLineItem each1:oppLineList){
                            if(each1.Opportunity.contactId==each.Id){
                                tempList.add(each1);
                            }
                        }
                    }
                }
            }
            if(tempList.size()>0){
                Delete TempList;
            }
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' At Line: '+e.getLineNumber());
        }
    }

}