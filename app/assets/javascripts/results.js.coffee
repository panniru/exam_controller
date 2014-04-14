$ ->
   $("a[rel = 'results-template']").on('click', ->
        url = "/results/result_upload.xlsx?c="+$("select[rel = 'result-course']").val()+"&s="+$("select[rel='result-semester']").val()
        window.location = url
    )

   $('body').on('change', 'select[rel="result-course"]', (event) ->
        if $(this).val().length > 0
            url = "/courses/course_sems.json?course="+$(this).val()
            parent = $("select[rel = 'result-semester']")
            if typeof $(this).data('target') != 'undefined' and $(this).data('target') != ''
                parent = $("#"+$(this).data('target'))
            parent.empty()
            $.getJSON(url, (data)->
                $("<option>").val('').text('').appendTo(parent)
                $.each(data, (index, item) ->
                        $("<option data-id = "+item[1]+">").val(item[0]).text(item[0]).appendTo(parent)
                        )
                )
        )

   $("select#result-new-semester").on('change', (event) ->
        if $(this).val().length > 0
            $("#course_id").val($(this).find("option:selected").data('id'))    
            url = "/courses/"+$(this).find("option:selected").data('id')+"/course_subjects.json"
            parent = $("#result-subjects")
            parent.empty()
            $.getJSON(url, (data)->
                $.each(data, (index, item) ->
                        parent.append(buildFormElement("result[subject_"+(index+1)+"]", item))
                        )
                )
        )

buildFormElement = (name, label) ->
        '<label for="'+name+'" class="col-sm-2 control-label">'+label+'</label><div class="col-sm-4"><input type="text" name="'+name+'" id="'+name+'" class="form-control"></div>'
                
           

    

