({
    InsertClickHelper : function(component, event, helper) {
        try{
            console.log('In try method'); 
            var contactObje = component.get("v.contactdetails");
          //  component.set("v.contactdetails.AccountId",component.get("v.selectedAccount"));
            var AccountI= component.find('acc').get('v.value');
            contactObje.AccountId=AccountI;
            console.log('Contact Object >'+JSON.stringify(contactObje)); 
            var action = component.get("c.CreatecontactMethod");
            action.setParams({
                "ApexParams":contactObje
            });
            
            action.setCallback(this,function(response){
                if(response.getState()==="SUCCESS")
                { 
                    var ContactId = response.getReturnValue();
                    console.log('Contact Id>'+ContactId);
                    
                    
                }
                
            });
            
            $A.enqueueAction(action);
            helper.showToast(component, event, helper); 
            
            window.location.reload()
        }
        catch(error){
            console.log('Error>>'+error);
        }
    },
    
    showAccount : function(component, event, helper) {
        var action = component.get('c.fetchAccountInfo');
        // Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {
            component.set('v.accOption', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    showError : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : 'Error',
            message:'Required field missing!',
            duration:' 5000',
            key: 'info_alt',
            type: 'error',
            mode: 'pester'
        });
        toastEvent.fire();
    },
    showToast : function(component, event, helper) {
        component.find('notifyId').showToast({
            "variant": "Success",
            "title": "Success!",
            "message": "Contact Inserted successfully."
        });
    }  
})