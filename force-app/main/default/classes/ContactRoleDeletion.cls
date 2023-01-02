public class ContactRoleDeletion {
    public static void DeletionOperation(){
        try{
            List<Opportunity> oppList=new List<Opportunity>();
            oppList=[SELECT Id, Name, Account.Name FROM Opportunity WHERE StageName='Closed Won' OR StageName='Closed Lost' LIMIT 50000];
            
            List<OpportunityContactRole> conList=new List<OpportunityContactRole>();
            conList=[SELECT Id,Contact.Account.Name FROM OpportunityContactRole LIMIT 50000];
            List<OpportunityContactRole> newConList=new List<OpportunityContactRole>();
            
            if(oppList.size()>0){
            For(Opportunity opp : oppList){
                if(conList!=null && conList.size()>0){
                for(OpportunityContactRole ocr : conList){
                    if(opp.Account.Name==ocr.Contact.Account.Name){
                       newConList.add(ocr);
                    }
                    }
                    }
                }
            }
            system.debug(newConList);
            if(newConList!=null && newConList.size()>0){
                Delete newConList;
            }
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}