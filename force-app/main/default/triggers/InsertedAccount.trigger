trigger InsertedAccount on Account (after insert) {
    if(trigger.isinsert && trigger.isafter){
      //  AccountDebug.debugAccount(trigger.new);
    }

}