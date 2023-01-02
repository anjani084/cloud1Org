public class DailyStatusTime {
    public static void TimeIntervalOperation(){
        try{
            List<Daily_Status__c> dailyStatusList=new List<Daily_Status__c>();
            dailyStatusList=[SELECT Id,Time_Interval__c,Employee__c FROM Daily_Status__c WHERE Employee__c!=null LIMIT 50000];
            Set<Id> idSet=new Set<Id>();
            if(dailyStatusList!=null && dailyStatusList.size()>0){
                for(Daily_Status__c each:dailyStatusList){
                    idSet.add(each.Employee__c);
                }
            }
            List<Contact> conList=new List<Contact>();
            conList=[SELECT Id,Name FROM Contact WHERE Id in:idSet LIMIT 50000];
            if(conList!=null && conList.size()>0){
                for(Contact each:conList){
                    integer s=0;
                    decimal longTimeInterval;
                    decimal shortTimeInterval;
                    if(dailyStatusList!=null && dailyStatusList.size()>0){
                        for(Daily_Status__c each1:dailyStatusList){
                            if(each.Id==each1.Employee__c){
                            if(s==0){
                                longTimeInterval=each1.Time_Interval__c;
                                shortTimeInterval=each1.Time_Interval__c;
                                s=1;
                            }
                            else{
                                if(longTimeInterval<each1.Time_Interval__c){
                                    longTimeInterval=each1.Time_Interval__c;
                                }
                                if(shortTimeInterval>each1.Time_Interval__c){
                                    shortTimeInterval=each1.Time_Interval__c;
                                }
                            }
                            
                        }
                    }
                    }
                    system.debug('Contact: '+each.Name+' have longest TimeInterval: '+longTimeInterval+' and shortest TimeInterval is: '+shortTimeInterval);
                }
            }
            
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}