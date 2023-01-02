public class StudentsScore {
    public static void CalculationOperation(){
        try{
            List<Student__C> studList=new List<Student__C>();
            studList=[SELECT Name,Lowest_Scoring_Subject__c,Percentage__c,Total_Marks__c,Highest_Scoring_Subject__c FROM Student__c LIMIT 50000];
            List<Score__C> scoreList=new List<Score__C>();
            scoreList=[SELECT Student__r.name,Marks__c,Subject__c FROM Score__c WHERE Student__c!=null LIMIT 50000];
            //Filling of fields of student object
            if(studList!=null && studList.size()>0){
                for(Student__c each:studList){
                    integer i=0;
                    integer j=101;
                    integer s=0;
                    integer k=0;
                    if(scoreList!=null && scoreList.size()>0){
                        for(Score__c each1:scoreList){
                            if(each.name==each1.Student__r.name){
                                k++;
                                s+=integer.valueof(each1.Marks__c);
                                if(each1.Marks__c>i){
                                    each.Highest_Scoring_Subject__c=each1.Subject__c;
                                    i=integer.valueof(each1.Marks__c);
                                }
                                if(each1.Marks__c<j){
                                    each.Lowest_Scoring_Subject__c=each1.Subject__c;
                                    j=integer.valueof(each1.Marks__c);
                                }
                                
                            }
                        }
                    }
                    each.Total_Marks__c=s;
                    if(k!=0){
                    each.Percentage__c=s/k;
                    }
                }
            }
            if(studList!=null && studList.size()>0){
                Upsert studList;
            }
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+'At Line: '+e.getLineNumber());
        }
    }

}