public class AddPrimaryContact implements Queueable{
    Private Contact c;
    Private String state;
    Public addPrimaryContact(Contact c,String State){
        this.c=c;
        this.state=state;
    }
    public void execute(QueueableContext context){
        List<Account> accList=new List<Account>();
        accList=[SELECT Id,Name,(SELECT Id,FirstName,LastName FROM Contacts) FROM 
                 Account WHERE BillingState =:State LIMIT 200];
        List<Contact> conList=new List<Contact>();
        for(Account each:accList){
            Contact temp=new Contact();
            temp=c.clone(false, false, false, false);
            temp.AccountId=each.Id;
            conList.add(temp);
        }
        if(conList.size()>0){
            insert conList;
        }
        
        
    }

}