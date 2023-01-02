trigger ContactInsertMail on Contact (after insert) {
    if(trigger.isInsert){
        AlertContactEmail.AlertMessageEmailOperation(trigger.new);
    }

}