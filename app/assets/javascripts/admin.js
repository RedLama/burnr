//= require jquery
//= require jquery_ujs
//= require jquery-ui/datepicker
//= require jquery-ui/datepicker-fr
//= require jquery-ui/datepicker-es
//= require jquery-ui/
//= require twitter/bootstrap
//= require bootstrap
//= require turbolinks

$(document).on('page:change', function(event) {
  if ($('.datepicker').length >= 0) {
    locale = $('.datepicker').data('locale');
    $(".datepicker").datepicker( $.datepicker.regional[ locale == "en" ? "" : locale ] );
  }

});
