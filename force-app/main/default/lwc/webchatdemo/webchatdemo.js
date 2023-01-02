import { LightningElement, track, wire } from 'lwc';
import BaseChatMessage from 'lightningsnapin/baseChatMessage';
import myResource from '@salesforce/resourceUrl/Logo';
import getName from '@salesforce/apex/fetchUserName.fetchCurrentUserName';
import getNewLang from '@salesforce/apex/IntentoPostApi.PostAndTranslate';

export default class CustomTabWithButton extends LightningElement {
    ChatLogo = myResource;
    @track UserName = '';
    @track OriginalShowTempTrue = true;
    @track RealEach;
    @track CurrentTime;
    @track Name;
    @track tempList = [];
    @track OriginalValue;
    @track chatList2 = [];
    @track time;
    @track Sentence;
    @track chatList = [];
    @track minimizePart = false;

    connectedCallback() {
        try{
        getName()
            .then(result => {
                this.UserName = result;

            })
            .catch(error => {
                this.error = error;
            });
        }catch(error){
            console.log('error>>>>>'+error);
        }
    }
    @track showTabTwo = true;
    handleClicktabone() {
        try {
            console.log('this.showTabTwo1: ' + this.showTabTwo)
            this.showTabTwo = true;
            this.minimizePart = false;
            console.log('this.showTabTwo2: ' + this.showTabTwo)
        } catch (error) {
            console.log('error>>>>>' + error);
        }
    }
    handleClicktabtwo() {
        try {
            this.showTabTwo = false;
            this.minimizePart = false;
            this.chatList = [];
            this.Name = '';
        } catch (error) {
            console.log('error>>>>>>>' + error);
        }
    }
    handleClicktabminimize() {
        try {
            this.showTabTwo = false;
            this.minimizePart = true;

        } catch (error) {
            console.log('error>>>>>>' + error);
        }
    }
    MaximizePart() {
        this.showTabTwo = true;
        this.minimizePart = false;
        this.showTabTwo = true;
    }
    Originalshowbutton(event) {
        try {
            event.preventDefault();
            this.OriginalValue = event.currentTarget.dataset.value;
            console.log('original message: ' + this.OriginalValue);

            //this.chatList2 = this.tempList;
            console.log('chatList2: ' + this.chatList2);
            console.log('chatList: ' + this.chatList);
            console.log('tempList: ' + this.tempList);
            for (var i = 0; i < this.chatList.length; i++) {
                if (this.OriginalValue != this.chatList[i]) {

                    this.chatList2[i] = this.chatList[i];
                } else {
                    console.log('tempList[i]: '+this.tempList[i]);
                    this.chatList2[i] = this.tempList[i];
                }
            }
            this.OriginalShowTempTrue = false;

        } catch (error) {
            console.log(error);
        }
    }
    Originalhidebutton(event) {
        try {
            event.preventDefault();
            this.OriginalShowTempTrue = true;
            this.chatList2 = [];
        } catch (error) {
            console.log(error);
        }
    }
    handleKeyPress(event) {
        try {
            console.log('inside handler on key press');
            if (event.keyCode == 13 && !event.shiftKey) {
                console.log('inside second handler');
                if (this.Name.length > 0) {
                    this.chatList.push(this.Name);
                    console.log('value will be: ' + this.Name);
                    //intento integration-----------
                    getNewLang({ str: this.Name })
                        .then(result => {
                            console.log('result: ' + result);
                            this.Sentence = result;
                            this.OriginalShowTempTrue = true;
                            this.chatList2 = [];
                            console.log(this.Sentence);
                            this.tempList.push(this.Sentence);

                            var currentDateTime = new Date();
                            console.log('currentDateTime: '+currentDateTime);
                            this.CurrentTime=currentDateTime.getHours()+':'+currentDateTime.getMinutes();
                            console.log('CurrentTime: '+this.CurrentTime);

                        })
                        .catch(error => {
                            console.log(error);
                        });
                    //----------------------------
                    this.Name = null;
                    console.log('value will be22: ' + this.Name);
                    console.log("updateScroll");

                }
            }
            else if (event.keyCode == 13 && event.shiftKey) {
                console.log('this is new handler');
            }
        } catch (error) {
            console.log('error>>>>>>>>' + error);
        }
    }
    resetInput(event) {
        this.Name = event.target.value;

    }

}