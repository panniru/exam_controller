$ ->
   $("button[rel = 'add-more-rows']").on('click', (event) ->
        alert($("#total_rows").val())
        rows = parseInt($("#total_rows").val())
        $("#total_rows").val(rows+10)
        for i in [rows...(rows+10)]
                row = '<div class = "row">'+createRow(i)+'</div><br/>'
                $("#row-content").append(row)

        )
   $("select[rel = 'sortByChange']").on('change', (event) ->
        $("form#seatSearch").submit()
        )
                
        

createRow = (row) ->
        content = '<div class="col-sm-2">'
        content += '<select name= "dept_'+row+'" class = "form-control" rel = "result-course" data-target = "result-sem-'+row+'">'
        content += $("#seat_allotment_dept_1").html()
        content += '</select>'
        content += '</div>'
        content += '<div class="col-sm-1">'
        content += '<select name= "semester_'+row+'" class = "form-control" rel = "result-semester" id = "result-sem-'+row+'">'
        content += '<option val = ""></option>'
        content += '</select>'
        content += '</div>'
        content += '<div class="col-sm-2">'
        content += '<input type = "text" class = "datepicker form-control" name = "exam_date_'+row+'" />'
        content += '</div>'
        content += '<div class="col-sm-2">'
        content += '<input type = "text" class = "form-control" name = "roll_from_'+row+'" />'
        content += '</div>'
        content += '<div class="col-sm-2">'
        content += '<input type = "text" class = "form-control" name = "roll_to_'+row+'" />'
        content += '</div>'
        content += '<div class="col-sm-1">'
        content += '<input type = "text" class = "form-control" name = "room_no_'+row+'" />'
        content += '</div>'        
        content += '<div class="col-sm-2">'
        content += '<input type = "text" class = "form-control" name = "teacher_'+row+'" />'
        content += '</div>'
