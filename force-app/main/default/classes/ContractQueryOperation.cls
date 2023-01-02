public class ContractQueryOperation {
    public static void ContractOperation(){
        try{
            List<Contract> conList=new List<Contract>();
            conList=[SELECT Id, AccountId,status,StartDate,ContractTerm FROM Contract WHERE AccountId!=null and CustomerSignedId!=null LIMIT 50000];
            List<Contact> contList=new List<Contact>();
            contList=[SELECT Id, Name, AccountId FROM Contact LIMIT 50000];
            
            List<Contract> newConList=new List<Contract>();
            
            if (conList!=null && conList.size()>0){
                for(Contract each:conList){
                    if(conList!=null && conList.size()>0){
                        for(Contact each2:contList){
                            if (each2.accountid==each.accountid){
                                Contract newCon=new Contract();
                                newCon.AccountId=each.AccountId;
                                newCon.CustomerSignedId=each2.Id;
                                newCon.StartDate=each.StartDate;
                                newCon.Status=each.Status;
                                newCon.ContractTerm=each.ContractTerm;
                                newConList.add(newCon);
                            }
                        }
                    }
                    
                }
            }
            // Just Check the list element:
            system.debug(newConList);
            
            // Insert new contract List after null check and size check.
            if(newConList!=null && newConList.size()>0){
                insert newConList;
            }
        }catch(exception e){
            system.debug('Error: '+e.getMessage()+' at line: '+e.getLineNumber());
        }
    }

}