trigger AmountFieldOnAccount on Contact (after insert, after update,after undelete) {
     if(trigger.isinsert || trigger.isupdate || trigger.isundelete){
        AmountFieldUpdateOnAccount.CurrentTotalAmountOnContact(trigger.new);
    }

}