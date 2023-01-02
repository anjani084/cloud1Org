({
    insertOpportunity : function(c, e, h) {
        try{
            console.log('In Helper....');
            var OpportunityObje = c.get("v.OppDetails");
            console.log('....StageName...'+JSON.stringify(OpportunityObje));
            var action=c.get('c.ShowStageName');
            action.setParams({
                "Opp":OpportunityObje
            });
            action.setCallback(this,function(response){
                if(response.getState()=="SUCCESS")
                { var OppId = response.getReturnValue();
                 if(!$A.util.isUndefinedOrNull(OppId) && !$A.util.isEmpty(OppId)){
                        //Call success Toast
                        console.log('Before toast Id>');
                        h.showtoast(c, e, h, 'Sucessfuly record created', 'success');
                         window.location.reload();
                     
                        console.log('after toast Id>');
                        console.log('Opportunity Id>'+OppId);
                 }
                    else{
                        h.showtoast(c, e, h, 'Please Correctly fill All Required Field', 'error');
                } 
                }
            });
            $A.enqueueAction(action);
        }catch(error){
            console.log('Error>>'+error);
        }
        
    },
    fetchList : function(c, e, h) {
        console.log('In helper fetchList');
        var action1 = c.get('c.fetchPickList');
        action1.setCallback(this, function(actionResult) {
           
             c.set('v.StageName',actionResult.getReturnValue());
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
        
         
    }
    
})