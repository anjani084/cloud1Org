trigger FieldRepresentativeSales on Account (before insert, before update) {
    if(trigger.isinsert){
         AccountVerticalFieldUpdate.FieldUpdateOperation(trigger.new);
        SalesRepresentativeOnAccount.FieldFillingOperation(trigger.new);
    }

}