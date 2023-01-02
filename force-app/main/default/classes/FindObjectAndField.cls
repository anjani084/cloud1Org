public class FindObjectAndField {
    @auraenabled
    public static List<String> ObjectName(){
        try{
            List<String> objects=new List<String>();
            List<Schema.SObjectType> fieldName = New List<Schema.SObjectType>();
            fieldName = Schema.getGlobalDescribe().Values();  
            system.debug('apex class run');
            
            for(SObjectType sot : fieldName){
                objects.add(sot.getDescribe().getname());
}
            system.debug(objects);
            objects.sort();
            return objects; 
        }catch(exception e){
            system.debug('error: '+e.getMessage()+' at Line: '+e.getLineNumber());
            return null;
        }
        
    }
    @auraEnabled
    public static List<String> FieldNames(String str){
        try{
            List<String> fieldList=new List<String>();
            Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Map <String, Schema.SObjectField> fieldMap = schemaMap.get(str).getDescribe().fields.getMap();
            for(Schema.SObjectField sfield : fieldMap.Values())
            {
                schema.describefieldresult dfield = sfield.getDescribe();
                fieldList.add(dfield.getName());
                
              }
            system.debug(fieldList);
            return fieldList;
            
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
            return null;
        }
    }
    @auraenabled
    public static String Datatypemethod(string fieldName,string objectName){
        try{
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Schema.SObjectType leadSchema = schemaMap.get(objectName);
            Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
            string fdt;

           for (String fieldsName: fieldMap.keySet()) {
               if(fieldsName==fieldName){
                fdt = string.valueof(fieldMap.get(fieldName).getDescribe().getType());
               }
}
            system.debug(fdt);
            return fdt;
            
        
        }catch(exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
            return null;
        }
    }

}