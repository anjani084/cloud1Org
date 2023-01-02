@isTest
public class TestOpportunityChangeTrigger {
    @isTest static void testCreateAndUpdateOpportunity() {
        // Enable all Change Data Capture entities for notifications.
        Test.enableChangeDataCapture();
        // Insert an Employee test record
       
        insert new Opportunity(Name='Sell 100 Widgets',
                              StageName='Prospecting',
                              CloseDate=Date.today().addMonths(3));
        // Call deliver to fire the trigger and deliver the test change event.
        Test.getEventBus().deliver();
        // VERIFICATIONS
        // Check that the change event trigger created a task.
        Opportunity[] oppRecords = [SELECT Id,StageName FROM Opportunity];
        Opportunity opp = oppRecords[0];
        opp.StageName='Closed Won';
            update opp;
        
        Test.getEventBus().deliver();
        // VERIFICATIONS
       // Check that the change event trigger created a task.
       // We should have two tasks now, including one from the first trigger invocation.
      Task[] taskList2 = [SELECT Id,Subject FROM Task];
      System.assertEquals(1, taskList2.size(),
          'The change event trigger did not create the expected task.');
    }
}