public class ScoreContactLookUp {
    public static void HighestAndLowestPrice(){
        try{
            List<Score__C> scoreList=new List<Score__C>();
            scoreList=[SELECT Contact__c,Marks__c,Subject__c FROM Score__c WHERE Contact__c!=null LIMIT 50000];
            Set<Id> idSet=new Set<Id>();
            if(ScoreList!=null && scoreList.size()>0){
                for(Score__c each:ScoreList){
                    idSet.add(each.contact__c);
                }
            }
            List<Contact> conList=new List<Contact>();
            ConList=[SELECT Id,Name FROM Contact WHERE Id in:idSet LIMIT 50000];
            if(conList!=null && conList.size()>0){
                for(Contact each:conList){
                    integer i=0;
                    integer j=10000;
                    String highestScore;
                    String lowestScore;
                    system.debug(each.Name);
                    if(scoreList!=null && scoreList.size()>0){
                        for(Score__c each1:scoreList){
                            if(each.Id==each1.contact__c){
                                if(each1.Marks__c>i){
                                    i=integer.valueof(each1.Marks__c);
                                    highestScore=each1.Subject__c;
                                    
                                }
                                if(each1.Marks__c<j){
                                    j=integer.valueof(each1.Marks__c);
                                    lowestScore=each1.Subject__c;
                                }
                                
                            }
                        }
                    }
                    system.debug('Highest Score is: '+ i +' and subject is: '+highestScore);
                    system.debug('Lowest  Score is: '+j+' and subject is: '+lowestScore);
                }
            }
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    } 

}