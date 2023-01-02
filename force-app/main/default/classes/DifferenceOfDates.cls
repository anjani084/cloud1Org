public class DifferenceOfDates {
    public static void DifferenceOperation(){
        try{
            Datetime startDate=Datetime.newInstance(2016, 1, 2, 6, 7, 55);
            Datetime endDate=Datetime.newInstance(2016, 2, 5, 7, 8, 55);
            Long timeDifference=endDate.getTime()-startDate.getTime();
            Long sec = math.mod(timeDifference/1000,60);
            Long min = math.mod(timeDifference/(1000*60),60);
            Long hours=math.mod(timeDifference/(1000*60*60),24);
            Long days=math.mod(timeDifference/(1000*60*60*24),365);
            Long years=timeDifference/(1000*60*60*365);
            system.debug('Difference between two Dates is: '+years+'years '+days+'days '+hours+'hours '+min+'minutes '+sec+'seconds');
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}