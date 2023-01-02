public class RecordsInsertToTimes {
    public static void InsertionOperation(){
        try{
            List<Time__c> tempList=new List<Time__c>();
            for(Integer i=0;i<100;i++){
                Time__c temp=new Time__c();
                temp.Name='ANJ'+i;
                temp.Start_Time__c=system.today().addDays(i);
                temp.End_Time__c=system.today().addDays(i+1);
                tempList.add(temp);
            }
            if(tempList.size()>0){
                insert tempList;
            }
            system.debug(tempList);
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
        
    }

}