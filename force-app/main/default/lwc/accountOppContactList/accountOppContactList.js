import { LightningElement, wire, track} from 'lwc';
import getAccounts from '@salesforce/apex/getRecordDataController.getAccounts';
export default class GetDataDisplayData extends LightningElement {
    @track items = [];
     @wire(getAccounts) wiredAccounts({ error, data }){
         if(data){
       
        for(let i=0;i<data.length;i++){
            this.items = [...this.items ,{value: data[i].Id , label: data[i].Name} ]; 
        }
     }
     else if(error){
         console.log('error'+JSON.stringify(error));
     }
    }
     
    get roleOptions() {
        return this.items;
    }
    handleTypeChange(event) {
        const selectedOption = event.detail.value;
        console.log('selected value=' + selectedOption);
    }

     
}