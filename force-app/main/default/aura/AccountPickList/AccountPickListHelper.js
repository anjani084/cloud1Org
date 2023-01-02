({
    showAccount : function(component, event, helper) {
        var action = component.get('c.PickListMethod');
        // Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {
            component.set('v.accOption', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
    showContact : function(component, event, helper) {
		console.log('Show contact ');

        var ConAccID = component.get("v.selectedAccount");
        console.log('Show contact '+ConAccID);
        var oppAccId=component.get("v.selectedAccount");
        //alert(ConAccID);
        console.log('Show opp '+oppAccId);
        var action1 = component.get("c.fetchContact");
         console.log('Action1');

        var action2 = component.get("c.fetchOpportunity");
          console.log('Action2');
        action1.setParams({
            "accId": ConAccID
        });
        action2.setParams({
            "accId":oppAccId
        })
        action1.setCallback(this, function(actionResult) {
            component.set("v.conOption", actionResult.getReturnValue());
        });
        action2.setCallback(this,function(actionResult){
            component.set("v.oppOption", actionResult.getReturnValue());

        })
        
        $A.enqueueAction(action1);
        $A.enqueueAction(action2);
    }
  })