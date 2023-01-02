({
    myAction : function(component, event, helper) {
        helper.showAccount(component, event, helper);
        
    },
    changeAction : function(component, event, helper){
        var AccountName = component.find('accId').get('v.value');
        console.log('AccountName '+AccountName);
        helper.showContact(component, event, helper);
       // helper.showOpportunity(component, event, helper)
    }
    /* NewAction : function(Component, event, helper){
        try{
                    helper.showOpportunity(component, event, helper)

        }
        catch(error){
            console.log('error');
        }    }
   newAction : function(Component, event, helper){
console.log('new action >>>>>');    }*/
})