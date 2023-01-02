public class DoctorPatientMeet {
    public static void FetchPatientName(){
        List<Doctor__c> docList=new List<Doctor__c>();
        List<Paitent__c> patList=new List<Paitent__c>();
        Set<Paitent__c> result=new Set<Paitent__c>();
        List<Appointment__c> appList=new List<Appointment__c>();
       	docList=[SELECT Id,Name FROM Doctor__c  Where Createddate = This_Month LIMIT 50000];
        patList=[SELECT Id,Name FROM Paitent__c Where Createddate = This_Month LIMIT 50000];
        appList=[SELECT Id,Name,Appointment_Date__c,Doctor__c,Paitent__c,Paitent__r.Name FROM Appointment__c Where Appointment_Date__c = This_Month  LIMIT 50000];
        for(Appointment__c k:appList){
        system.debug(k.name);
        }
        Map<Id,List<Paitent__c>> docPatMap=new Map<Id,List<Paitent__c>>();
        for(Appointment__c app:appList){
            if(!docPatMap.containsKey(app.Doctor__c)){
               List<Paitent__c> tempList=new List<Paitent__c>();
                Paitent__c each=new Paitent__c();
                each.Name=app.Paitent__r.Name;
                each.Id=app.Paitent__c;
                tempList.add(each);
                docPatMap.put(app.Doctor__c,tempList);
            }
            if(docPatMap.containsKey(app.Doctor__c)){
                List<Paitent__c> tempList=new List<Paitent__c>();
                tempList=docPatMap.get(app.Doctor__c);
                 Paitent__c each=new Paitent__c();
                each.Name=app.Paitent__r.Name;
                each.Id=app.Paitent__c;
                if(tempList.contains(each)){
                    result.add(each);
                }
                tempList.add(each);
                docPatMap.put(app.Doctor__c,tempList);
            }
        }
        for(Paitent__c each1:result){
        system.debug('Paitent Name: '+each1.name+' & Patient Id: '+each1.Id);
            }
   
      
        }
    }