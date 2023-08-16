// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

//const channels = require.context('.', true, /_channel\.js$/)
//channels.keys().forEach(channels)

$(document).on("turbolinks:load", function(){
    $("#toggle").on("click", function(){
        console.log("push");
        $(".user-menu").css("display", "flex");
    });    
});


