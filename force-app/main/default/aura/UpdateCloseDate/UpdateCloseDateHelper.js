({
	helperMethod : function(component, event, helper) {
		   console.log("INIT CALLED..");
        try{
            var oppId = component.get("v.recordId");
            console.log(oppId);
             console.log('In try method');
            var contactObje = component.get("v.CloseDate");
            console.log('Contact Object >'+JSON.stringify(contactObje)); 
            var action = component.get("c.CreatecontactMethod");  
            action.setParams({
                "ApexParams":contactObje,
                "accountId": oppId
            });
            
               action.setCallback(this,function(response){
                if(response.getState()==="SUCCESS")
                { 
                    var OppId = response.getReturnValue();
                    console.log('Contact Id>'+OppId);
                    if(contactObje!=null){
                        helper.showToast(component, event, helper);
                    }
                    window.location.reload()
                    
                    
                    
                }
                
            });
            
            $A.enqueueAction(action);
            
        }catch(Ex){
            console.log(Ex);
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
            "message": "Opportunity Inserted successfully."
        });
	}  
})