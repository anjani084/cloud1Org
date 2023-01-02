({
    fetchSubjectPicklist : function(component, event, helper) {
        var action = component.get("c.SubjectList");
        component.find("searchKey").set("v.value", 'Call');
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var record = response.getReturnValue();
              // console.log('RecordHelper>>>>'+JSON.stringify(record));
                
                component.set("v.SubjectListOfTask",record);
            }
        })
        $A.enqueueAction(action);
    },
    onchangehelper : function(component, event, helper){
       // console.log('I am In ochange method');
        var record = component.get("v.SubjectListOfTask");
        //console.log('Record>>>>'+record);
        var iteratable = [];
        var searchKey = component.get('v.tempValue');
        //console.log(searchKey);
	   
       for(var i in record){
           //console.log('>>>>> '+record[i]);
           if(record[i].toLowerCase().includes(searchKey.toLowerCase())){
             // console.log('true');
               iteratable.push(record[i]);
           }
         }
        component.set("v.forIteration",iteratable);
        
    }
    
})