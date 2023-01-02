public class MaintenanceObject {
    public static void AverageRatingOperation(){
        try{
           
            List<Maintenance__c> mainList=new List<Maintenance__c>();
            mainList=[SELECT Rating__c,Contact__c FROM Maintenance__c LIMIT 50000];
            List<contact> conList=new List<contact>();
            conList=[SELECT Id, Average_Rating__c FROM Contact LIMIT 50000];
            List<Contact> newConList=new List<Contact>();

            if(conList!=null && conList.size()>0){
                for(Contact each:conList){
                    integer i=0;
                    integer j=0;
                    if(mainList!=null && mainList.size()>0){
                        for(maintenance__c each1:mainList){
                            if(each1.contact__c==each.Id){
                            i=i+integer.valueOf(each1.rating__c);
                            j++;
                                }
                        }
                    }
                    if(j!=0){
                    each.Average_Rating__c=string.valueOf(i/j);
                    }
                }
                }
            if(conList!=null && conList.size()>0){
                Upsert conList;
            }
        }
         catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
        
    }

}