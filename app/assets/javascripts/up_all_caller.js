var updateAll=function(){
  $.ajax({
    type:'GET',
    url:'/dramas/update_all'
  });
}

$(document).on("click","#up_all_btn",updateAll);

$(document).ready(function () {

  $(document).ajaxStart(function () {
    $('.drama').fadeOut("slow");
    $('.preloader-overlay').show();
    $('.preloader-wrapper').show();
  });

  $(document).ajaxStop(function () {
    $('.drama').fadeIn("slow");
    $('.preloader-overlay').hide();
    $('.preloader-wrapper').hide();
  });
});
