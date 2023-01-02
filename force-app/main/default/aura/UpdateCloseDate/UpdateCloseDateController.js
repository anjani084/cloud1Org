({
    doinit : function(component, event, helper){
        try{
            
             var contactObje = component.get("v.CloseDate");
         
        }catch(Ex){
            console.log(Ex);
        }
    }, 
     insertClick : function(component, event, helper){
        try{
            
             var contactObje = component.get("v.CloseDate");
               if(contactObje==null)
            {
                helper.showError(component, event, helper);
            }
            
            if(contactObje!= null){
                helper.helperMethod(component, event, helper);
            }
        }catch(Ex){
            console.log(Ex);
        }
    },
    
    openModel: function(component, event, helper) {
        // Set isModalOpen attribute to true
        component.set("v.isModalOpen", true);
    },
    
    closeModel: function(component, event, helper) {
        // Set isModalOpen attribute to false  
        component.set("v.isModalOpen", false);
        component.set("v.CloseDate",'');
    }
    
})