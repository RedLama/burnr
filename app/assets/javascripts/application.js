//= require jquery
//= require jquery_ujs
//= require turbolinks

$(document).on('page:change', function(event) {
  // slideshow
  resizeSlideshow("slideshow", 1600, 450);

  setInterval(slideshowNext, 5000);
  $('#slideshow .next').click(function() {
    slideshowNext();
  });
  $('#slideshow .previous').click(function() {
    $("#slideshow ul li:last-child").hide().css({'margin-left': "-100%"}).prependTo("#slideshow ul").show();
    $("#slideshow ul li:first-child").animate({"margin-left": "0"}, 800);
  });
  function slideshowNext(){
    $("#slideshow ul li:first-child").animate({"margin-left": "-100%"}, 800, function(){
        $(this).css("margin-left",0).appendTo("#slideshow ul");
    });
  }

  $(window).resize(function() {
    resizeSlideshow("slideshow", 1600, 450);
  });

  function resizeSlideshow(identifier, initialWidth, initialHeight) {
    $('.resizable-slideshow').each(function () {
      var contentWidth = $("body").width();
      var ratio = initialWidth / initialHeight;
      $(this).css({'background-size': contentWidth + "px " + Math.floor(contentWidth / ratio) + "px", 'width': contentWidth + "px"});
      var paddingTop = $(this).css('padding-top');
      $("#slideshow").css('height', Math.floor(contentWidth / ratio) - parseInt(paddingTop));
    });
  }
  // end slideshow

  // menu
  $('.parent').hover(function(){
    $(this).find('.childs').show();
  });

  $('.parent').mouseleave(function(){
    if($(this).find('.childs:hover').length == 0) {
      $(this).find('.childs').hide();
    }
  });

  $('.childs').mouseleave(function(){
    if($(this).closest('.parent:hover').length == 0) {
      $(this).hide();
    }
  });
  // end menu
});
