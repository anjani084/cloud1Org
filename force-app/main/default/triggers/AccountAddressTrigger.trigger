trigger AccountAddressTrigger on Account (before insert,before update) {
    if(trigger.isUpdate || trigger.isInsert){
        //AccountVerticalFieldUpdate.FieldUpdateOperation(trigger.new);
    }
}