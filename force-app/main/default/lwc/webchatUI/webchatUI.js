import { LightningElement,track } from 'lwc';
import BaseChatMessage from 'lightningsnapin/baseChatMessage';
import myResource from '@salesforce/resourceUrl/Logo';
import getName from'@salesforce/apex/fetchUserName.fetchCurrentUserName';
export default class WebchatUI extends LightningElement {
    ChatLogo = myResource;
    @track UserName='';
    @track Name;
    @track minimizePart=false;
    
        connectedCallback() {
            getName()
            .then(result => {
            this.UserName = result;
            })
            .catch(error => {
            this.error = error;
            });
            }
    @track showTabTwo=false;
    @track showTabOne=true;
    handleClicktabone(){
        try{
        console.log('this.showTabTwo1: '+this.showTabTwo)
        this.showTabOne=false;
        this.showTabTwo=true;
        this.minimizePart=false;
        console.log('this.showTabTwo2: '+this.showTabTwo)
        }catch(error){
            console.log('error>>>>>'+error);
        }
    }
    handleClicktabtwo(){
        try{
        this.showTabOne=true;
        this.showTabTwo=false;
        this.minimizePart=false;
        }catch(error){
            console.log('error>>>>>>>'+error);
        }
    }
    handleClicktabminimize(){
        try{
            this.showTabTwo=false;
            this.minimizePart=true;

        }catch(error){
            console.log('error>>>>>>'+error);
        }
    }
    MaximizePart(){
        this.showTabTwo=true;
            this.minimizePart=false;
            this.showTabTwo=true;
    }
    handleKeyPress(event){
        try{
            console.log('inside handler on key press');
            if (event.which == 13){
                console.log('inside second handler');
                this.Name = event.target.value;
                console.log('value will be: '+this.Name);
            }    
        }catch(error){
            console.log('error>>>>>>>>'+error);
        }
    }

}