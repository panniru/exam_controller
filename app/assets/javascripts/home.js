$(document ).ready(function() {
    $('.datepicker').datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: 'dd/mm/yy'
    });

    $('#rbvrr-gallery').carousel({
        interval: 4000
    })

    $('.carousel-inner .item').each(function(){
        var next = $(this).next();
        if (!next.length) {
            next = $(this).siblings(':first');
        }
        next.children(':first-child').clone().appendTo($(this));
        
        for (var i=0;i<2;i++) {
            next=next.next();
            if (!next.length) {
    	        next = $(this).siblings(':first');
            }
            
            next.children(':first-child').clone().appendTo($(this));
        }
    });
    
});

$(window).bind("load resize slid.bs.carousel", function() {
    var imageHeight = $(".active .holder").height();
    $(".controllers").height( imageHeight );
    console.log("Slid");
});
