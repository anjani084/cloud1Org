({
	InsertClickHelper : function(component, event, helper) {
        try{
          console.log('In try method'); 
            var contactObje = component.get("v.contactdetails");
            console.log('Contact Object >'+JSON.stringify(contactObje)); 
            var action = component.get("c.CreatecontactMethod");
          action.setParams({
                "ApexParams":contactObje
              });
            
            action.setCallback(this,function(response){
                if(response.getState()=="SUCCESS")
                { 
                   console.log('Before toast Id>');
                    h.showtoast(c, e, h, 'Sucessfuly record', 'success');
                     window.location.reload();
                    console.log('after toast Id>');
                    var OppId = response.getReturnValue();
                   console.log('Opportunity Id>'+OppId);
                    
                }else{
                      h.showtoast(c, e, h, 'Fill all required field', 'error');
                }
            });
            
            $A.enqueueAction(action);
            
        }
        catch(error){
            console.log('Error>>'+error);
        }
	},
    showtoast : function(c, e, h, message,type) {
        var toastEvent = $A.get("e.force:showToast");
          console.log('toast event >'+toastEvent);
        toastEvent.setParams({
            message: message,
            duration:' 5000',
            type: type
          });
        toastEvent.fire();
    }
})