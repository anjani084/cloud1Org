public class BusinessEntityCount {
    public static void EntityOperation(){
        try{
            List<Contact> conList=new List<Contact>();
            conList=[SELECT Id,BusinessEntity__c FROM Contact LIMIT 50000];
            List<Opportunity> oppList=new List<Opportunity>();
            oppList=[SELECT Id,Business_Entities__c FROM Opportunity LIMIT 50000];
            if(!oppList.isempty()){
                for(Opportunity each:oppList){
                    integer count=0;
                    if(conList.size()>0){
                        for(Contact each1:conList){
                            if(each1.BusinessEntity__c==True){
                                Count++;
                            }
                            
                        }
                    }
                    each.Business_Entities__c=Count;
                }
            }
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+'at Line: '+e.getLineNumber());
        }
    }

}