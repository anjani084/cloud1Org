trigger OpportunityChangeTrigger on OpportunityChangeEvent (after insert) {
        List<Opportunity> opps = new List<Opportunity>();

     List<Task> tasks = new List<Task>();
  // Iterate through each event message.
  for (OpportunityChangeEvent event : Trigger.New) {
    // Get some event header fields
    EventBus.ChangeEventHeader header = event.ChangeEventHeader;
   
    
    // Get record fields and display only if not null.
    //System.debug('Some Employee record field values from the change event:');
    if ((header.changetype=='UPDATE') && (event.isWon == true)) {
        // Create a task
         Task tk = new Task();
    tk.Subject = 'Follow up on won opportunities: ' + header.recordIds;
    tk.OwnerId = header.CommitUser;
    tasks.add(tk);
    }
    
  // Insert all tasks in bulk.
  if (tasks.size() > 0) {
    insert tasks;
  }
  }
}