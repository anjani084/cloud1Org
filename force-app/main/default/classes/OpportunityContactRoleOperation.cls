public class OpportunityContactRoleOperation {
    public static void GetOpportunityOperation(){
        try{
            List<Opportunity> oppList=new List<Opportunity>();
            oppList=[SELECT Id, Name, Account.Name FROM Opportunity WHERE StageName='Closed Won' OR StageName='Closed Lost' LIMIT 50000];
            
            List<OpportunityContactRole> conList=new List<OpportunityContactRole>();
            conList=[SELECT Contact.Account.Name FROM OpportunityContactRole LIMIT 50000];
            if(oppList.size()>0){
            For(Opportunity opp : oppList){
                for(OpportunityContactRole ocr : conList){
                    if(opp.Account.Name==ocr.Contact.Account.Name){
                        system.debug(opp.Name);
                    }
                    }
                }
            }
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}