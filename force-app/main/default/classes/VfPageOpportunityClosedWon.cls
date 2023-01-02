public class VfPageOpportunityClosedWon {
    Public List<Opportunity> oppList{get;set;}
    Public String oppName{get;set;}
    public Boolean Flag{get;set;}
    public String Stage{get;set;}
    public VfPageOpportunityClosedWon(ApexPages.StandardController stdController){
        OppName=ApexPages.CurrentPage().getParameters().get('id');}
    public Void VfPageOpportunityClosedWon(){
        oppList=this.oppList;
        oppName=this.oppName;
        stage=this.stage;
        Flag=this.Flag;
        oppList=[SELECT Id,Name,StageName From Opportunity WHERE Id=:oppName LIMIT 1];
        Flag=False;
        if(oppList.size()>0){
        for(Opportunity each:oppList){
            if(each.StageName=='Closed Won'){
            stage=each.StageName;
            Flag=True;
            }
        }
        }
    }
}