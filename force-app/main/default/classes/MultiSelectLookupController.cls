public with sharing class MultiSelectLookupController {
 
    @AuraEnabled
    public static List<RecordsData> fetchRecords(String objectName, String filterField, String searchString, String values) {
        try {
            List<RecordsData> recordsDataList = new List<RecordsData>();
            List<String> selectedvalues = (List<String>) JSON.deserialize(values, List<String>.class);
            String query = 'SELECT Id, ' + filterField + ' FROM '+objectName;
            if(selectedvalues != null && selectedvalues.size() > 0) {
                query += ' WHERE Id IN: selectedvalues LIMIT 49999';
            } else {
                query += ' WHERE '+filterField+
                 ' LIKE ' + '\'' + String.escapeSingleQuotes(searchString.trim()) + '%\' LIMIT 49999';
            }
         for(SObject s : Database.query(query)) {
             recordsDataList.add( new RecordsData((String)s.get(filterField), (String)s.get('id')) );
         }
            return recordsDataList;
     } catch (Exception err) {
      if ( String.isNotBlank( err.getMessage() ) && err.getMessage().contains( 'error:' ) ) {
                throw new AuraHandledException(err.getMessage().split('error:')[1].split(':')[0] + '.');
            } else {
                throw new AuraHandledException(err.getMessage());
            }
     }
    }
 
    public class RecordsData {
        @AuraEnabled public String label;
        @AuraEnabled public String value;
        public RecordsData(String label, String value) {
            this.label = label;
            this.value = value;
        }
    }
}