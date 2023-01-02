trigger AddContactTrigger on Account (after insert) {
    if(trigger.isinsert){
        DefaultContactToAccount.AddContactByDefault(trigger.new);
    }

}