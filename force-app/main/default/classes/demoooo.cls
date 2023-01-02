public class demoooo {
	 @AuraEnabled 
    public static List<RecordsData> fetchRecords( String objectName, String filterField, String searchString ) {
        List<RecordsData> recordsDataList = new List<RecordsData>();
        try {
            String query = 'SELECT Id, ' + filterField+
                ' FROM '+objectName+
                ' WHERE '+filterField+' LIKE ' + '\'' + String.escapeSingleQuotes(searchString.trim()) + '%\'' + ' LIMIT 50000';
            
            for(SObject s : Database.query(query)){
                recordsDataList.add( new RecordsData((String)s.get(filterField), (String)s.get('id')) );
            } 
        } catch(Exception err) {
            if ( String.isNotBlank( err.getMessage() ) && err.getMessage().contains( 'error:' ) ) {
                throw new AuraHandledException(err.getMessage().split('error:')[1].split(':')[0] + '.');
            } else {
                throw new AuraHandledException(err.getMessage());
            }
        }
        return recordsDataList;
    }
    
    @AuraEnabled
    public static List<RecordsData> SobjectList (String objectName, String filterField){
        try{
            List<RecordsData> SelectobjectList = New List<RecordsData>();
            system.debug('In second Method');
            
            String query = 'SELECT Id, ' + filterField+
                ' FROM '+objectName+ ' LIMIT 50000';
            
            for(SObject s : Database.query(query)){
                SelectobjectList.add( new RecordsData((String)s.get(filterField), (String)s.get('id')) );
            }
            return SelectobjectList;  
        }catch(Exception err)
        {
            system.debug('Error is: '+err.getMessage()+' At line No. '+err.getLineNumber());
        }
        return Null;
    }
    
    public class RecordsData{
        @AuraEnabled public String label;
        @AuraEnabled public String value;
        public RecordsData(String label, String value) {
            this.label = label;
            this.value = value;
        }
    }
}