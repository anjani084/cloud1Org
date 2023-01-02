trigger InsertedAccountdebug on webchat__ChatTransferEvent__e (after insert) {
    List<Account> accList = new List<Account>();
    if(trigger.isInsert && trigger.isAfter){
    AccountDebug.debugAccount(accList);
    }

}