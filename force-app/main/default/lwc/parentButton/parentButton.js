import { LightningElement,track } from 'lwc';
//import getAccountList from '@salesforce/apex/GetAccount.GetAccountDetail';

export default class ParentButton extends LightningElement {
@track showModal=false;
AccountOptionsModal() {
    try {
        this.showModal=true;
    } catch (error) {
        console.log('error>>>>>' + error);
    }
}
}