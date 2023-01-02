({
	InsertClick : function(component, event, helper) {
        try{
            console.log('calling helper');
              var AccountObje = component.get("v.AccountDetails");
             var element = component.find('nameId');
            console.log('test'+element);
           
                console.log('check');
            if(AccountObje.Name == null)
            {
             $A.util.addClass(element,"slds-has-error");
            }
            
             if(AccountObje.Name==null)
            {
                helper.showError(component, event, helper);
            }
             if(AccountObje.Name!=null){
                helper.InsertClickHelper(component, event, helper);
            }
           console.log('calling helper ending'); 
        }
        catch(error){
            console.log('Error>>'+error);
        }
	},
    CancelAction: function(component, event, helper)
    {
         component.set("v.AccountDetails.Name",'');
        component.set("v.AccountDetails.Phone",'');
        component.set("v.AccountDetails.Industry",'');
        component.set("v.AccountDetails.Website",'');
    }
    
})