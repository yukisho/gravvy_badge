Badge = {}

$(document).ready(function(){
    window.addEventListener('message', function(event){
        var action = event.data.action;

        switch(action) {
            case "open":
                Badge.Open(event.data);
                break;
            case "close":
                Badge.Close(event.data);
                break;
        }
    });
});

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: // ESC
            Badge.Close();
            break;
        case 9: // ESC
            Badge.Close();
            break;
    }
});


Badge.Open = function(data) {;
    $("body").fadeIn(400);
}

Badge.Close = function(data) {
    $("body").fadeOut(400);
}