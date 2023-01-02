public with sharing class CustomLookup_ctrl {
    public String fieldTypeForSelectedField {get;set;}
    public list<PhoneNumberDetail> listOfLookupsElement {get;set;}
    public list<Accountdetails> warpAccdata {get;set;}
    public String objectName {get;set;}
    public String fieldName {get;set;}
    public String searchByName{get;set;}
    public String searchByPhone{get;set;}
    public boolean isChecked {get;set;}
    public String phoneNumberPassToTextBox {get;set;}
    public String phoneNamePassToHdn {get;set;}
    public String ProjectNamesToTextBox {get;set;}
    public String ProjectNamesTohdn {get;set;}
    
    public boolean isAllSelectCheckBox {get;set;}
    /*Controller*/
    public CustomLookup_ctrl (){
        listOfLookupsElement = new list<PhoneNumberDetail>();
        warpAccdata  = new list<Accountdetails>();
        //  objectName = String.escapeSingleQuotes(ApexPages.CurrentPage().getParameters().get('oN'));
        // fieldName = String.escapeSingleQuotes(ApexPages.CurrentPage().getParameters().get('fN'));
        objectName = 'Account';
        fieldName = 'Email';
        isAllSelectCheckBox = false;
        searchByPhone = '';
        searchByName ='';
        ProjectNamesToTextBox = '';
        ProjectNamesTohdn = '';
        phoneNumberPassToTextBox = '';
        phoneNamePassToHdn  = '';
        getlistOfLookupsElement();
        getwarpAccdata();
    }
    /*to get list of lookup element*/
    public void getlistOfLookupsElement(){
        try{
            listOfLookupsElement = new list<PhoneNumberDetail>();
            warpAccdata  = new list<Accountdetails>();
            String query = 'SELECT Name,'+fieldName+' FROM '+objectName;
            list<SObject> s = Database.query(query);
            String CountryCode = null;
            boolean isCountryCodeAlreadyExist;
            for(sObject sObj:s){
                CountryCode = null;
                isCountryCodeAlreadyExist = false;
                if(sObj.get(fieldName) != null && sObj.get('Name') != null){
                    if(String.valueOf(sObj.get(fieldName)).startsWith('+1')){
                        CountryCode = '+1';
                        isCountryCodeAlreadyExist = true;
                    }else if(String.valueOf(sObj.get(fieldName)).startsWith('+91')){
                        CountryCode = '+91';
                        isCountryCodeAlreadyExist = true;
                    }else if(String.valueOf(sObj.get(fieldName)).startsWith('+44')){
                        CountryCode = '+44';
                        isCountryCodeAlreadyExist = true;
                    }else if(String.valueOf(sObj.get(fieldName)).contains('+86')){
                        CountryCode = '+86';
                        isCountryCodeAlreadyExist = true;
                    }
                    listOfLookupsElement.add(new PhoneNumberDetail(String.valueOf(sObj.get('Name')),CountryCode,String.valueOf(sObj.get(fieldName)),false,isCountryCodeAlreadyExist));
                }
            }
        }catch(Exception ex){
            //  apexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Parameter is23333345 not defined, Please contact your Administrator!'));
        }
    }
    
    public void getwarpAccdata(){
        try{
            //listOfLookupsElement = new list<PhoneNumberDetail>();
            warpAccdata  = new list<Accountdetails>();
            // String query = 'SELECT Name,'+fieldName+' FROM '+objectName;
            list<Account> Acc = new list<Account>();
            Acc = [select id,Name from Account order by Name asc  limit 999];
            for(Account P : Acc)
            {
                Accountdetails pr = new Accountdetails();
                pr.isChecked = false;
                pr.Projectid = P.id;
                pr.ProjectName = P.Name;
                warpAccdata.add(pr);
            }
            
        }catch(Exception ex){
            //  apexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Parameter is not defined, Please contact your Administrator!'));
        }
    }
    
    /*Search event*/
    public void onSearch(){
        phoneNumberPassToTextBox = '';
        phoneNamePassToHdn  = '';
        ProjectNamesToTextBox = '';
        ProjectNamesTohdn = '';
        isAllSelectCheckBox = false;
        listOfLookupsElement = new list<PhoneNumberDetail>();
        warpAccdata = new list<Accountdetails>();
        String byName = +searchByName+'%';
        String byPhone = '\'%'+String.escapeSingleQuotes(searchByPhone) + '%\'';
        String CountryCode = null;
        boolean isCountryCodeAlreadyExist;
        try{
            
            list<Account> Acc = new list<Account>();
            Acc = [select id,Name from Account where Name Like: byName order by Name asc  limit 999];
            for(Account P : Acc)
            {
                Accountdetails pr = new Accountdetails();
                pr.isChecked = false;
                pr.Projectid = P.id;
                pr.ProjectName = P.Name;
                warpAccdata.add(pr);
            }
            
        }catch(Exception ex){
            apexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Illegal Search parameter!'));
        }
    }
    
    /*Event for check box checked*/
    public void onCheck(){
        phoneNumberPassToTextBox = '';
        phoneNamePassToHdn  = '';
        ProjectNamesToTextBox = '';
        ProjectNamesTohdn = '';
        String CountryCode  = '';
        for(PhoneNumberDetail pn:listOfLookupsElement){
            if(pn.isChecked){
                if(pn.countryCode == null || pn.countryCode == ''){
                    phoneNumberPassToTextBox += pn.sObjectPhone+',';
                    phoneNamePassToHdn += pn.sObjectNameField+',';
                    //apexPages.addMessage(new ApexPages.message(ApexPages.severity.Warning,'Default Country code selected to phone number "'+pn.sObjectPhone+'"!'));
                    //apexPages.addMessage(new ApexPages.message(ApexPages.severity.Warning,'Please select a country for "'+pn.sObjectNameField +'" Name and Phone Number "'+pn.sObjectPhone+'"'));
                }else{
                    if(pn.sObjectPhone.startsWith('+1') || pn.sObjectPhone.startsWith('+91') || pn.sObjectPhone.startsWith('+44')||pn.sObjectPhone.startsWith('+86')){
                        phoneNumberPassToTextBox += pn.sObjectPhone+',';
                        phoneNamePassToHdn += pn.sObjectNameField+',';
                    }else{
                        phoneNumberPassToTextBox += pn.countryCode+pn.sObjectPhone+',';
                        phoneNamePassToHdn += pn.sObjectNameField+',';
                    }
                }
            }
        }
        
        for(Accountdetails pd : warpAccdata )
        {
            if(pd.isChecked){
                ProjectNamesToTextBox += pd.ProjectName+';';
                ProjectNamesTohdn += pd.Projectid+',';
            }
        }
        system.debug(warpAccdata.size()+'-----warpAccdata--------'+warpAccdata);
        system.debug('-------ProjectNamesToTextBox-----'+ProjectNamesToTextBox);
        system.debug('---------ProjectNamesTohdn--------'+ProjectNamesTohdn);
    }
    /*Event for all select in single check*/
    public void onSelectAll(){
        phoneNumberPassToTextBox = '';
        phoneNamePassToHdn  = '';
        String CountryCode  = '';
        for(PhoneNumberDetail pn:listOfLookupsElement){
            if(isAllSelectCheckBox){
                pn.isChecked = true;
            }else{
                pn.isChecked = false;
            }
            if(pn.isChecked){
                if(pn.countryCode == null || pn.countryCode == ''){
                    phoneNumberPassToTextBox += pn.sObjectPhone+',';
                    phoneNamePassToHdn += pn.sObjectNameField+',';
                    //apexPages.addMessage(new ApexPages.message(ApexPages.severity.Warning,'Default Country code selected to phone number "'+pn.sObjectPhone+'"!'));
                    //apexPages.addMessage(new ApexPages.message(ApexPages.severity.Warning,'Please select a country for "'+pn.sObjectNameField +'" Name and Phone Number "'+pn.sObjectPhone+'"'));
                }else{
                    if(pn.sObjectPhone.startsWith('+1') || pn.sObjectPhone.startsWith('+91') || pn.sObjectPhone.startsWith('+44')||pn.sObjectPhone.startsWith('+86')){
                        phoneNumberPassToTextBox += pn.sObjectPhone+',';
                        phoneNamePassToHdn += pn.sObjectNameField+',';
                    }else{
                        phoneNumberPassToTextBox += pn.countryCode+pn.sObjectPhone+',';
                        phoneNamePassToHdn += pn.sObjectNameField+',';
                    }
                }
            }
        }
    }
    /*P2l Detail wrapper*/
    public class PhoneNumberDetail{
        public boolean isChecked {get;set;}
        public string sObjectNameField {get;set;}
        public string sObjectPhone {get;set;}
        public string countryCode {get;set;}
        public boolean isCountryCodeExist {get;set;}
        public PhoneNumberDetail(string sObjectNameField,string countryCode,string sObjectPhone,boolean isChecked,boolean isCountryCodeExist ){
            this.sObjectNameField = sObjectNameField;
            this.sObjectPhone = sObjectPhone ;
            this.countryCode  = countryCode ;
            this.isChecked = isChecked ;
            this.isCountryCodeExist = isCountryCodeExist;
        }
    }
    
    public class Accountdetails{
        public boolean isChecked {get;set;}
        public string Projectid {get;set;}
        public string ProjectName {get;set;}
        
        public Accountdetails()
        {}
        
        public Accountdetails(boolean isChecked,string Projectid,string ProjectName){
            
            this.isChecked = isChecked ;
            this.Projectid = Projectid;
            this.ProjectName  = ProjectName ;
        }
    }
    
}