$(document).on("turbolinks:load", function(){
    $("#toggle").on("click", function(){
        if ($("#button").hasClass("close")){
            $(".user-menu").slideDown(200).css("display", "flex");
            $("#button").html("▲");
            $("#button").removeClass("close");
            $("#button").addClass("open");
        } else {
            $(".user-menu").slideUp(200);
            $("#button").html("▼");
            $("#button").removeClass("open");
            $("#button").addClass("close");
        }
    });    
});


