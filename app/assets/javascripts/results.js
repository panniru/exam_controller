$(function() {
    $("a[rel = 'results-template']").on('click', function(){
        url = "/results/result_upload.xlsx?course="+$("#result-course").val()
        window.location = url
    })
});
