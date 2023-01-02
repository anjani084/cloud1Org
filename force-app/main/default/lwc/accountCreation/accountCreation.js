import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class LdsCreateRecord extends LightningElement {
    strName;
    strAccountNumber;
    strPhone;
    strShippingAddress;
    strAnnualRevenue;
    // Change Handlers.
    nameChangedHandler(event){
        this.strName = event.target.value;
    }
    numberChangedHandler(event){
        this.strAccountNumber = event.target.value;
    }
    ShippingAddressChangedHandler(event){
        this.strShippingAddress = event.target.value;
    }
    AnnualRevenueChangedHandler(event){
        this.strAnnualRevenue = event.target.value;
    }
    phoneChangedHandler(event){
        this.strPhone = event.target.value;
    }
    // Insert record.
    createAccount(){
        // Creating mapping of fields of Account with values
        var fields = {'Name' : this.strName, 'AccountNumber' : this.strAccountNumber, 'Phone' : this.strPhone};
        // Record details to pass to create method with api name of Object.
        var objRecordInput = {'apiName' : 'Account', fields};
        // LDS method to create record.
        createRecord(objRecordInput).then(response => {
            const evt=new ShowToastEvent({
                title:'Success',
                message:'Account Created SuccessFully',
                variant:'Success'});
                this.dispatchEvent(evt);
        }).catch(error => {
            alert('Error: ' +JSON.stringify(error));
        });
    }
}