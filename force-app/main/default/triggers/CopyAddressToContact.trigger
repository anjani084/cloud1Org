trigger CopyAddressToContact on Contact (before insert, before update) {
    If(trigger.isInsert || trigger.isUpdate){
        CopyAddressFromAccount.CopyAddressOperation(trigger.new);
    }

}