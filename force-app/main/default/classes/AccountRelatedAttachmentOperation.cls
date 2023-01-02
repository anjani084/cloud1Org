public class AccountRelatedAttachmentOperation {
    public static void AccountContactAttachmentOperation(){
        try{
            List<Account> accList=new List<Account>();
            accList=[SELECT Id FROM Account LIMIT 50000];
            List<Attachment> attList=new List<Attachment>();
            attList=[SELECT Id,Name,ParentId,Body FROM Attachment WHERE ParentId in:accList LIMIT 50000];
            List<Contact> conList=new List<Contact>();
            conList=[SELECT Id,AccountId FROM Contact WHERE AccountId in:accList LIMIT 50000];
            system.debug(attList);
            system.debug(conList);
            
            // Deletion of all other contact except one contact:
            
            List<Contact> contList=new List<Contact>();
            if(accList!=null && accList.size()>0){
                for(Account each:accList){
                    integer i=0;
                    if(conList!=null && conList.size()>0){
                        for(Contact each1:conList){
                            if(each1.AccountId==each.Id){
                                i=i+1;
                                if(i==2){
                                    i-=1;
                                    contList.add(each1);
                                }
                            }
                        }
                    }
                }
            }
            //Delete all cases that are associated with upper contacts 
            List<Case> casList=new List<Case>();
            casList=[SELECT Id,ContactId FROM Case WHERE ContactId in:contList LIMIT 50000];
            if(casList!=null && casList.size()>0){
                Delete casList;
            }
            if(contList!=null && contList.size()>0){
                Delete contList;
            }
            
            // Deletion of Attachment except one attachment associate with account
            
            List<Attachment> attList2=new List<Attachment>();
            if(accList!=null && accList.size()>0){
                for(Account each:accList){
                    integer i=0;
                    if(attList!=null && attList.size()>0){
                        for(Attachment each1:attList){
                            if(each1.ParentId==each.Id){
                                i+=1;
                                if(i==2){
                                   
                                    attList2.add(each1);
                                    i=i-1;
                                }
                            }
                        }
                    }
                }
            }
            if(attList2!=null && attList2.size()>0){
                Delete attList2;
            }
            // Copy of attachment under the contact associate with account(same attachment):
            
            List<Attachment> attList3=new List<Attachment>();
            if(conList!=null && conList.size()>0){
                for(Contact each:conList){
                    if(attList!=null && attList.size()>0){
                        for(Attachment each2:attList){
                            if(each2.ParentId==each.AccountId){
                                Attachment att=new Attachment();
                                att=each2.clone();
                                att.ParentId=each.Id;
                                attList3.add(att);
                            }
                        }
                    }
                }
            }
            if(attList3!=null && attList3.size()>0){
                insert attList3;
            }
            
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+'at Line: '+e.getLineNumber());
        }
    }

}