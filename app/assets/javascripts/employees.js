
$(document ).ready(function() {
    $("input[rel = 'submit-employee']").on('click', function(){
        $("form#employee").submit()
    })

    
})


function drawChart() {
    
    var data = new google.visualization.DataTable();
    
    data.addColumn('string', 'Name');
    data.addColumn('string', 'Manager');
    data.addColumn('string', 'ToolTip');
    var emps = []
    $.each(gon.employees, function( index, value ) {
        emps.push([{v: value.id.toString(), f: createNode(value.name, value.department, value.designation, value.avatar, value.id, value.manager, value.avatar)}, value.manager.toString(), value.name])
    });
    /* data.addRows([
       [{v:'Mike', f: va}, '', 'The President'],
       [{v:'Jim', f:va}, 'Mike', 'VP'],
        [{v:'Alice', f:va}, 'Mike', ''],
        ['Bob', 'Jim', 'Bob Sponge'],
        ['Carol', 'Bob', '']
    ]); */ // data format 
    
    data.addRows(emps)
    var chart = new google.visualization.OrgChart(document.getElementById('chart'));
    
    chart.draw(data, {allowHtml:true, nodeClass: "custom-node"});
    google.visualization.events.addListener(chart, 'select', function(event){
        $("bidy").popover({html:true,placement: "right"});
        $(".table-node").popover({html:true,placement: "right"});
    });
}

function createNode(name, dept, design, imgUrl,id,mngr,avatar){
    node = "<img id = 'pop' class = 'img-circle img-thumbnail table-node' src = '"+avatar+"' alt = '"+name+"' width='75px' height='75px' "+popOver(name, dept, design, imgUrl,id,mngr)+"/>"
    return node
}

function popOver(name, dept, design, imgUrl,id,mngr){
    var data = "<span class= 'left-field'>Name:</span><span class='right-field'>&nbsp;&nbsp;&nbsp;"+name+"</span><br/>"+
        "<span class= 'left-field'>Designation:</span><span class='right-field'>&nbsp;&nbsp;&nbsp;"+design+"</span><br/>"+
        "<span class= 'left-field'>Department:</span><span class='right-field'>&nbsp;&nbsp;&nbsp;"+dept+"</span><br/>"
    if(gon.user_role == 'admin'){
        data +=  "<a class = 'btn btn-danger btn-xs' href='javascript:addChild("+id+")'>Add Child</a>&nbsp;&nbsp;&nbsp;<a class = 'btn btn-success btn-xs' href='javascript:editEmployee("+id+")'>Edit</a>"
    }
    var content = "data-container='body' data-toggle='popover' data-content= \" "+data+"\""
    return content
}


function editEmployee(id){
    $.getJSON("/employees/"+id, function(data){
        $('form#employee').find('input[type=text]').val('')
        $('form#employee').find('input[type=file]').val('')
        $("form#employee").attr('action', '/employees/'+data.id)
        $("form#employee").attr('method', 'put')
        $("#employee-id").val(data.id)
        $("#employee-name").val(data.name)
        $("#employee-designation").val(data.designation)
        $("#employee-department").val(data.department)
        $("#employee-manager").val(data.manager)
        $("#employee-avatar").attr('src',data.avatar.url)
        $("#employee-model").modal()
    })
}

function addChild(id){
    $('form#employee').find('input[type=text]').val('')
    $("form#employee").attr('action', '/employees')
    $("form#employee").attr('method', 'post')
    $("#employee-manager").val(id)
    $("#employee-model").modal()
}

