import { LightningElement,track } from 'lwc';

export default class StartChatComponent extends LightningElement {
    @track showTabOne=true;
    @track showWebChat=false;

    handleClicktabone() {
        try {
            console.log('inside handler startChat: ');
            this.showTabOne=false;
            this.showWebChat=true;

        } catch (error) {
            console.log('error>>>>>' + error);
        }
    }
}