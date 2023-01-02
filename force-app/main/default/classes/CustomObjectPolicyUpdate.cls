public class CustomObjectPolicyUpdate {
    public static void UpdateOperation(List<Policy__c> polList){
        try{
            List<Policy__c> newPolList=new List<Policy__c>();
            newPolList=[SELECT Id,Policy_number__c,Parent_Policy__c,Opportunity__r.Id,
                       Parent_Policy__r.renew_Policy__c FROM Policy__c
                         WHERE Id in:polList LIMIT 50000];
            
            set<Id> idSet=new Set<Id>();
            if(newPolList.size()>0){
                for(Policy__c each:newpolList){
                    idSet.add(each.Opportunity__r.Id);
                }
            }
            List<Opportunity> oppList=new List<Opportunity>();
            oppList=[SELECT Id,Policy_Number__c,StageName FROM Opportunity WHERE Id in:idSet LIMIT 50000];
            
            if(oppList.size()>0 && newpolList.size()>0){
                for(Policy__c each:newpolList){
                    for(Opportunity each1:oppList){
                        if(each.policy_Number__c==each1.Policy_number__c){
                            each1.StageName='Closed Won';
                            if(each.Parent_Policy__c!=null){
                                each.Parent_Policy__r.renew_Policy__c=True;
                                each.opportunity__c=each1.Id;
                            }
                        }
                    }
                }
            }
            if(oppList.size()>0){
                update oppList;
            }
            if(newPolList.size()>0){
                upsert newPolList;
            }
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}