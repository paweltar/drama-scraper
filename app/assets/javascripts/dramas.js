$(document).ready(function() {
  $('#dramas').masonry({
   columnWidth: 320,
   itemSelector: '.drama',
   isFitWidth: true
  }).imagesLoaded(function() {
   $('#dramas').masonry('reload');
  });
});
