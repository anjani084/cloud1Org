trigger UpdateAccountName on Contact (before delete) {
    if(trigger.isDelete){
        DeleteLastNameFromAccount.DeletionOperation(trigger.old);
    }

}