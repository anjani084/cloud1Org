public class OpportunityCloneOperation {
    public static void CloneOpportunity(){
        try{
            Opportunity opp=[SELECT id,Name,CloseDate FROM Opportunity LIMIT 1];
            system.debug(opp.name);
            opp.Name=opp.Name+'Clone';
            opp.CloseDate=opp.CloseDate+30;
            //Now Clone the Opportunity
            Opportunity cloneOpp=opp.clone(True, True, True, True);
                upsert cloneOpp;
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }
}