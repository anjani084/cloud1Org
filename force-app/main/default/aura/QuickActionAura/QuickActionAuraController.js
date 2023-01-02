({
    doInit: function(cmp, evt, helper) {
        var myPageRef = cmp.get("v.pageReference");
        var recordId = myPageRef.state.c__recordId;
        cmp.set("v.recordId", recordId);
    },
    
    reInit : function(component, event, helper) {
        $A.get('e.force:refreshView').fire();
    }
})