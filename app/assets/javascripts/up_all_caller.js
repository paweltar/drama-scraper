var updateAll=function(){
  $.ajax({
    type:'GET',
    url:'/dramas/update_all',
    success:function(){
      $( "html").fadeOut( "fast" );
        location.reload(true)
      $( "html").fadeIn( "slow" );
    }
  });
}

$(document).on("click","#up_all_btn",updateAll);
