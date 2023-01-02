public class PaymentRecordCreation {
    public static void CreationOperation(){
        try{
            //Create some agreement for creating payment
            List<Agreement__C> aggList=new List<Agreement__c>();
            for(Integer i=1;i<4;i++){
                Agreement__c temp = new agreement__c();
                temp.name='abc'+i;
                temp.duration__c=string.valueof(3*i);
                aggList.add(temp);
            }
            if(aggList.size()>0){
                insert aggList;
            }
            List<Payment__c> payList=new List<Payment__c>();
            
            if(aggList.size()>0){
                for(agreement__c each:aggList){
                    for(integer j=0;j<integer.valueOf(each.duration__c);j++){
                        Payment__c temp=new Payment__c();
                        temp.name='abc'+j;
                        temp.Start_Date__c=system.today();
                        temp.End_Date__c=System.Today().addMonths(1);
                        payList.add(temp);
                    }
                }
            }
            system.debug(PayList);
            if(PayList.size()>0){
                insert PayList;
            }
            
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' At Line: '+e.getLineNumber());
        }
    }

}