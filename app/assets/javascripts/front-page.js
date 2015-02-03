$(document).ready (function(){
    var $window = $(window);
    $('section[data-type="background"]').each(function(){
        var image = $(this);

        $(window).scroll(function() {
            var yPos = -($window.scrollTop() / image.data('speed'));
            var coords = '50% '+ yPos + 'px';
            image.css({ backgroundPosition: coords });
        });
    });
});
