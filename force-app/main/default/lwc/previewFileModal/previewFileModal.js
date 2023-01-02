import { LightningElement, api,track,wire } from "lwc";
import getVFOrigin from '@salesforce/apex/GalleryCom.getVFOrigin';
import getAllAttachmentForDataTable from '@salesforce/apex/GalleryCom.getAllAttachmentForDataTable';
import getSelectedImage from '@salesforce/apex/GalleryCom.getSelectedImage';

//import getFileBody from '@salesforce/apex/GalleryCom.getFileBody';
import getEncodedFileContent from '@salesforce/apex/GalleryCom.getEncodedFileContent';
//import convertDocxToPdf from '@salesforce/apex/DOCTOPDFConvertor.convertDocxToPdf';
//import getDocFile from '@salesforce/apex/GalleryCom.getDocFile';
import { loadScript } from "lightning/platformResourceLoader";

/*Read the excel uploaded data*/

//import excelFileReader from "@salesforce/resourceUrl/ExcelReaderPlugin";
//let XLS = {};

export default class PreviewFileModal extends LightningElement {
  @track url;
  @api recordId;
  @track data;
  showFrame = false;
  showModal = false;
  @track decodedfileContent;
  @track fileContent;
  @track docContent;
  @track objExcelToJSON;
  @track fileContent;
@track ExcelData;
    strUploadFileName;
  @wire(getVFOrigin)
vfOrigin
connectedCallback(){
    getAllAttachmentForDataTable({recordIds:this.recordId}).then(result=>{
    this.data=result;
    console.log('get all attahments>>>'+JSON.stringify(this.data));
    })
    }
    getEncodedFile(contentId){
        console.log(" processing the file");
        console.log(contentId);
    getEncodedFileContent({cvId:contentId}).then(result=>{
        this.fileContent=result;
       // console.log('this.fileContent'+this.fileContent);
      this.decodedfileContent=window.atob(this.fileContent);
      console.log('this.decodedfileContent'+JSON.stringify(this.decodedfileContent));
      console.log('this.decodedfileContent.length'+this.decodedfileContent.length);
      console.log('this.decodedfileContent.type'+typeof this.decodedfileContent);
      
    this.template.querySelector("iframe").contentWindow.postMessage(this.decodedfileContent, this.vfOrigin.data);
      
       })
    }
      
  @api show(FileExtension,fileUrl,contentId,Filetitle,recordId) {
  let Excelcontent;
    this.url=fileUrl;
    console.log('contentId'+contentId);
    console.log(FileExtension);
    console.log('url is'+JSON.stringify(this.url));
    console.log("###showFrame : " +FileExtension);
    if(FileExtension === "pdf" ){
      this.showFrame = true;
      this.showModal = true;
    }
    else if(FileExtension === "xls"){
      console.log('else if 11');
      getEncodedFileContent({cvId:contentId}).then(result=>{
        this.fileContent=result;
        console.log('result');
      this.decodedfileContent=window.atob(this.fileContent);
      console.log('this.decodedfile>>>>>>>>11'+this.decodedfileContent);
      console.log('else if 22');
     this.ExcelFileContent(this.decodedfileContent);
      })
    }
    else if(FileExtension === "doc"||FileExtension==='docx'){
    //   convertDocxToPdf({recordId:recordId,contentVersionId:contentId,fileName:Filetitle}).then(result=>{
    //     console.log(result);
    //     console.log('FileExtension>>>>'+JSON.stringify(result));
    //     if(result === "pdf" ){
    //       this.showFrame = true;
    //       this.showModal = true;
    //     }
 
      // })
    }
    else if(FileExtension === "msg" ||FileExtension === "pptx" ){
     
    }
   else if (FileExtension === "zip" ||FileExtension === "txt"  ||FileExtension === "html"  ||FileExtension === "csv" ||FileExtension === "xls"|| FileExtension === "xml" ||FileExtension === "json" )
    {
      //this.showFrame = true;
      //var newWindow=window.open(fileUrl,'_self');
      //newWindow.print();
     //this.template.querySelectorAll("iframe")[1].contentWindow.postMessage(fileUrl, this.vfOrigin.data);
    //   getFileBody({contentversionId:contentId,Extension:FileExtension}).then(result=>{
    //      var fileContent=result;

    //     this.template.querySelectorAll("iframe")[1].contentWindow.postMessage(fileContent, this.vfOrigin.data);
    //   })

    }
    else
    {
      console.log('Inside preview file modal');
      console.log(contentId);
      this.template.querySelectorAll("iframe")[0].contentWindow.postMessage(contentId, this.vfOrigin.data);
      showPreview.showPopup(contentId);
      this.showModal = true;
    }
  }
  closeModal() {
    this.showModal = false;
  }
  printModal(){
    this.showModal = false;
  }
  ExcelFileContent(contentReader){
    Promise.all([loadScript(this, excelFileReader)])

    .then(() => {

      XLS = XLSX;

    })

    .catch((error) => {

      console.log("An error occurred while processing the file");

    });

    const blobData=new Blob([contentReader]);
    let objFileReader = new FileReader();

    objFileReader.onload = (event) => {
     // console.log('this.decodedfileContent'+this.decodedfileContent);
//       let objFiledata = event.target.result;
// console.log('objFiledata'+objFiledata);


      let objFileWorkbook = XLS.read(contentReader, {

        type: "binary"

      });

      this.objExcelToJSON = XLS.utils.sheet_to_row_object_array(

        objFileWorkbook.Sheets["Sheet1"]

      );

      //Verify if the file content is not blank

      if (this.objExcelToJSON.length === 0) {

        this.strUploadFileName = "";

        this.dispatchEvent(

          new ShowToastEvent({

            title: "Error",

            message: "Kindly upload the file with data",

            variant: "error"

          })

        );

      }

      if (this.objExcelToJSON.length > 0) {

        //Remove the whitespaces from the javascript object

        Object.keys(this.objExcelToJSON).forEach((key) => {

          const replacedKey = key.trim().toUpperCase().replace(/\s\s+/g, "_");

          if (key !== replacedKey) {

            this.objExcelToJSON[replacedKey] = this.objExcelToJSON[key];

            delete this.objExcelToJSON[key];

          }

        });

        //console.log("objExcelToJSON"+JSON.stringify(this.objExcelToJSON));
        console.log(JSON.stringify(this.objExcelToJSON));

      }
      var objExcelJSON=JSON.parse(JSON.stringify(this.objExcelToJSON));
      this.template.querySelectorAll("iframe")[2].contentWindow.postMessage(objExcelJSON, this.vfOrigin.data);

    };

    objFileReader.onerror = function (error) {

      this.dispatchEvent(

        new ShowToastEvent({

          title: "Error while reading the file",

          message: error.message,

          variant: "error"

        })

      );

    };

    objFileReader.readAsBinaryString(blobData);
     
  }
  filePreview(event) {
    
    var imageId=event.target.dataset.id;
    getSelectedImage({ImageId:imageId}).then(result=>{
        console.log(JSON.stringify(result));
        var documentId=result;
        this.contentId=documentId.Id;
        this.getEncodedFile(this.contentId);
})
}
}