import { LightningElement,api,wire } from 'lwc';
//import getRelatedFilesByRecordId from '@salesforce/apex/filePreviewAndDownloadController.getRelatedFilesByRecordId'
import {NavigationMixin} from 'lightning/navigation'
import { loadScript } from 'lightning/platformResourceLoader';
import msgreader from "@salesforce/resourceUrl/msgreader";
import License from "@salesforce/resourceUrl/License";
import JZ from "@salesforce/resourceUrl/jquery";
import 	htmlscript from "@salesforce/resourceUrl/htmlscript";
import DataStream from "@salesforce/resourceUrl/DataStream";
import multipartform from "@salesforce/resourceUrl/multipartform";
export default class FilePreviewAndDownloads extends LightningElement {
    connectedCallback() {
        try {
            console.log('try');
            loadScript(this, JZ)
    .then(response => {
        console.log('inside jquery:::');
        console.log(response);
    });
            loadScript(this, DataStream)
    .then(response => {
        console.log('inside datastream:::');
        console.log(response);
    });
        loadScript(this, htmlscript)
    .then(response => {
        console.log('inside htmlscript:::');
        console.log(response);
    });
        loadScript(this, multipartform)
    .then(response => {
        console.log('inside multipartform:::');
        console.log(response);
    });
    loadScript(this, License)
    .then(response => {
        console.log('inside License:::');
        console.log(response);
    });

        loadScript(this, msgreader)
    .then(response => {
        console.log('inside msgreader:::');
        console.log(response);
    });
}catch(e) {
    console.log(e);
}
    
}
    
}