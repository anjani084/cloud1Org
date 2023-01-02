trigger AddLastName on Contact (after insert) {
    if(trigger.isInsert){
        UpdateAccountName.AddLastNameOperation(trigger.new);
    }

}