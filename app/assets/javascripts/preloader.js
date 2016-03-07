$(document).on('page:fetch', function() {
  $('.preloader-overlay').show();
  $('.preloader-wrapper').show();
});

$(document).on('page:change', function() {
  $('.preloader-overlay').hide();
  $('.preloader-wrapper').hide();
});
