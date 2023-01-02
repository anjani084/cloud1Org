public class ContactAttachmentMap{
    public static void MappingOperation(){
        try{
            Map<Id,List<Attachment>> conAttMap=new Map<Id,List<Attachment>>();
            
            List<Attachment> attList=new List<Attachment>();
            attList=[SELECT Name,contenttype,ParentId FROM Attachment LIMIT 50000];
            List<Contact> conList=new List<Contact>();
            conList=[SELECT Id FROM Contact LIMIT 50000];
            List<Attachment> newAttList=new List<Attachment>();
            
            // Take only attachments whose parentid is contactid 
            if(attList!=null && attList.size()>0){
                for(Attachment each1:attList){
                    if(conList!=null && conList.size()>0){
                        for(Contact each2:conList){
                            if(each1.parentId==each2.Id){
                                newAttList.add(each1);
                            }
                        }
                    }
                }
            }
            // Now Mapping of contact(Contact Id) and their Attachments(newAttList)
            List<AttachMent> tempList=new List<Attachment>();
            if(newAttList!=null && newAttList.size()>0){
                for(Attachment each:newattList){
                    if(conAttMap.containskey(each.parentId)){
                        tempList=conAttMap.get(each.ParentId);
                        tempList.add(each);
                        conAttMap.put(each.parentId,tempList);
                    }
                    else{
                        tempList.add(each);
                        conAttMap.put(each.ParentId,tempList);
                    }
                }
            }
            system.debug(conAttMap);
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}