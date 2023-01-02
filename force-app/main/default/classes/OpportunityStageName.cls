public class OpportunityStageName {
    @auraenabled
    public static String ShowStageName(Opportunity Opp){
        try{
            system.debug(opp);
            insert opp;
            return opp.Id;
            
        }catch(Exception e){
            system.debug('Error:'+e.getMessage()+' at Line: '+e.getLineNumber());
            return null;
        }
        
    }
    
     @auraenabled
    public static List<String> fetchPickList(){
        try{
       List<String> pickListValuesList= new List<String>();
		Schema.DescribeFieldResult fieldResult = Opportunity.StageName.getDescribe();
		List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
		for( Schema.PicklistEntry pickListVal : ple){
			pickListValuesList.add(pickListVal.getLabel());
		}     
		return pickListValuesList;
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
            return null;
        }
    }

}