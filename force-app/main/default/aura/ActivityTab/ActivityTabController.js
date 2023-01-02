({
    handleChange: function (cmp, event) {
        // This will contain the string of the "value" attribute of the selected option
        var selectedOptionValue = event.getParam("value");
        alert("Option selected with value: '" + selectedOptionValue + "'");
    },
    init: function(cmp) {
        cmp.set('v.myVal', '<br/><br/><p><script></script></p><p>___________________________________________________________________________________________________________                <br/>Powered by Salesforce<br/>http://www.salesforce.com/<br/></p>');
    },
    OwnerEmailFunction : function(component,event,helper){
        var ContactId = component.get("v.recordid");
        console.log('In OwnerEmailHelper>>>>'+JSON.stringify(ContactId));
        var action=component.get('c.OwnerEmailMethod');
        action.setParams({
                "ContactId":ContactId
            });
        action.setCallback(this,function(response){
                if(response.getState()=="SUCCESS")
                { var EmailId = response.getReturnValue();
                }
        })
  },
    myAction : function(component,event,helper){
        try{
        console.log('myAction Controller is in running mode');
        var itemsmypill=component.get("v.itemsmypill");
        var CcMail=[];
        var itemsmypillBCc=component.get("v.itemsmypillBCc");
            var itemsmypillCc=component.get("v.itemsmypillCc");
        var BccMail=[];
        console.log('myAction Controller is in BccMail'+BccMail)
        var Subject=component.get("v.Subject");
        var Content=component.get("v.myVal");
            var ListofIds=component.get("v.ListofIds");
        var ToEmail=[];
        for(var i=0;i<itemsmypill.length;i++){
            ToEmail.push(itemsmypill[i].name);
        }
            for(var i=0;i<itemsmypillBCc.length;i++){
            BccMail.push(itemsmypillBCc[i].name);
        }
            for(var i=0;i<itemsmypillCc.length;i++){
            CcMail.push(itemsmypillCc[i].name);
        }
        
        var action1=component.get('c.mailingMethod');
        console.log('toEmail>>>>>>>>'+ToEmail)
        action1.setParams({
            "ToEmail":ToEmail,
            "Subject":Subject,
            "myVal":Content,
            "Ccaddress":CcMail,
            "Bccaddress":BccMail,
            "ListofIds":ListofIds
        });
        console.log('Email>>>'+ToEmail);
        console.log('Subject>>>>>>'+Subject);
        action1.setCallback(this,function(response){
            if(response.getState()=="SUCCESS"){
                console.log('Email send successfully');
                        //Call success Toast
                        console.log('Before toast Id>');
                        helper.showtoast(component, event, helper, 'Email Sent SuccessFully', 'success');
                component.set("v.EmailIf",true);
                component.set("v.EmailsIf",false);
                var newList=[];
                var newString="";
                component.set("v.itemsmypill",newList);
                component.set("v.itemsmypillBCc",newList);
                component.set("v.itemsmypillCc",newList);
                component.set("v.BccMail",newString);
                component.set("v.CcMail",newString);
                component.set("v.ToEmail",newString);
                component.set("v.Subject",newString);
                component.set('v.myVal', '<br/><br/><p><script></script></p><p>___________________________________________________________________<br/>Powered by Salesforce<br/>http://www.salesforce.com/<br/></p>');

                        console.log('after toast Id>');
                helper.TaskCreatedInit(component,event, helper);
                 }
                    else{
                        helper.showtoast(component, event, helper, 'Error: Email not send','error');
                }         });
            $A.enqueueAction(action1);}
        catch(error){
            console.log('error>>>>>>>'+error);
        }
        
        
    },
    Showdiv : function(component,event,helper){
        console.log('call Showdiv helper');
        component.set("v.isDivOpen", true);
        component.set("v.isButtonShow", false);
        console.log('true activate');
    },

    EmailSearchKet : function(component, event, helper) {
        var searchKey=component.get("v.ToEmail");
        if(searchKey.length>0){
		   console.log("INIT CALLED..");
        try{
            var action3= component.get('c.SearchKeyonContact');
            var searchKey=component.get("v.ToEmail");
                console.log('val ::'+JSON.stringify(searchKey));
            if(searchKey){
                        console.log('else condition');
                        component.set("v.dropdownList",false);
                        }
             action3.setParams({
                 "searchKeyyy":searchKey
            });
            
               action3.setCallback(this,function(response){
                if(response.getState()==="SUCCESS")
                { 
                    var searchKey=component.get("v.ToEmail");
                    console.log('response>>>>>'+JSON.stringify(response));
                    component.set("v.conList", response.getReturnValue());
                    var conList=component.get("v.conList");
                    if(conList.contactList.length>0 || conList.leadd_list.length>0){   
                        console.log('conList++++++++++'+JSON.stringify(conList));
                        component.set("v.dropdownListCc",false);
                        component.set("v.dropdownListBCc",false);
                        console.log('if condition');
                        component.set("v.dropdownList",true);
                    }else{
                       component.set("v.EmailHardCode",searchKey);
                        component.set("v.dropdownList",false);
                    }
                   
                  console.log('val ::');
                    var cons=component.get("v.conList");
                    console.log(JSON.stringify(cons));
                    var each=component.get("v.conList.contactList");
                    console.log(JSON.stringify(each));
                }else{
                    component.set("v.dropdownList",false);
                }
                  
            });
            
            $A.enqueueAction(action3);
            var searchKey=component.get("v.ToEmail");
            if(searchKey){
            component.set('v.message', true);
            }else{
                component.set('v.message', false);
            }
            

            
        }catch(Ex){
            console.log(Ex);
        }
        }else{
            component.set("v.dropdownList",false);
        }
	},
    callKeyUp : function(component, event, helper) {  
        var imp=component.get("v.ToEmail");
        console.log('imp'+imp);
        console.log('controller call');
        if (event.keyCode === 13 ){
            console.log('what!!!!!!!!!');
            console.log('imp????????'+imp)
            component.set("v.EmailHardCode",imp);
            var EmailHardCode=component.get("v.EmailHardCode");
            console.log('imp????????'+EmailHardCode)
            console.log(';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;')
            console.log(EmailHardCode.length);
            var ob={};
             ob.name=EmailHardCode;
            ob.label=EmailHardCode;
            console.log('objectcreate>>>>>>>>>>>>>>>');
            var pillL=component.get("v.itemsmypill");
            var j=0;
            if(pillL.length>0){
            var pillList=component.get("v.itemsmypill");
                console.log('pilllist'+pillList);
                console.log('if part of pills');
                for(var i=0;i<pillList.length;i++){
                    console.log('inside for loop');
                    console.log('pill name'+pillList[i]+'ob name'+ob.name);
                    if(pillList[i].name==ob.name){
                        j=j+1;
                        console.log('j///////'+j);
                    }
            
                }
                if(j==0){
                    pillList.push(ob);
                    console.log('pillList/////'+pillList);
                    component.set("v.itemsmypill",pillList);
            component.set("v.pillsDiv",true);
                }
            }else{
                var pillList=[];
                console.log('else part');
                pillList.push(ob);
                component.set("v.itemsmypill",pillList);
            component.set("v.pillsDiv",true);
            }
        }
              },
    falseallto : function(component, event, helper){
       console.log('in method');
        component.set("v.dropdownList",false);
    },
    callKeyUpcc : function(component, event, helper) {  
        var imp=component.get("v.CcMail");
        console.log(imp.length+'///////////////')
        if(imp.length!=null){
        console.log('controller call');
        if (event.keyCode === 13 ){
            console.log('what!!!!!!!!!');
            console.log('imp????????'+imp)
            component.set("v.EmailHardCodecc",imp);
            var EmailHardCodecc=component.get("v.EmailHardCodecc");
            console.log('imp????????'+EmailHardCodecc)
           
            var ob={};
             ob.name=EmailHardCodecc;
            ob.label=EmailHardCodecc;
            console.log('objectcreate>>>>>>>>>>>>>>>');
            if("v.itemsmypillCc"){
            var pillList=component.get("v.itemsmypillCc");
                console.log('if part of pills');
            pillList.push(ob);
            }else{
                var pillList=[];
                console.log('else part');
                pillList.push(ob);
            }
            
            component.set("v.itemsmypillCc",pillList);
            component.set("v.pillsDivCc",true);
            }
        }
              },
    callKeyUpbcc : function(component, event, helper) {  
        var imp=component.get("v.BccMail");
        if(imp.length>0){
        console.log('controller call');
        if (event.keyCode === 13 ){
            console.log('what!!!!!!!!!');
            console.log('imp????????'+imp)
            component.set("v.EmailHardCodebcc",imp);
            var EmailHardCodebcc=component.get("v.EmailHardCodebcc");
            console.log('imp????????'+EmailHardCodebcc)
            var ob={};
             ob.name=EmailHardCodebcc;
            ob.label=EmailHardCodebcc;
            console.log('objectcreate>>>>>>>>>>>>>>>');
            var pillLbcc=component.get("v.itemsmypillBCc");
            if(pillLbcc.length>0){
            var pillList=component.get("v.itemsmypillBCc");
                console.log('if part of pills');
                for(var i=0;i<pillList.length;i++){
                    if(pillList[i].name==ob.name){
                        j=j+1;
                    }
                }
            pillList.push(ob);
                component.set("v.itemsmypillBCc",pillList);
            }else{
                var pillList=[];
                console.log('else part');
                pillList.push(ob);
                component.set("v.itemsmypillBCc",pillList);
            }
            
            
            component.set("v.pillsDivBCc",true);
            
        }
        }
              },
    callKeyUpcc : function(component, event, helper){
        var imp=component.get("v.CcMail");
        if(imp.length>0){
        console.log('controller call');
        if (event.keyCode === 13 ){
            console.log('whatcc!!!!!!!!!');
            console.log('impcc????????'+imp)
            component.set("v.EmailHardCodecc",imp);
            var EmailHardCodecc=component.get("v.EmailHardCodecc");
            console.log('imp????????'+EmailHardCodecc)
            var j=0;
            var ob={};
             ob.name=EmailHardCodecc;
            ob.label=EmailHardCodecc;
            console.log('objectcreate>>>>>>>>>>>>>>>');
            var pillLcc=component.get("v.itemsmypillCc");
            if(pillLcc.length>0){
            var pillList=component.get("v.itemsmypillCc");
                console.log('if part of pills');
                for(var i=0;i<pillList.length;i++){
                    if(pillList[i].name==ob.name){
                        j=j+1;
                    }
                }
                if(j==0){
            pillList.push(ob);
                component.set("v.itemsmypillCc",pillList);
                }
            }else{
                var pillList=[];
                console.log('else part');
                pillList.push(ob);
                component.set("v.itemsmypillCc",pillList);
            }
            
            
            component.set("v.pillsDivCc",true);
            
        }
        }
        
    },
     doInit : function( component, event, helper ) {
        $A.util.toggleClass(component.find('resultsDiv'), 'slds-is-open');
        $A.util.removeClass(component.find('objectDataDiv'), 'slds-is-open');
        
        var objectList = component.get('v.objectList');
        objectList.push( {label:'Accounts', APIName:'Account', fieldName: 'Name', iconName: 'standard:account'} );
        objectList.push( {label:'Assets', APIName:'Asset', fieldName: 'Name', iconName: 'standard:queue'} );
        objectList.push( {label:'Campaigns', APIName:'Campaign', fieldName: 'Name', iconName: 'standard:campaign'} );
        objectList.push( {label:'Cases', APIName:'Case', fieldName: 'CaseNumber', iconName: 'standard:case'} );
        objectList.push( {label:'Change Requests', APIName:'ChangeRequest', fieldName: 'ChangeRequestNumber', iconName: 'standard:change_request'} );
        objectList.push( {label:'Entitlements', APIName:'Entitlement', fieldName: 'Name', iconName: 'standard:entitlement'} );
        objectList.push( {label:'Opportunities', APIName:'Opportunity', fieldName: 'Name', iconName: 'standard:opportunity'} );
        objectList.push( {label:'Orders', APIName:'Order', fieldName: 'OrderNumber', iconName: 'standard:orders'} );
        objectList.push( {label:'Contracts', APIName:'Contract', fieldName: 'ContractNumber', iconName: 'standard:contract'} );
        objectList.push( {label:'Products', APIName:'Product2', fieldName: 'Name', iconName: 'standard:product'} );
         objectList.push( {label:'Contacts', APIName:'Contact', fieldName: 'LastName', iconName: 'standard:contact'} );
        
        component.set('v.objectList', objectList);
        component.set('v.selectedObject', component.get('v.objectList')[0]);
    },
    onclickMethod : function (component, event, helper){
        //console.log('onclick is working');
        helper.onclickHelper(component, event, helper);
    },
    
    showObjects : function( component, event, helper ) {
        component.set('v.showObjectList', true);
        $A.util.toggleClass(component.find('objectDataDiv'), 'slds-is-open');
    },
    
    selectObject : function( component, event, helper ) {
        component.set("v.showObjectList", false);
        component.set('v.message','');
        if(!$A.util.isEmpty(event.currentTarget.id)) {
            var objectList = component.get('v.objectList');
            var index = objectList.findIndex(x => x.APIName === event.currentTarget.id)
            if(index != -1)
                var selectedObject = objectList[index];
            component.set('v.selectedObject', selectedObject);
            component.set('v.searchString', '');
        }
    },
    
    
    // When a keyword is entered in search box
    searchRecords : function( component, event, helper ) {
        $A.util.removeClass(component.find('objectDataDiv'), 'slds-is-open');
        if( !$A.util.isEmpty(component.get('v.searchString')) ) {
            helper.searchRecordsHelper(component, event, helper);
        } else {
            $A.util.removeClass(component.find('resultsDiv'), 'slds-is-open');
        }
    },
    relatedtoclick : function(component, event, helper){
        console.log('enter in relatedtoclick controller');
        
    },
    
    // When an item is selected
    selectItem : function( component, event, helper ) {
        if(!$A.util.isEmpty(event.currentTarget.id)) {
            var recordsList = component.get('v.recordsList');
            var index = recordsList.findIndex(x => x.value === event.currentTarget.id)
            if(index != -1)
                var selectedRecord = recordsList[index];
            component.set('v.selectedRecord', selectedRecord);
            component.set('v.value', selectedRecord.value);
            var res = component.get('v.value');
            
           
        }
    },
    
    // To remove the selected item.
    removeItem : function( component, event, helper ){
        component.set('v.selectedRecord','');
        component.set('v.value','');
        component.set('v.searchString','');
        setTimeout( function() {
            component.find( 'inputLookup' ).focus();
        }, 250);
    },
    
    // To close the dropdown if clicked outside the dropdown.
    blurRecordList : function( component, event, helper ){
        $A.util.removeClass(component.find('resultsDiv'), 'slds-is-open');
    },
    
    blurObjectList : function( component, event, helper ){
        $A.util.removeClass(component.find('objectDataDiv'), 'slds-is-open');
        component.set('v.showObjectList', false);
    },
    ToSelect : function(component, event, helper ){
        try{
        var selectedItem = event.currentTarget.dataset.name;
       console.log('>>>>>>>>>selected item'+selectedItem);
        component.set('v.ToEmail',selectedItem);
            var ToEmail =component.get("v.ToEmail");
            console.log('TO EMAIL>>>>>>>>>>>>'+ToEmail);
            component.set("v.message",false);
            component.set("v.dropdownList",false);
            
        console.log('>>>>>>>>>>>>setvalue'+ToEmail);
            var ob={};
            ob.name=selectedItem;
            ob.label=selectedItem;
            console.log('ob>>>>>>'+ob);
            console.log('objectcreate>>>>>>>>>>>>>>>');
            var pillList=component.get("v.itemsmypill");
            var j=0;
            if(pillList.length>0){
                console.log('if part of pills');
            for(var i=0;i<pillList.length;i++){
                if(pillList[i].name==ob.name){
                        j=2;
                    }
            }
                if(j==0){
                    console.log('come in j part');
            pillList.push(ob);
                }
                
            }else{
                var pillList=[];
                console.log('else part');
                pillList.push(ob);
            }
            
            console.log('push into list>>>>>>>>>>'+JSON.stringify(pillList));
            component.set('v.itemsmypill',pillList);
            component.set('v.dropdownList',false);
            component.set('v.message',false);
            var iuyt = component.get("v.itemsmypill");
            console.log('itemsmypill>>>>>>>>>>>>>>>'+JSON.stringify(iuyt));
            component.set("v.pillsDiv",true);
            
        }catch(error){
            console.log('error'+error);
        }
    },
    doInitLac : function( component, event, helper ) {
        $A.util.toggleClass(component.find('resultsDiv'), 'slds-is-open');
        $A.util.removeClass(component.find('objectDataDiv'), 'slds-is-open');
        
        
        var objectListLac = component.get('v.objectListLac');
        objectListLac.push( {label:'Accounts', APIName:'Account', fieldName: 'Name', iconName: 'standard:account'} );
        objectListLac.push( {label:'Assets', APIName:'Asset', fieldName: 'Name', iconName: 'standard:queue'} );
        objectListLac.push( {label:'Campaigns', APIName:'Campaign', fieldName: 'Name', iconName: 'standard:campaign'} );
        objectListLac.push( {label:'Cases', APIName:'Case', fieldName: 'CaseNumber', iconName: 'standard:case'} );
        objectListLac.push( {label:'Change Requests', APIName:'ChangeRequest', fieldName: 'ChangeRequestNumber', iconName: 'standard:change_request'} );
        objectListLac.push( {label:'Entitlements', APIName:'Entitlement', fieldName: 'Name', iconName: 'standard:entitlement'} );
        objectListLac.push( {label:'Opportunities', APIName:'Opportunity', fieldName: 'Name', iconName: 'standard:opportunity'} );
        objectListLac.push( {label:'Orders', APIName:'Order', fieldName: 'OrderNumber', iconName: 'standard:orders'} );
        objectListLac.push( {label:'Contracts', APIName:'Contract', fieldName: 'ContractNumber', iconName: 'standard:contract'} );
        objectListLac.push( {label:'Products', APIName:'Product2', fieldName: 'Name', iconName: 'standard:product'} );
        objectListLac.push( {label:'Products', APIName:'Product2', fieldName: 'Name', iconName: 'standard:product'} );
        

        component.set('v.objectListLac', objectListLac);
        component.set('v.selectedObject', component.get('v.objectListLac')[0]);
    },
    onclickMethodLac : function (component, event, helper){
        //console.log('onclick is working');
        helper.onclickHelperLac(component, event, helper);
    },
    
    showObjectsLac : function( component, event, helper ) {
        component.set('v.showObjectList', true);
        $A.util.toggleClass(component.find('objectDataDiv'), 'slds-is-open');
    },
    
    selectObjectLac : function( component, event, helper ) {
        console.log('>........selectobjectLac');
        component.set('v.showObjectList', false);
        if(!$A.util.isEmpty(event.currentTarget.id)) {
            var objectListLac = component.get('v.objectListLac');
            var index = objectListLac.findIndex(x => x.APIName === event.currentTarget.id)
            if(index != -1)
                var selectedObject = objectListLac[index];
            component.set('v.selectedObject', selectedObject);
            component.set('v.searchStringLac', '');
        }
    },
    
    // When a keyword is entered in search box
    searchRecordsLac : function( component, event, helper ) {
        $A.util.removeClass(component.find('objectDataDiv'), 'slds-is-open');
        if( !$A.util.isEmpty(component.get('v.searchStringLac')) ) {
            helper.searchRecordsHelperLac(component, event, helper);
        } else {
            $A.util.removeClass(component.find('resultsDiv'), 'slds-is-open');
        }
    },
    
    // When an item is selected
    selectItemLac : function( component, event, helper ) {
        console.log('selectItemLac>>>>>>>>>>>>')
        if(!$A.util.isEmpty(event.currentTarget.id)) {
            var recordsList = component.get('v.recordsList');
            var index = recordsList.findIndex(x => x.value === event.currentTarget.id)
            if(index != -1)
                var selectedRecord = recordsList[index];
            console.log(selectedRecord+'yes!!!!!!!!!!');
            component.set('v.selectedRecord', selectedRecord);
            component.set('v.value', selectedRecord.value);
            var res = component.get('v.value');
            
            
        }
    },
    
    // To remove the selected item.
    removeItemLac : function( component, event, helper ){
        component.set('v.selectedRecord','');
        component.set('v.value','');
        component.set('v.searchStringLac','');
        setTimeout( function() {
            component.find( 'inputLookup' ).focus();
        }, 250);
    },
    
    // To close the dropdown if clicked outside the dropdown.
    blurRecordListLac : function( component, event, helper ){
        $A.util.removeClass(component.find('resultsDiv'), 'slds-is-open');
    },
    
    blurObjectListLac : function( component, event, helper ){
        $A.util.removeClass(component.find('objectDataDiv'), 'slds-is-open');
        component.set('v.showObjectList', false);
    },
      ChangeAct_ion : function(component, event, helper){
        console.log('Controller: ');
        helper.fetchList(component, event, helper);
    },
    handleComponentEvent : function(component, event, helper) {
        console.log('<<<<<<<handleComponentWhat>>>>');
        var valueFromChild = event.getParam("whatname");
        console.log(valueFromChild+'>>>>>>>>>>>>>>>>component event');
        component.set("v.enteredValue", valueFromChild);
    },
     handleComponentEventWho : function(component, event, helper) {
         try{
         console.log('<<<<<<<handleComponentWho>>>>');
        var valueFromChildWho = event.getParam("whoName");
        component.set("v.enteredValueWho", valueFromChildWho);
    }catch(error){
            console.log('error>>>>>>>'+error);
        }
     },
    handleComponentEventSubjectTask : function(component,event, helper){
        try{
             console.log('<<<<<<<handleComponentEventSubjectTask>>>>');
        var valueFromChildSubTask = event.getParam("SubjectTask");
        component.set("v.SubjectTask123", valueFromChildSubTask);
            
            
        }catch(error){
            console.log('error>>>>>>>>>'+error);
        }
    },
    handleComponentAssignedTo : function(component, event, helper){
        try{
            console.log('<<<<<<<handleComponentAssignedTo>>>>')
            var valueFromChild = event.getParam("AssignedTo");
        component.set("v.AssignedTo", valueFromChild);
         console.log('<<<<<<<handleComponentAssignedTo>>>>'+valueFromChild);

            
            
            
            
        }catch(error){
            console.log('error>>>>>>>>>>>>'+error);
        }
    },
    saveLogCall : function(component, event, helper){
        try{
        var newAction=component.get("c.SaveLogACall");
        //var contactObje = component.get("v.contactdetails");
        var whatId=component.get("v.enteredValue");
        console.log('whatId>>>>>>>>.'+whatId);
            var DueDate=component.get("v.DueDate");
            console.log('DueDate>>>>>>>>.'+DueDate);
        var Comments=component.get("v.Comments");
        console.log('comments>>>>>>>>>>.'+Comments);
        var Subject=component.find('oppId').get('v.value');
        console.log('+++++++++++'+Subject);
        var whoId=component.get("v.enteredValueWho");
        console.log('whoId>>>>>>>>.'+whoId);
       
        newAction.setParams({
                "WhatId":whatId,
            "Subject":Subject,
            "Comments":Comments,
            "WhoId":whoId,
            "DueDate":DueDate
              });
        newAction.setCallback(this,function(response){
                if(response.getState()=="SUCCESS")
                { 
                    var TaskId = response.getReturnValue();
                   console.log('Task Id>'+TaskId);
                    if(TaskId){
                        //Call success Toast
                        console.log('Before toast Id>');
                        helper.showtoast(component, event, helper, 'Sucessfuly record created', 'success');
                         component.set("v.CallIf",true);
                         component.set("v.CallsIf",false);
                     
                        console.log('after toast Id>');
                        console.log('Task Id>'+TaskId);
                 }
                    else{
                        helper.showtoast(component, event, helper, 'Please Correctly fill All Required Field', 'error');
                } 
                }
            });
            $A.enqueueAction(newAction);
        }catch(error){
            console.log('error>>>>>>>'+error);
        }
    },
    initStatus : function(component,event,helper){
        try{
        var actionstatus=component.get("c.fetchStatusPickList");
        console.log('fetchPickList>>>>>>>>>>Status');
                actionstatus.setCallback(this, function(actionResult) {
                    console.log('actionResult>>>>>>>>>>>'+JSON.stringify(actionResult.getReturnValue()));
                    var items = [];
                    items.push({"label":"--None--", "value":"--None--"});
        for (var i = 0; i < 5; i++) {
            var item = {
                
                "label": actionResult.getReturnValue()[i],
                "value": actionResult.getReturnValue()[i]
        };
            items.push(item);
        }
        component.set("v.StatusOptions", items);
         });
            $A.enqueueAction(actionstatus);}
        catch(error){
            console.log('error>>>>>'+error);
        }
    },
    handleChangeStatus : function(component,event, helper){
        try{
        var selectedOptionValue = event.getParam("value");
            component.set("v.StatusTask",selectedOptionValue);
        console.log('selected value of status is >>'+selectedOptionValue);
        }catch(error){
            console.log('error>>>>>>>>'+error);
        }
    },
    saveNewTask : function(component, event, helper){
        try{
            
        var newAction1=component.get("c.SaveNewTask");
        //var contactObje = component.get("v.contactdetails");
        var whatId=component.get("v.enteredValue");
        console.log('whatId>>>>>>>>.'+whatId);
        var whoId=component.get("v.enteredValueWho");
        console.log('whoId>>>>>>>>.'+whoId);
        var Subject=component.find('subId').get('v.value');
        console.log('Subject>>>>>>>>.'+Subject);
            var StatusTask=component.get("v.StatusTask");
        console.log('StatusTask>>>>>>>>.'+StatusTask);
            var ActivityDate=component.get("v.ActivityDate");
        console.log('ActivityDate>>>>>>>>.'+ActivityDate);
            var AssignedTo=component.get("v.AssignedTo");
        console.log('AssignedTo>>>>>>>>.'+AssignedTo);
            
            if(StatusTask!='--None--'){
        newAction1.setParams({
                "WhatId":whatId,
            "Subject":Subject,
            "Status":StatusTask,
            "WhoId":whoId,
            "ActivityDate":ActivityDate,
            "AssignedTo":AssignedTo
              });
            }
        newAction1.setCallback(this,function(response){
                if(response.getState()=="SUCCESS")
                { 
                    var TaskId = response.getReturnValue();
                   console.log('Task Id>'+TaskId);
                    if(TaskId){
                        //Call success Toast
                        component.set("v.TasksIf",true);
                        component.set("v.TaskIf",false);
                        console.log('Before toast Id>');
                        helper.showtoast(component, event, helper, 'Sucessfuly record created', 'success');
                     
                        console.log('after toast Id>');
                        console.log('Task Id>'+TaskId);
                 }
                    else{
                        helper.showtoast(component, event, helper, 'Please Correctly fill All Required Field', 'error');
                } 
                }
            });
            $A.enqueueAction(newAction1);
        }catch(error){
            console.log('error>>>>>>>'+error);
        }
    },
    AddNewTask : function(component, event, helper){
        component.set("v.TasksIf",false);
        component.set("v.TaskIf",true);
    },
    NewEventSaved : function(component, event, helper){
        try{
        console.log('NewEventSaved');
        var actionNewEvent=component.get('c.EventCreate');
        var whatId=component.get("v.enteredValue");
        console.log('whatId>>>>>>>>.'+whatId);
        var whoId=component.get("v.enteredValueWho");
        console.log('whoId>>>>>>>>.'+whoId);
            var Subject=component.get("v.SubjectEvent");
        console.log('Subject>>>>>>>>.'+Subject);
        var Location=component.get("v.Location");
        console.log('Location>>>>>>>>.'+Location);
        var StartDate=component.get("v.StartDate");
        console.log('StartDate>>>>>>>>.'+StartDate);
        var endDate=component.get("v.endDate");
        console.log('endDate>>>>>>>>.'+endDate);
            var AssignedTo=component.get("v.AssignedTo");
        console.log('AssignedTo>>>>>>>>.'+AssignedTo);
            var check=component.get("v.check");
        console.log('check>>>>>>>>.'+check);
        
        actionNewEvent.setParams({
                "WhatId":whatId,
            "Subject":Subject,
            "Location":Location,
            "WhoId":whoId,
            "AssignedTo":AssignedTo,
            "StartDate":StartDate,
            "endDate":endDate,
            "check":check
              });
        actionNewEvent.setCallback(this,function(response){
                if(response.getState()=="SUCCESS")
                { 
                    var eventId = response.getReturnValue();
                   console.log('eventId>'+eventId);
                    if(eventId){
                        console.log('Before toast Id>');
                        helper.showtoast(component, event, helper, 'Sucessfuly record created', 'success');
                        console.log('after toast Id>');
                        component.set("v.EventsIf",false);
                        component.set("v.EventIf",true);
                        
                 }
                    else{
                        helper.showtoast(component, event, helper, 'Please Correctly fill All Required Field', 'error');
                } 
                }
            });
            $A.enqueueAction(actionNewEvent);
        }catch(error){
            console.log('error>>>>>>>'+error);
        }
    },
    initNewEvent : function(component, event, helper){
        try{
            
        }catch(error){
            console.log('Error>>>>'+error);
        }
    },
    removePill : function(component, event, helper ){
        try{
            console.log('remove pill controller');
            const name = event.getParam("item").name;
        console.log(name + ' pill was removed!');
            var itemsmypill = component.get("v.itemsmypill");
            for(var i=0;i<itemsmypill.length;i++){
                if(itemsmypill[i].name=name){
                    itemsmypill.splice(i,1);
                    break;
                }
            }
            component.set("v.itemsmypill",itemsmypill);
        }catch(error){
            console.log('error'+error);
        }
    },
    EmailSearchKetCc : function(component, event, helper) {
		   console.log("INIT CALLED cc..");
        var searchKey=component.get("v.CcMail");
        console.log('searchkey length>'+searchKey.length);
        if(searchKey.length>0){
        try{
            var action34= component.get('c.SearchKeyonContact');
            var searchKey=component.get("v.CcMail");
                console.log('cc val ::'+JSON.stringify(searchKey));
            if(searchKey){
                        console.log('else condition');
                        component.set("v.dropdownListCc",false);
                        }
             action34.setParams({
                 "searchKeyyy":searchKey
            });
            
               action34.setCallback(this,function(response){
                if(response.getState()==="SUCCESS")
                { 
                    var searchKey=component.get("v.CcMail");
                    console.log('response>>>>>'+JSON.stringify(response));
                    component.set("v.conList", response.getReturnValue());
                    var conList=component.get("v.conList");
                    if(conList.contactList.length>0 || conList.leadd_list.length>0){   
                        component.set("v.dropdownListBCc",false);
                        component.set("v.message",false);
                        console.log('if condition');
                        component.set("v.dropdownListCc",true);
                    }else{
                        component.set("v.dropdownListCc",false);
                    }
                   
                  console.log('val ::');
                    var cons=component.get("v.conList");
                    console.log(JSON.stringify(cons));
                    var each=component.get("v.conList.contactList");
                    console.log(JSON.stringify(each));
                    }
                
            });
            $A.enqueueAction(action34);
            var searchKey=component.get("v.CcMail");
            if(searchKey){
            component.set('v.messageCC', true);
            }else{
                component.set('v.messageCC', false);
            }
        }catch(Ex){
            console.log(Ex);
        }
        }
        else{
            component.set("v.dropdownListCc",false);
        }
	},
    ToSelectCc : function(component, event, helper ){
        try{
        var selectedItem = event.currentTarget.dataset.name;
       console.log('>>>>>>>>>selected item'+selectedItem);
        component.set('v.CcMail',selectedItem);
            var CcMail =component.get("v.CcMail");
            console.log('TO CcMail>>>>>>>>>>>>'+CcMail);
            component.set("v.messageCC",false);
            component.set("v.dropdownListCc",false);
            
        console.log('>>>>>>>>>>>>setvalue'+CcMail);
            var j=0;
            var ob={};
            ob.name=selectedItem;
            ob.label=selectedItem;
            console.log('objectcreate>>>>>>>>>>>>>>>');
            var pillLcc=component.get("v.itemsmypillCc");
            if(pillLcc.length>0){
            var pillList=component.get("v.itemsmypillCc");
                console.log('if part of pills');
            for(var i=0;i<pillList.length;i++){
                if(pillList[i].name==ob.name){
                        j=2;
                    }
            }
                if(j==0){
                    console.log('come in j part');
            pillList.push(ob);
                    component.set('v.itemsmypillCc',pillList);
                }

            }else{
                var pillList=[];
                console.log('else part');
                pillList.push(ob);
                component.set('v.itemsmypillCc',pillList);
            }
            
            console.log('push into list>>>>>>>>>>'+JSON.stringify(pillList));
            
            var iuyt = component.get("v.itemsmypillCc");
            console.log('itemsmypillCc>>>>>>>>>>>>>>>'+JSON.stringify(iuyt));
            component.set("v.pillsDivCc",true);
            
        }catch(error){
            console.log('error'+error);
        }
    },
    removePillCc : function(component, event, helper ){
        try{
            console.log('remove pill controller');
            const name = event.getParam("item").name;
        console.log(name + ' pill was removed!');
            var itemsmypillCc = component.get("v.itemsmypillCc");
            for(var i=0;i<itemsmypillCc.length;i++){
                if(itemsmypillCc[i].name=name){
                    itemsmypillCc.splice(i,1);
                    break;
                }
            }
            component.set("v.itemsmypillCc",itemsmypillCc);
        }catch(error){
            console.log('error'+error);
        }
    },
    
    EmailSearchKetBCc : function(component, event, helper) {
		   console.log("INIT CALLED cc..");
        try{
            var action342= component.get('c.SearchKeyonContact');
            var searchKey=component.get("v.BccMail");
                console.log('BccMail val ::'+JSON.stringify(searchKey));
            if(searchKey.length>0){
                        console.log('else condition');
                        component.set("v.dropdownListBCc",false);
                        }
             action342.setParams({
                 "searchKeyyy":searchKey
            });
            
               action342.setCallback(this,function(response){
                if(response.getState()==="SUCCESS")
                { 
                    var searchKey=component.get("v.BccMail");
                    console.log('response>>>>>'+JSON.stringify(response.getReturnValue()));
                    component.set("v.conList", response.getReturnValue());
                    var conList=component.get("v.conList");
                    if(conList.contactList.length>0 || conList.leadd_list.length>0){   
                        component.set("v.message",false);
                        component.set("v.dropdownListCc",false);
                        console.log('if condition');
                        component.set("v.dropdownListBCc",true);
                    }
                   
                  console.log('val ::');
                    var cons=component.get("v.conList");
                    console.log(JSON.stringify(cons));
                    var each=component.get("v.conList.contactList");
                    console.log('yes it runs!!!!!');
                    console.log(JSON.stringify(each));
                    }
                
            });
            $A.enqueueAction(action342);
            var searchKey=component.get("v.BccMail");
            if(searchKey){
            component.set('v.messageBCC', true);
            }else{
                component.set('v.messageBCC', false);
            }
        }catch(Ex){
            console.log(Ex);
        }
	},
    ToSelectBCc : function(component, event, helper ){
        try{
        var selectedItem = event.currentTarget.dataset.name;
       console.log('>>>>>>>>>selected item'+selectedItem);
        component.set('v.BccMail',selectedItem);
            var BccMail =component.get("v.BccMail");
            console.log('TO BccMail>>>>>>>>>>>>'+BccMail);
            component.set("v.messageBCC",false);
            component.set("v.dropdownListBCc",false);
            
        console.log('>>>>>>>>>>>>setvalue'+BccMail);
            var ob={};
            var j=0;
            ob.name=selectedItem;
            ob.label=selectedItem;
            console.log('objectcreate>>>>>>>>>>>>>>>');
            var pillLbcc=component.get("v.itemsmypillBCc");
            if(pillLbcc.length>0){
            var pillList=component.get("v.itemsmypillBCc");
                console.log('if part of pills');
            for(var i=0;i<pillList.length;i++){
                if(pillList[i].name==ob.name){
                        j=2;
                    }
            }
                if(j==0){
                    console.log('come in j part');
            pillList.push(ob);
                    component.set('v.itemsmypillBCc',pillList);
                }
                
            }else{
                var pillList=[];
                console.log('else part');
                pillList.push(ob);
                component.set('v.itemsmypillBCc',pillList);
            }
            
            console.log('push into list>>>>>>>>>>'+JSON.stringify(pillList));
            
            var iuyt = component.get("v.itemsmypillBCc");
            console.log('itemsmypillBCc>>>>>>>>>>>>>>>'+JSON.stringify(iuyt));
            component.set("v.pillsDivBCc",true);
            
        }catch(error){
            console.log('error'+error);
        }
    },
    removePillBCc : function(component, event, helper ){
        try{
            console.log('remove pill controller');
            const name = event.getParam("item").name;
        console.log(name + ' pill was removed!');
            var itemsmypillBCc = component.get("v.itemsmypillBCc");
            for(var i=0;i<itemsmypillBCc.length;i++){
                if(itemsmypillBCc[i].name=name){
                    itemsmypillBCc.splice(i,1);
                    break;
                }
            }
            component.set("v.itemsmypillBCc",itemsmypillBCc);
        }catch(error){
            console.log('error'+error);
        }
    },
    AddNewCall : function(component, event, helper){
        component.set("v.CallIf",false);
        component.set("v.CallsIf",true);
    },
    AddNewEvent : function(component, event, helper){
        component.set("v.EventIf",false);
        component.set("v.EventsIf",true);
    },
    AddNewEmail : function(component, event, helper){
        component.set("v.EmailIf",false);
        component.set("v.EmailsIf",true);
    },
    onblurpills : function(component, event, helper){
        var imp=component.get("v.ToEmail");
        if(imp.length>0){
        console.log('controller call');
            console.log('whatcc!!!!!!!!!');
            console.log('impcc????????'+imp)
            component.set("v.EmailHardCodecc",imp);
            var EmailHardCodecc=component.get("v.EmailHardCodecc");
            console.log('imp????????'+EmailHardCodecc)
            var j=0;
            var ob={};
             ob.name=EmailHardCodecc;
            ob.label=EmailHardCodecc;
            console.log('objectcreate>>>>>>>>>>>>>>>');
            var pillLcc=component.get("v.itemsmypill");
            if(pillLcc.length>0){
            var pillList=component.get("v.itemsmypill");
                console.log('if part of pills');
                for(var i=0;i<pillList.length;i++){
                    if(pillList[i].name==ob.name){
                        j=j+1;
                    }
                }
                if(j==0){
            pillList.push(ob);
                component.set("v.itemsmypill",pillList);
                }
            }else{
                var pillList=[];
                console.log('else part');
                pillList.push(ob);
                component.set("v.itemsmypill",pillList);
            }
            
            
            component.set("v.pillsDiv",true);
            
        }
    },
    PreviewData : function(component,event,helper){
        component.set("v.isModalOpen",true);
        var strq=component.get("v.myVal")
        var strippedString = strq.replace(/(<([^>]+)>)/gi, "");
        component.set("v.ShowBody",strippedString);
    },
    closeModel : function(component,event,helper){
        component.set("v.isModalOpen",false);
    },
    ClearData : function(component,event,helper){
        component.set("v.isModalOpen2",true);
    },
    closeModel2 : function(component,event,helper){
        component.set("v.isModalOpen2",false);
    },
    closeModel21 : function(component,event,helper){
        try{
        var itemsmypill=[];
        var itemsmypillBCc=[];
        var itemsmypillCc=[];
        var Subject="";
        var Content="";
        component.set("v.itemsmypill",itemsmypill);
        component.set("v.itemsmypillBCc",itemsmypillBCc);
        component.set("v.itemsmypillCc",itemsmypillCc);
        console.log('Clearing'+itemsmypillCc)
        component.set("v.Subject",Subject);
        component.set("v.myVal",Content);
        console.log('all cleared');
        component.set("v.isModalOpen2",false);
        }catch(error){
            console.log('error>>>>>>>>>>>'+error);
        }
    },
    closeModel : function(component, event, helper){
        component.set("v.isModalOpen",false);
    },
    PopupData : function(component, event, helper){
        component.set("v.isModalOpen3",true);
        console.log('upadting modal');
    },
    closeModel3 : function(component, event, helper){
        component.set("v.isModalOpen3",false);
    },
    AttachData : function(component,event,helper){
        console.log('inside attachData');
        var ism1=component.get("v.isModalOpen4");
        console.log(ism1);
        component.set("v.isModalOpen4",true);
         var ism2=component.get("v.isModalOpen4");
        console.log(ism2);
        console.log('inside attachData');
   
    },
    closeModel4 : function(component, event, helper){
        console.log('inside closemodel4');
        component.set("v.isModalOpen4",false);
    },
   
    handleUploadFinished: function (cmp, event) {
        var uploadedFiles = event.getParam("files");
        console.log('Files uploaded : ' + uploadedFiles.length);
        uploadedFiles.forEach(file => console.log(file.name));
    },
    Sharedwithme : function(component, event, helper){
        component.set("v.content1",true);
        component.set("v.content2",false);
    },
    OwnedbyMe : function(component, event, helper){
        var traction=component.get('c.fetchAttachment')
        component.set("v.content1",false);
        console.log('check');
        component.set("v.content2",true);
        console.log('check2');
        traction.setCallback(this,function(response){
                if(response.getState()==="SUCCESS")
                { 
                    component.set("v.AttList", response.getReturnValue());
                    var attl=component.get("v.AttList");
                    console.log('List of Attachment: '+JSON.stringify(attl));
                }
            });
        $A.enqueueAction(traction);
        
    },
    Recent : function(component, event, helper){
        component.set("v.content1",true);
        component.set("v.content2",false);
    },
    Following : function(component, event, helper){
        component.set("v.content1",true);
        component.set("v.content2",false);
    },
     Libraries : function(component, event, helper){
        component.set("v.content1",true);
        component.set("v.content2",false);
    },
     RelatedFiles : function(component, event, helper){
        component.set("v.content1",true);
        component.set("v.content2",false);
    },
    add_att : function(component, event, helper){
        console.log('come in');
       //var selectedAttachment =event.currentTarget.getAttribute("data-recId");        
        //console.log('selectedAttachmentId>>>>>'+selectedAttachment);
        helper.selectedAttachement(component, event, helper);
    },
        applyCss: function(component, event, helper) {
            try{
        var cmpTarget = component.find('changeIt');
        $A.util.addClass(cmpTarget, 'changeMe');
            }catch(error){
                console.log('error>>>>>'+error);
            }
    },
    InsertData : function(component, event, helper){
        component.set("v.isModalOpen5",true);
    },
    closeModel5 : function(component, event, helper){
        component.set("v.isModalOpen5",false);
    },
    onAddAttachment : function(component, event, helper){
        try{
        console.log('onAddAttachment inside');
        var rest=component.get("v.attList2");
            var attList2=component.get("v.attList2");
            var Ids=[];
            for(var i=0;i<attList2.length;i++){
                Ids.push(attList2[i].Id);
            }
            component.set("v.ListofIds",Ids);
            console.log('Ids>>>>>>>'+Ids);
            console.log('rest value: +'+JSON.stringify(rest));
            
            var next=[];
            for(var i=0;i<rest.length;i++){
                var ob={};
                ob.name=rest[i].Id;
                ob.label=rest[i].Title;
                next.push(ob);
            }
        component.set("v.itemsmypillattachment",next);
        console.log('itemsmypillattachment'+next);
        component.set("v.pillsDivattachment",true);
            component.set("v.isModalOpen4",false);
        }catch(error){
            console.log('error>>>>>>'+error);
        }
    },
    ChangeTemplate : function(component, event, helper){
        component.set("v.isModalOpen6",true);
    },
    selectMenu : function(component, event, helper){
        console.log('inside select menu');
    var selectedMenuItemValue = event.getParam("value");
        console.log('selectedMenuItemValue'+selectedMenuItemValue);
        if(selectedMenuItemValue=='MenuItemOne'){
            component.set("v.isModalOpen10",true);
        }if(selectedMenuItemValue=='MenuItemTwo'){
            component.set("v.isModalOpen11",true);
        }
},
    closeModel10 : function(component, event, helper){
    component.set("v.isModalOpen10",false);
},
    fetchEmailTemplate : function(component, event, helper) {
        component.set('v.mycolumns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Description', fieldName: 'Description', type: 'text'},
            {label: 'FolderName', fieldName: 'FolderName', type: 'text'}
        ]);
        var action10 = component.get("c.fetchEmailTempList");
        action10.setParams({
        });
        action10.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.EtempList", response.getReturnValue());
            }
            var datadetail=component.get("v.EtempList");
            console.log('datadetail>>>>>>>>'+JSON.stringify(datadetail));
        });
        $A.enqueueAction(action10);
    },
    closeModel11 : function(component, event, helper){
    component.set("v.isModalOpen11",false);
},
    initfetchFieldLabel: function(component,event,helper){
        console.log('////////////////////////////////////////////////////////////');
        var action21 = component.get("c.fetchFieldLabel");
        action21.setParams({
        });
        action21.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.FieldLabelList", response.getReturnValue());
            }
            var FieldLabelList=component.get("v.FieldLabelList");
            console.log('FieldLabelList>>>>>>>>'+JSON.stringify(FieldLabelList));
        });
        $A.enqueueAction(action21);
    },
    callsetting : function(component, event, helper){
        component.set("v.isModalOpen20",true);
    },
    closeModel20 : function(component, event, helper){
         component.set("v.isModalOpen20",false);
    },
    removeitemsPillattachment : function(component, event, helper){
        var List1=[];
        component.set("v.itemsmypillattachment",List1);
    }
});