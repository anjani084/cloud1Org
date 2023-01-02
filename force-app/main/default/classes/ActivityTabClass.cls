public class ActivityTabClass {
    @auraenabled
    public static String OwnerEmailMethod(string ContactId){
        try{
            List<Contact> conList=new List<Contact>();
            conList=[SELECT Id,Owner.Email FROM Contact WHERE Id=:ContactId LIMIT 1];
            return conList[0].Owner.Email;
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
            return null;
        }
    }
    @auraenabled
    public static void mailingMethod(List<String> ToEmail, string Subject, string myVal, List<string> Bccaddress, List<string> Ccaddress, List<String> ListofIds){
        try{
            system.debug('in activity tab class>>>>>');
            system.debug('in activity tab class>>>>>'+ToEmail);
            system.debug('in activity tab class>>>>>'+Bccaddress);
            system.debug('in activity tab class>>>>>'+Ccaddress);
            system.debug('in ListofIds>>>>>'+ListofIds);
            Set<Id> idSet=new Set<Id>();
            for(String arc:ListofIds){
                idSet.add(arc);
            }
            List<Id> ListOfIdes=new List<Id>();
            for(string Id:idSet){
                ListOfIdes.add(Id);
            }
            
            system.debug('in ListOfIdes>>>>>'+ListOfIdes);
        MultiEmailManager.sendMail(ToEmail, Subject, myVal,Bccaddress, Ccaddress, ListOfIdes);
        }
        catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
        
    }
     public Class Wrapper
    {
        Public List<Account> acc_list{get;set;}
        Public List<Contact> con_list{get;set;}
        Public String str{get;set;}
        Public Integer integerval{get;set;}
        public List<Wrapper> wraper_List{get;set;}
    }
    
    @AuraEnabled
    public static wrapperClass SearchKeyonContact(String searchKeyyy) {
        try{
         system.debug('searchKeyyy'+searchKeyyy);
        String namez = searchKeyyy + '%';
        system.debug(namez);
            list<Contact> conlist = new list<Contact>();
            conlist = [SELECT id, name, Email FROM Contact WHERE Email LIKE :namez LIMIT 50000];
            list<Lead> leadlist = new list<Lead>();
            leadlist = [SELECT Id, Name, Email FROM Lead WHERE Email LIKE :namez LIMIT 50000];
            List<wrapperClass> wraper_List = new List<wrapperClass>();
            wrapperClass wrapper_obj = new wrapperClass();
            
            wrapper_obj.contactList = conlist;
            wrapper_obj.leadd_list = leadlist;
            //wraper_List.add(wrapper_obj);
            System.debug('Wrapper DATA:::'+wrapper_obj);
             System.debug('Wrapper DATA In LIST:::'+wraper_List);
            return wrapper_obj;
        }catch(exception e){
            system.debug('Error: '+e.getMessage()+' at line: '+e.getLineNumber());
            return null;
        }
    }
    public class wrapperClass
    {@AuraEnabled
        public list<Contact> contactList;
        @AuraEnabled
        public list<Lead> leadd_list;
    }
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
    
    public class RecordsData{
        @AuraEnabled public String label;
        @AuraEnabled public String value;
        public RecordsData(String label, String value) {
            this.label = label;
            this.value = value;
        }
    }
      @Auraenabled
    public static List<String> fetchPickList(){
        try{
            List<String> pickList= new List<String>();
            
            Schema.DescribeFieldResult fieldResult = Task.Subject.getDescribe();
            List<Schema.PicklistEntry> schPEntry = fieldResult.getPicklistValues();
            
            if(schPEntry.size()>0){
            for( Schema.PicklistEntry each : schPEntry){
                pickList.add(each.getLabel());
            }
            }
            
            return pickList;
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
            return null;
        }
    }
    @AuraEnabled
    public static String SaveLogACall(String WhatId, String WhoId, String Subject, string Comments, date DueDate){
        try{
            Task SLAC=new Task();
            SLAC.Description=Comments;
            SLAC.WhoId=WhoId;
            SLAC.WhatId=WhatId;
            SLAC.Subject=Subject;
            SLAC.ActivityDate=DueDate;
            insert SLAC;
            system.debug('insert successFully>>>>>'+SLAC);
            return SLAC.Id;
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
            return null;
        }
    }
        @auraEnabled
        public static List<String> fetchStatusPickList(){
        try{
            List<String> pickList= new List<String>();
            
            Schema.DescribeFieldResult fieldResult = Task.Status.getDescribe();
            List<Schema.PicklistEntry> schPEntry = fieldResult.getPicklistValues();
            
            if(schPEntry.size()>0){
            for( Schema.PicklistEntry each : schPEntry){
                pickList.add(each.getLabel());
            }
            }
            system.debug(pickList);
            return pickList;
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
            return null;
        }
    }
        @auraenabled
        public static string SaveNewTask(String WhatId, String WhoId, String Subject, string Status, Date ActivityDate,
                                        String AssignedTo){
        try{
            
            Task SLAC=new Task();
            SLAC.Subject=Subject;
            SLAC.WhoId=WhoId;
            SLAC.WhatId=WhatId;
            SLAC.Status=Status;
            SLAC.ActivityDate=ActivityDate;
            SLAC.OwnerId=AssignedTo;
            
                insert SLAC;
            
            
            system.debug('insert successFully>>>>>'+SLAC);
            return SLAC.Id;
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
            return null;
        }
                                        }
    @auraenabled
    public static string EventCreate(boolean check,string WhatId,string Subject, string Location, string WhoId,string AssignedTo, dateTime StartDate,dateTime endDate ){
    try{
        Event eve=new Event();
        eve.OwnerId=AssignedTo;
        eve.EndDateTime=endDate;
        eve.StartDateTime=StartDate;
        eve.WhatId=WhatId;
        eve.WhoId=WhoId;
        eve.Location=Location;
        eve.IsAllDayEvent=check;
        system.debug('event created1'+eve);
        insert eve;
        system.debug('event created2'+eve);
        return eve.Id;
        
    }catch(exception e){
        system.debug('error: '+e.getMessage());
        return null;
    }
                                        
                                        
    }
    @auraenabled
    public static string TaskCreationOp(string recordId, string whatId, string Subject, List<string> bccmail
                                       , List<string> ccmail, List<string> Tomail){
        try{
            List<Contact> tkList=new List<Contact>();
            tkList=[SELECT Id,Name FROM Contact WHERE Id=:recordId];
            List<Lead> leadList=new List<Lead>();
            leadList=[SELECT Id,Name FROM Lead WHERE Id=:recordId];
            String str;
            if(tkList.size()>0){
                str=tkList[0].name;
            }else{
                str=leadList[0].name;
            }
            Task tk=new Task();
            tk.WhoId=recordId;
            tk.WhatId=whatId;
            tk.Subject='Email : '+Subject;
            tk.Status='Completed';
            tk.Priority='Normal';
            tk.ActivityDate=system.today();
            insert tk;
            system.debug('inserted successfully: '+tk);
            return tk.Id;
            
        }catch(exception e){
            system.debug('error : '+e.getMessage()+'at line: '+e.getLineNumber());
            return null;
        }
    }
        @auraenabled
        public static List<ContentVersion> fetchAttachment(){
            try{
                 return [SELECT Id, Title, ContentDocumentId FROM ContentVersion ORDER BY createdDate ASC];
                
            }catch(exception e){
                system.debug('Error:'+e.getMessage()+ 'at Line: '+e.getLineNumber());
                return null;
            }
        }
    @AuraEnabled
    public static ContentVersion getSelectedFile(Id contentDocumentIdofFile){
        System.debug('contentDocumentIdofFile'+contentDocumentIdofFile);
        ContentVersion contentVersionobj = new ContentVersion();
        contentVersionobj=[SELECT Id, Title, VersionData, FileExtension FROM ContentVersion WHERE ContentDocumentId = :contentDocumentIdofFile WITH SECURITY_ENFORCED];
        system.debug('contentVersionobj>>>>>>'+contentVersionobj);
        return contentVersionobj;
    }
    @AuraEnabled
    public static List<EmailTemplate> fetchEmailTempList(){
        List<EmailTemplate> EtempList=new List<EmailTemplate>();
        EtempList=[select id, Name,Description,FolderName from EmailTemplate];
        return EtempList;
    }
    @AuraEnabled
    public static List<String> fetchFieldLabel(){
        
                List<String> LeadContactList=new List<String>();

        Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
       Map <String, Schema.SObjectField> fieldMap = schemaMap.get('Lead').getDescribe().fields.getMap();
       for(Schema.SObjectField sfield : fieldMap.Values())
           {
            schema.describefieldresult dLfield = sfield.getDescribe();
               LeadContactList.add(dLfield.getLabel());
               system.debug('@@@API Name : '  + dLfield.getname());
            system.debug('####Label Name : ' + dLfield.getLabel ());
           }
        Map <String, Schema.SObjectType> schemaMapc = Schema.getGlobalDescribe();
       Map <String, Schema.SObjectField> fieldMapc = schemaMap.get('Contact').getDescribe().fields.getMap();
       for(Schema.SObjectField scfield : fieldMapc.Values())
           {
            schema.describefieldresult dCfield = scfield.getDescribe();
               LeadContactList.add(dCfield.getLabel());
               system.debug('@@@API Name : '  + dCfield.getname());
            system.debug('####Label Name : ' + dCfield.getLabel ());
           }
        return LeadContactList;
    }
    
    
}