trigger EmployeeChangeTrigger on Employee__ChangeEvent (after insert) {
   
  List<Task> tasks = new List<Task>();
  // Iterate through each event message.
  for (Employee__ChangeEvent event : Trigger.New) {
    // Get some event header fields
    EventBus.ChangeEventHeader header = event.ChangeEventHeader;
    System.debug('Received change event for ' +
      header.entityName +
      ' for the ' + header.changeType + ' operation.');
    // For update operations, we can get a list of changed fields
    if (header.changetype == 'UPDATE') {
        System.debug('List of all changed fields:');
        for (String field : header.changedFields) {
            if (null == event.get(field)) {
                System.debug('Deleted field value (set to null): ' + field);
            } else {
                System.debug('Changed field value: ' + field + '. New Value: '
                    + event.get(field));
            }
        }
    }
    // Get record fields and display only if not null.
    System.debug('Some Employee record field values from the change event:');
    if (event.First_Name__c != null) {
      System.debug('First Name: ' + event.First_Name__c);
    }
    if (event.Last_Name__c != null) {
      System.debug('Last Name: ' + event.Last_Name__c);
    }
    if (event.Name != null) {
      System.debug('Name: ' + event.Name);
    }
    if (event.Tenure__c != null) {
      System.debug('Tenure: ' + event.Tenure__c);
    }
    // Create a followup task
    Task tk = new Task();
    tk.Subject = 'Follow up on employee record(s): ' +
    header.recordIds;
    tk.OwnerId = header.CommitUser;
    tasks.add(tk);
  }
  // Insert all tasks in bulk.
  if (tasks.size() > 0) {
    insert tasks;
  }

}