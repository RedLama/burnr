// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks

$(document).ready(function() {

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
});
