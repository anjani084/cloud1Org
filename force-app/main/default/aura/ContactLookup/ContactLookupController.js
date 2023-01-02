({
	InsertClick : function(component, event, helper) {
        try{
            console.log('calling helper');
              var contactObje = component.get("v.contactdetails");
             var element = component.find('nameId');
            console.log('test'+element);
           
                console.log('check');
            if(contactObje.Name == null)
            {
             $A.util.addClass(element,"slds-has-error");
            }
            
             if(contactObje.LastName==null)
            {
                helper.showError(component, event, helper);
            }
            
            if(contactObje.LastName!=null){
                helper.InsertClickHelper(component, event, helper);
            }
          
           console.log('calling helper ending'); 
        }
        catch(error){
            console.log('Error>>'+error);
        }
	},
     myAction : function(component, event, helper) {
        helper.showAccount(component, event, helper);
    },
    CancelAction : function(component, event, helper) {
        component.set("v.contactdetails.LastName",'');
        component.set("v.contactdetails.Phone",'');
        component.set("v.contactdetails.Email",'');
        component.set("v.accOption",'None');
    }
})