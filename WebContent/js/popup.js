$( document ).ready(function() {


    $( window ).resize(function() {
        var windowWidth = $(window).width();
        var windowHeight = $(window).height();

        if(windowWidth < 490) {
            $(".layerPop").css("left","245px");
        }
        if(windowWidth > 490){
            $(".layerPop").css("left","50%");
        }
        if(windowHeight < 443){
            $(".layerPop").css("top","221px");

        }
        if(windowHeight > 443){
            $(".layerPop").css("top","50%");

        }
    })


    $(" #popupOpen").click(function () {
        $(".modalMask").fadeIn();
        $(" .layerPop").fadeIn();

    })

    $(".submitArea img, .close").click(function () {
        $(".modalMask").fadeOut();
        $(" .layerPop").fadeOut();
    })
});