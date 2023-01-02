public class VfPageOpportunityClosedDate {
    public List<Opportunity>oppList{get;set;}
    public string oppId{get;set;}
    public string show{get;set;}
    public boolean Flag{get;set;}
    public VfPageOpportunityClosedDate(ApexPages.StandardController stdController){
        oppId=ApexPages.CurrentPage().getParameters().get('id');
    }
    public void VfPageOpportunityClosedDate(){
        Flag=False;
        oppList=[SELECT Id,Name,CloseDate FROM Opportunity where id=:oppId ];
        Date myDate=Date.today().addDays(6);
        for(Opportunity each:oppList){
            if(each.CloseDate < myDate && system.today()<each.CloseDate){
            Show=' Close Date is Near';
                Flag=True;
            }
            else{
                if(each.CloseDate>system.today()){
                Show=' Close Date is Not Near';
                }
            }
        }
    }

}