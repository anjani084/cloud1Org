public class Activitytask {
    @AuraEnabled
    Public Static List<String> SubjectList()
    {
        try{
            List<String> taskSubject = New List<String>();
            Schema.DescribeFieldResult objFieldDescribe = Task.Subject.getDescribe();
            List<Schema.PicklistEntry> lstPickListValues = objFieldDescribe.getPickListValues();
            for (Schema.PicklistEntry objPickList : lstPickListValues) {
                taskSubject.add(objPickList.getValue());
            }
            return taskSubject;
        }Catch(Exception e){
            System.debug('Error is: '+e.getMessage()+' At Line: '+e.getLineNumber());
            return Null;
        }
    }
}