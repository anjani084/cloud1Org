public class MultipleId {
    public static void MultipleIdOperation(){
        try{
            List<Task> tkList=new List<Task>();
            List<Account> conList=new List<Account>();
            conList=[SELECT Id FROM Account LIMIT 3];
            Task tk=new Task();
            tk.Subject='Send Quote';
            tk.Priority='High';
            tk.Status='Completed';
           	//tk.TaskWhoIds = '';
            insert tk;
            List<TaskRelation> tkrList=new List<TaskRelation>();
            
            for(Account each:conList){
                TaskRelation tkr=new TaskRelation();
            tkr.TaskId=tk.Id;
            tkr.relationId=each.Id;
                tkrList.add(tkr);
            }
            insert tkrList;
            
            
            
        }catch(exception e){
            system.debug('errror>>>>'+e.getMessage());
        }
    }

}