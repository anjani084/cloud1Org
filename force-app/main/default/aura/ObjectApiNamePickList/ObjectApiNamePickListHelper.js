({
	ShowObject : function(c, e, h) {
        var action = c.get('c.ObjectName');
        //var self = this;
        action.setCallback(this,function(result){
            var resultValue = result.getReturnValue();
            console.log('resultValue >'+JSON.stringify(resultValue));
            c.set("v.ObjName",resultValue);
          var listSonject =  c.get("v.ObjName",resultValue);
            console.log('listSonject >'+listSonject);
        });
        $A.enqueueAction(action);
    },
    showFields : function(component, event, helper) {
        var ObjName=component.get("v.SelectObj")
        var action=component.get("c.FieldNames");
        action.setParams({
            "str": ObjName
        });
        action.setCallback(this, function(actionResult) {
            component.set("v.fieldname", actionResult.getReturnValue());
    })
        $A.enqueueAction(action);
    },
    ShowDataType : function(c, e, h){
    var objName=c.get("v.SelectObj")
    var fieldName=c.get("v.fields")
    var action=c.get("c.Datatypemethod");
    action.setParams({
    "fieldName":fieldName,
    "objectName":objName
    });
        
       action.setCallback(this,function(actionResult){
           var newone = actionResult.getReturnValue();
           console.log(newone);
                       c.set("v.fdt", actionResult.getReturnValue());
           
})
       $A.enqueueAction(action);

    }
		
})