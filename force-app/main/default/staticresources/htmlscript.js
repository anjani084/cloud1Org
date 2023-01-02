function isSupportedFileAPI() {
    return window.File && window.FileReader && window.FileList && window.Blob;
  }

  function formatEmail(data) {
    return data.name ? data.name + " [" + data.email + "]" : data.email;
  }

  function parseHeaders(headers) {
    var parsedHeaders = {};
    if (!headers) {
      return parsedHeaders;
    }
    var headerRegEx = /(.*)\: (.*)/g;
    while (m = headerRegEx.exec(headers)) {
      // todo: Pay attention! Header can be presented many times (e.g. Received). Handle it, if needed!
      parsedHeaders[m[1]] = m[2];
    }
    return parsedHeaders;
  }

  function getMsgDate(rawHeaders) {
    // Example for the Date header
    var headers = parseHeaders(rawHeaders);
    if (!headers['Date']){
      return '-';
    }
    return new Date(headers['Date']);
  }

  $(function () {
    if (isSupportedFileAPI()) {
      $('.src-file').change(function () {
        var selectedFile = this.files[0];
        if (!selectedFile) {
          $('.msg-info, .incorrect-type').hide();
          return;
        }
        if (selectedFile.name.indexOf('.msg') == -1) {
          $('.msg-info').hide();
          $('.incorrect-type').show();
          return;
        }
        $('.msg-example .msg-file-name').html(selectedFile.name);
        $('.incorrect-type').hide();

        // read file...
        var fileReader = new FileReader();
        fileReader.onload = function (evt) {

          var buffer = evt.target.result;
          var msgReader = new MSGReader(buffer);
          var fileData = msgReader.getFileData();
          if (!fileData.error) {
            $('.msg-example .msg-from').html(formatEmail({name: fileData.senderName, email: fileData.senderEmail}));

            $('.msg-example .msg-to').html(jQuery.map(fileData.recipients, function (recipient, i) {
              return formatEmail(recipient);
            }).join('<br/>'));
            $('.msg-example .msg-date').html(getMsgDate(fileData.headers));
            $('.msg-example .msg-subject').html(fileData.subject);
            $('.msg-example .msg-body').html(
                fileData.body ? fileData.body.substring(0, Math.min(500, fileData.body.length))
                + (fileData.body.length > 500 ? '...' : '') : '');
            if (fileData.bodyHTML) {
              $('.msg-example .msg-body-html').html(fileData.bodyHTML).closest('div.field-block').show();
            } else {
              $('.msg-example .msg-body-html').closest('div.field-block').hide();
            }
            $('.msg-example .msg-attachment').html(jQuery.map(fileData.attachments, function (attachment, i) {
              var file = msgReader.getAttachment(i);
              var fileUrl = URL.createObjectURL(new File([file.content], attachment.fileName,
                {type: attachment.mimeType ? attachment.mimeType : "application/octet-stream"}));
              return attachment.fileName + ' [' + attachment.contentLength + 'bytes]' +
                  (attachment.pidContentId ? '; ID = ' + attachment.pidContentId : '') +
                  '; <a href="' + fileUrl + '">Download</a>';
            }).join('<br/>'));
            $('.msg-info').show();

            // Use msgReader.getAttachment to access attachment content ...
            // msgReader.getAttachment(0) or msgReader.getAttachment(fileData.attachments[0])
          } else {
            $('.msg-info').hide();
            $('.incorrect-type').show();
          }
        };
        fileReader.readAsArrayBuffer(selectedFile);
      });
    } else {
      $('.msg-example').hide();
      $('.file-api-not-available').show();
    }
  });