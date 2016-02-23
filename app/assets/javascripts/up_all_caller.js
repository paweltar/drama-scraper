var updateAll=function(){
  $.ajax({
    type:'GET',
    url:'/dramas/update_all'
  });
}

$(document).on("click","#up_all_btn",updateAll);

$(document).ready(function () {

  $(document).ajaxStart(function () {
    $('.drama').fadeOut();
    $('.preloader-overlay').show();
    $('.preloader-wrapper').show();
  });

  $(document).ajaxStop(function () {
    location.reload(true)
    $('#dramas').masonry();
    $('.drama').fadeIn();
    $('.preloader-overlay').hide();
    $('.preloader-wrapper').hide();
  });
});
