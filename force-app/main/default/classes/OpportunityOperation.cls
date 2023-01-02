public class OpportunityOperation {
    public static void InsertOperation(){
        try{
            List<Opportunity> oppList=new List<Opportunity>();
            for(Integer i=0;i<20;i++){
                Opportunity opp=new Opportunity();
                opp.Name='abc'+i;
                opp.CloseDate=system.today();
                opp.StageName='Qualification';
                oppList.add(opp);
            }
            if(oppList!=null && oppList.size()>0){
            insert opplist;
            }
          }catch(Exception e){
            system.debug('Error: '+e.getMessage()+ ' at line: '+e.getLineNumber());
        }
    }

}