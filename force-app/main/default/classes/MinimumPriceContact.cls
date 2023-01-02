public class MinimumPriceContact {
    public static void MinimumOperation(){
        try{
            Map<Id,List<Contact>> IdvsCon=new Map<Id,List<Contact>>();
            List<Contact> conList=new List<Contact>();
            conList=[SELECT Id,AccountId,Price__c FROM Contact WHERE AccountId!=null LIMIT 50000];
            
            //Mapping of Account id vs ContactList
            if(conList!=null && conList.size()>0){
                for(Contact each:conList){
                    if(IdvsCon.containskey(each.AccountId)){
                        List<Contact> tempList=new List<Contact>();
                        tempList=IdvsCon.get(each.AccountId);
                        tempList.add(each);
                        IdvsCon.put(each.AccountId,tempList);
                    }else{
                        List<Contact> tempList=new List<Contact>();
                        tempList.add(each);
                        IdvsCon.put(each.AccountId,tempList);
                    }
                }
            }
            if(IdvsCon!=null && IdvsCon.size()>0){
                For(Id each:IdvsCon.keyset()){
                    if(IdvsCon.get(each).size()>2){
                        system.debug('Account id have minimum 3 contacts: '+each);
                        integer j=50000;
                        for(integer i=0;i<IdvsCon.get(each).size();i++){
                            if(IdvsCon.get(each)[i].Price__c!=null){
                            j=Math.min(j,integer.valueOf(IdvsCon.get(each)[i].Price__c));
                            }
                        }
                        system.debug('Contact with minimum price: '+j);
                        
                    }
                }
            }
            
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}