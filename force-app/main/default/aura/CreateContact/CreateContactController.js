({
	InsertClick : function(component, event, helper) {
        try{
            console.log('calling helper');
              var contactObje = component.get("v.contactdetails");
            if(contactObje.LastName != null){
                helper.InsertClickHelper(component, event, helper);
            }
            else if(contactObje.LastName == null){
                var tst = $A.get("e.force:showToast");
            tst.setParams({
                "type":"error",
                "message":"Please fill the LastName required field."
              
            });
                tst.fire();
            }
          
           console.log('calling helper ending'); 
        }
        catch(error){
            console.log('Error>>'+error);
        }
	}
})