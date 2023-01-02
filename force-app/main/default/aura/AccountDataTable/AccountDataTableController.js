({
    fetchAccounts : function(component, event, helper) {
        component.set('v.mycolumns', [
            {label: 'Account Name', fieldName: 'Name', type: 'text', sortable: true},
            {label: 'Industry', fieldName: 'Industry', type: 'text'},
            {label: 'Type', fieldName: 'Type', type: 'Text'}
        ]);
        var action = component.get("c.fetchAccountList");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.acctList", response.getReturnValue());
                helper.sortData(component, component.get("v.sortedBy"), component.get("v.sortedDirection"));
            }
        });
        $A.enqueueAction(action);
    },
    updateColumnSorting: function (cmp, event, helper) {
        var fieldName = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');
        cmp.set("v.sortedBy", fieldName);
        cmp.set("v.sortedDirection", sortDirection);
        helper.sortData(cmp, fieldName, sortDirection);
    }
})