var jQuery_1_8_2 = jQuery_1_8_2 || $.noConflict();
(function ($, undefined) {
	$(function () {
		"use strict";
        // Initialize the jQuery File Upload widget:
        init();
       
        onClickStartButtonEventHandler();
    
        // Enable iframe cross-domain access via redirect option:
        enableCrossDomainEventHandler();
        
        onLoadDocumentPageEventHandler();
    });

    const init = function() {
        // $('#fileupload').fileupload({
        //     add: function (e, data) {
                
        //         var count = data.files.length;
        //         var i;
        //         for (i = 0; i < count; i++) {
        //             data.files[i].uploadName =
        //                 Math.floor(Math.random() * 1000) + '_' + data.files[i].name;
        //         }
        //         var jqXHR = data.submit()
        //         .success(function (result, textStatus, jqXHR) {
        //             console.log("success:" + result);  
        //         }).error(function (jqXHR, textStatus, errorThrown) {
                    
        //         }).complete(function (result, textStatus, jqXHR) {
        //             console.log("complete:" + result);  
        //         });
        //     }
        // });
        
    }
    const onClickStartButtonEventHandler = function() {
        // $('.start').on('click', function(e) {
        //     console.log('clicked');
        //     var filesList = $('input[type="file"]').prop('files');
        //     console.log(filesList)
        //     $('#fileupload').fileupload('send', {
        //         files: filesList,
        //         url: 'admin.php?controller=pjAdminOptions&action=fileUploadEventHandler'
        //     }).success(function (result, textStatus, jqXHR) {
        //         console.log("success:" + result);  
        //     }).error(function (jqXHR, textStatus, errorThrown) {
                
        //     }).complete(function (result, textStatus, jqXHR) {
        //         console.log("complete:" + result);  
        //     });
        // })
        var url = 'admin.php?controller=pjAdminOptions&action=fileUploadEventHandler';
        uploadButton = $('<button/>')
            .addClass('btn btn-primary')
            .prop('disabled', true)
            .text('Processing...')
            .on('click', function () {
                var $this = $(this),
                    data = $this.data();
                $this
                    .off('click')
                    .text('Abort')
                    .on('click', function () {
                        $this.remove();
                        data.abort();
                    });
                data.submit().always(function () {
                    $this.remove();
                });
            });
    $('#fileupload').fileupload({
        url: url,
        maxFileSize: 999000,
       
    }).on('fileuploaddone', function (e, data) {
        const res = data.result;
        console.log(res);
        if (res.status === 200) {
           // alert(res.message);
            location.reload();
        }
    }).on('fileuploadfail', function (e, data) {
        $.each(data.files, function (index) {
            var error = $('<span class="text-danger"/>').text('File upload failed.');
            $(data.context.children()[index])
                .append('<br>')
                .append(error);
        });
    }).bind('fileuploaddestroy', function (e, data) {
        //console.log(data);
        //alert('Your document has been successfully deleted');
        location.reload();
    });
        
    }
    const enableCrossDomainEventHandler = function() {
        $('#fileupload').fileupload(
            'option',
            'redirect',
            window.location.href.replace(
                /\/[^\/]*$/,
                '/cors/result.html?%s'
            )
        );
    }
    const onLoadDocumentPageEventHandler = function() {
        $('#fileupload').addClass('fileupload-processing');
        $.ajax({
            url: $('#fileupload').fileupload('option', 'url'),
            dataType: 'json',
            context: $('#fileupload')[0]
        }).always(function () {
            $(this).removeClass('fileupload-processing');
        }).done(function (result) {
          //console.log(result);
          if(result) {
            const files = result.data.files;
            const listOfFiles = [];
            if (typeof files !== 'undefined' && files.length > 0) {
                files.forEach((file, canvasId) => {
                    previewPdf({url:file.url, canvasId:canvasId});
                    listOfFiles.push({
                        deleteType: file.deleteType,
                        deleteUrl:  'admin.php?controller=pjAdminOptions&action=fileUploadEventHandler&id='+file.id+'&file=' + file.name,    
                        name: file.name,    
                        size: file.size,    
                        url: file.url,   
                        id: file.id 
                    });
                });
                var result = {
                    files: listOfFiles
                }
            }
          }
            $(this).fileupload('option', 'done')
                .call(this, $.Event('done'), {result: result});
         
        });
    }
    const previewPdf = function(options) {
        // If absolute URL from the remote server is provided, configure the CORS
        // header on that server.
        var url = options.url;

        // Loaded via <script> tag, create shortcut to access PDF.js exports.
        var pdfjsLib = window['pdfjs-dist/build/pdf'];
        var workerSrc = PdfJs + '/build/pdf.worker.js';
        // The workerSrc property shall be specified.
        pdfjsLib.GlobalWorkerOptions.workerSrc = workerSrc;

        // Asynchronous download of PDF
        var loadingTask = pdfjsLib.getDocument(url);
        loadingTask.promise.then(function(pdf) {
        
        
        // Fetch the first page
        var pageNumber = 1;
        pdf.getPage(pageNumber).then(function(page) {
            
            
            var scale = 0.2;
            var viewport = page.getViewport({scale: scale});

            // Prepare canvas using PDF page dimensions
            
            var canvas = document.getElementById(`the-canvas_${options.canvasId}`);
           /// console.log(canvas);
            var context = canvas.getContext('2d');
            canvas.height = viewport.height;
            canvas.width = viewport.width;

            // Render PDF page into canvas context
            var renderContext = {
            canvasContext: context,
            viewport: viewport
            };
            var renderTask = page.render(renderContext);
            renderTask.promise.then(function () {
            
            });
        });
        }, function (reason) {
        // PDF loading error
        console.error(reason);
        });
    }
})(jQuery_1_8_2);