({
	InsertClickHelper : function(component, event, helper) {
        try{
          console.log('In try method'); 
            var AccountObj = component.get("v.AccountDetails");
            console.log('Contact Object >'+JSON.stringify(AccountObj)); 
            var action = component.get("c.AccountCreateMethod");
          action.setParams({
                "ApexParams":AccountObj
              });
            
            action.setCallback(this,function(response){
                if(response.getState()==="SUCCESS")
                { 
                    var AccountId = response.getReturnValue();
                   console.log('Account Id>'+AccountId);
                   
                    
                    
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
            "message": "Account Inserted successfully."
        });
	}  
})