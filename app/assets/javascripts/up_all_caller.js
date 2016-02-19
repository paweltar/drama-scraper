var updateAll=function(){
  $.ajax({
    type:'GET',
    url:'/dramas/update_all',
    success:function(){
      $( "html").fadeOut( "slow" );
        location.reload(true)
      $( "html").fadeIn( "slow" );
    }
  });
}

$(document).on("click","#up_all_btn",updateAll);