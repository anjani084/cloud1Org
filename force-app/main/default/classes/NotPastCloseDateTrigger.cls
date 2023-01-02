public class NotPastCloseDateTrigger {
    public static void FutureClosedDate(List<Opportunity> oppList){
        
            if(oppList.size()>0){
            for(opportunity each:oppList){
                if(each.CloseDate < system.today()){
                    each.addError('Please Enter a Future Close Date');
                }
            }
            }
       
    }

}