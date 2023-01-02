public class vfHierarchyAccount {
    public List<Account>accList{get;set;}
    public String accName{get;set;}
    public list<Account>childAccList{get;set;}
    public vfHierarchyAccount(ApexPages.StandardController stdController){
        accName=ApexPages.CurrentPage().getParameters().get('id');
    }
    public void vfHierarchyAccount(){
        accList=this.accList;
        childAccList=this.childAccList;
        accName=this.accName;
        accList=[SELECT Id,Name,Parent.Name FROM Account WHERE Id=:accName LIMIT 1];
        childAccList=[SELECT Id,Name,Parent.Name FROM Account WHERE Parent.Id=:accName LIMIT 50000];
        
    }

}