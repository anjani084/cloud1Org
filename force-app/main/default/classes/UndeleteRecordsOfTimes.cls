public class UndeleteRecordsOfTimes {
    @future
    public static void UndeleteOperation(Set<Id> idSet){
        try{
            List<Time__c> newTimeList=new List<Time__c>();
            newTimeList=[SELECT Id,OwnerId,Name,Start_Time__c,End_Time__c FROM Time__c WHERE Id in:idSet
                          AND Name LIKE 'a%' LIMIT 50000 ALL ROWS];
            
            List<Time__c> tempList=new List<Time__c>();
            
            for(Time__c each:newTimeList){
                if((each.Start_Time__c.month())==((system.today().month())-1) &&
                   (each.End_Time__c.month())==((system.today().month())-1)){
                       tempList.add(each);
                       EmailManager.sendMail(each.OwnerId, 'Attempt to delete', 'record is attempt to delete. Details are: name-'+
                                            each.Name+' start_Time:'+each.Start_Time__c);
                }
            }
            if(tempList.size()>0){
                Undelete tempList;
            }

            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}