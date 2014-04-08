$(function(){
    $("#feedback-new").on('click',function() {
        var name = $("#feedback_name").val()
        var email = $("#feedback_email").val()
        var description = $("#feedback_description").val()
        $(".error").hide()
        if (name == "") {
            $("#name_error").show()
            $("#feedback_name").focus()
            return false
        }
        if (description == "") {
            $("#name_description").show()
            $("#feedback_description").focus()
            return false
        }
        $.post('/feedbacks.json?'+$("form#new_feedback").serialize(), function(data) {
            if(data.name != ''){
                $("#feedback_status").val("Submitted Successfully")
            }else{
                $("#feedback_status").val("Submition Failed")
            }
            $("#feedback_status").show()
        });
    });
});
