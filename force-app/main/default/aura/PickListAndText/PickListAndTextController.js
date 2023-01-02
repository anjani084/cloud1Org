({
    myAction : function(component, event, helper) {
        
        helper.fetchSubjectPicklist(component, event, helper) 
        var subjectofcall = component.get('v.tempValue');
        var evt = $A.get("e.c:subjectEvent");

    },
    //for comparing string of subject onchange method
    serchSubject : function(component, event, helper){
        component.set("v.issubjectOpen",true)
         console.log('method is calling') 
        helper.onchangehelper(component, event, helper);
    },
    valueClicked : function(component, event, helper){
        var selectedItem = event.currentTarget.dataset.Id;
        console.log('Current Event>>>>'+selectedItem);
        
        component.set('v.tempValue',selectedItem);
        component.set('v.SubjectTask',selectedItem);
        component.set("v.issubjectOpen",false);
        
        var subjectofcall = component.get('v.tempValue');
        var compEventA = component.getEvent("sampleComponentEventSubject");
        compEventA.setParams({
            "SubjectTask" :subjectofcall 
        });
        compEventA.fire();

        
        console.log(component.get('v.tempValue'));
        //var recordId = selectedItem.dataset.Id;
        //console.log('Current Event>>>>'+recordId);
    },
    Onclickhandler : function(component, event, helper){
        component.set("v.issubjectOpen",true);
         console.log('Onclick Called')
        
    },
    onSelectMethod: function (component, event, helper) {
       
        var selectedMenuItemValue = event.getParam("value");
         var compEventA = component.getEvent("sampleComponentEventSubject");
        compEventA.setParams({
            "SubjectTask" :selectedMenuItemValue 
        });
        compEventA.fire();
       
    },
    resetSubject : function (component, event, helper) {
        component.find("searchKey").set("v.value", 'Call');
        
    }
})