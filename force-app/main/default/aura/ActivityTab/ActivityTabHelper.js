({
    searchRecordsHelper : function(component, event, helper) {
        $A.util.removeClass(component.find("Spinner"), "slds-hide");
        component.set('v.message', '');
        component.set('v.recordsList', null);
        var selectedObject = component.get('v.selectedObject');
        
        // Calling Apex Method
        var action = component.get('c.fetchRecords');
        action.setParams({
            'objectName' : selectedObject.APIName,
            'filterField' : selectedObject.fieldName,
            'searchString' : component.get('v.searchString')
        });
        action.setCallback(this,function(response){    
            var result = response.getReturnValue();
            if(response.getState() === 'SUCCESS') {
                // To check if any records are found for searched keyword
                if(result.length > 0) {
                    component.set('v.recordsList', result);        
                } else {
                    component.set('v.message', 'No Records Found');
                }
            } else if(response.getState() === 'INCOMPLETE') {
                component.set('v.message','No Server Response or client is offline');
            } else if(response.getState() === 'ERROR') {
                // If server throws any error
                var errors = response.getError();
                if (errors && errors[0] && errors[0].message) {
                    component.set('v.message', errors[0].message);
                }
            }
            // To open the drop down list of records
            $A.util.addClass(component.find('resultsDiv'), 'slds-is-open');
            $A.util.addClass(component.find("Spinner"), "slds-hide");
        });
        $A.enqueueAction(action);
    },
    onclickHelper : function (component, event, helper){
        var selectedObject = component.get('v.selectedObject');  
        //console.log(JSON.stringify(selectedObject.APIName));
        var action = component.get('c.SobjectList');
        action.setParams({
            'objectName' : selectedObject.APIName,
            'filterField' : selectedObject.fieldName,
        });
        //console.log('Apex is calling');
        action.setCallback(this, function(response){
            //console.log(JSON.stringify(response.getReturnValue()));
            var result = response.getReturnValue();          
            if(response.getState() ==='SUCCESS'){
                //var storelabel = response.getReturnValue();
                if(result.length > 0) {
                    //console.log('calling');
                    //console.log(JSON.stringify(result));
                    component.set('v.recordsList', result);
                }else {
                    component.set('v.message', 'No Records Found');
                    //console.log('stick');
                    
                }
                $A.util.addClass(component.find('resultsDiv'), 'slds-is-open');
                $A.util.addClass(component.find("Spinner"), "slds-hide");
            }
        });
        $A.enqueueAction(action);
        helper.newonehelper(component, event, helper);
    },
    searchRecordsHelperLac : function(component, event, helper) {
        $A.util.removeClass(component.find("Spinner"), "slds-hide");
        component.set('v.messageLac', false);
        component.set('v.recordsList', null);
        var selectedObject = component.get('v.selectedObject');
        
        // Calling Apex Method
        var action = component.get('c.fetchRecords');
        action.setParams({
            'objectName' : selectedObject.APIName,
            'filterField' : selectedObject.fieldName,
            'searchStringLac' : component.get('v.searchStringLac')
        });
        action.setCallback(this,function(response){    
            var result = response.getReturnValue();
            if(response.getState() === 'SUCCESS') {
                // To check if any records are found for searched keyword
                if(result.length > 0) {
                    component.set('v.recordsList', result);        
                } else {
                    component.set('v.messageLac', false);
                }
            } else if(response.getState() === 'INCOMPLETE') {
                component.set('v.messageLac',true);
            } else if(response.getState() === 'ERROR') {
                // If server throws any error
                var errors = response.getError();
                if (errors && errors[0] && errors[0].message) {
                    component.set('v.messageLac', false);
                }
            }
            // To open the drop down list of records
            $A.util.addClass(component.find('resultsDiv'), 'slds-is-open');
            $A.util.addClass(component.find("Spinner"), "slds-hide");
        });
        $A.enqueueAction(action);
    },
    onclickHelperLac : function (component, event, helper){
        var selectedObject = component.get('v.selectedObject');  
        //console.log(JSON.stringify(selectedObject.APIName));
        var action = component.get('c.SobjectListLac');
        action.setParams({
            'objectName' : selectedObject.APIName,
            'filterField' : selectedObject.fieldName,
        });
        //console.log('Apex is calling');
        action.setCallback(this, function(response){
            //console.log(JSON.stringify(response.getReturnValue()));
            var result = response.getReturnValue();          
            if(response.getState() ==='SUCCESS'){
                //var storelabel = response.getReturnValue();
                if(result.length > 0) {
                    //console.log('calling');
                    //console.log(JSON.stringify(result));
                    component.set('v.recordsList', result);
                }
                $A.util.addClass(component.find('resultsDiv'), 'slds-is-open');
                $A.util.addClass(component.find("Spinner"), "slds-hide");
            }
            $A.util.addClass(component.find('resultsDiv'), 'slds-is-open');
            $A.util.addClass(component.find("Spinner"), "slds-hide");
        });
        $A.enqueueAction(action);
    },
     fetchList : function(c, e, h) {
        console.log('In helper fetchList');
        var action1 = c.get('c.fetchPickList');
        action1.setCallback(this, function(actionResult) {
            /* var options=[];
             for(let i=0;i<actionResult.getReturnValue().length;i++){
                 options.push({label:actionResult.getReturnValue()[i],value:actionResult.getReturnValue()[i]});
             }*/
            c.set('v.subjectTask',actionResult.getReturnValue());
        });
        $A.enqueueAction(action1);
    },
    showtoast : function(c, e, h, message,type) {
        var toastEvent = $A.get("e.force:showToast");
        console.log('toast event >'+toastEvent);
        toastEvent.setParams({
            message: message,
            duration:'3000',
            type: type
            
        });
        toastEvent.fire();
    },
    newonehelper : function(component, event, helper){
                $A.util.addClass(component.find('resultsDiv'), 'slds-hide');
                $A.util.addClass(component.find("Spinner"), "slds-hide");
    },
    TaskCreatedInit : function(component, event, helper){
        var recordId=component.get("v.recordId");
         var action1a= component.get('c.TaskCreationOp');
        var Subject=component.get("v.Subject");
        var whatId=component.get("v.enteredValue");
        var Tomail=component.get("v.ToEmail");
        var bccmail=component.get("v.BccMail");
        var ccmail=component.get("CcMail")
        action1a.setParams({
                 "recordId":recordId,
            "whatId":whatId,
            "Subject":Subject,
            "bccmail":bccmail,
            "ccmail":ccmail,
            "Tomail":Tomail
            });
         action1a.setCallback(this,function(response){
                if(response.getState()==="SUCCESS")
                { var TaskId=component.get(response.getReturnValue());
                 console.log('new task created: '+TaskId);
                }
                });
             
             
         $A.enqueueAction(action1a);
    },
    selectedAttachement : function(component, event, helper){
        try{
        var selectedAttachment =   event.currentTarget.getAttribute("data-recId");        
        console.log('selectedAttachmentId>>>>>'+selectedAttachment);
        var actionq = component.get("c.getSelectedFile");
        actionq.setParams({
        	contentDocumentIdofFile : selectedAttachment
        });
        actionq.setCallback(this, function(response) {
            var result = response.getReturnValue();
            var res=component.get("v.attList2")
            //console.log('result1>>>'+res);
            
            component.set("v.getselectedfile",result);  
            var var1=component.get("v.getselectedfile")
            //console.log("getselectedfile>>>"+JSON.stringify(var1));
            //console.log('result res>>>>'+JSON.stringify(res));
            
            res.push(result);
            //console.log('result res2>>>>'+JSON.stringify(res));
            component.set("v.attList2",res); 
            var res2=component.get("v.attList2");
            console.log('attList'+JSON.stringify(res2));
        });
        $A.enqueueAction(actionq);
        }
        catch(error){
            console.log('error>>>>>>>>>>'+error);
        }
    },
    
})