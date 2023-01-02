public class AddFollowTaskToOpportunity {
    public static void AddTaskOperation(List<Opportunity> oppList){
        try{
            List<Task> taskList=new List<Task>();
            if(oppList.size()>0){
                for(Opportunity each: oppList){
                    if(Each.StageName=='Closed Won'){
                        taskList.add(new Task(Subject='Follow Up Test Task',
                                             WhatId=each.Id));
                    }
                }
            }
            if(taskList.size()>0){
                Upsert taskList;
            }
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}