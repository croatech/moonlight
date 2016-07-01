var ready;
ready = function() {

  $('.spoiler-text').hide()
  $('.spoiler').click(function(){
    $(this).toggleClass("folded").toggleClass("unfolded").next().slideToggle()
  })

};

$(document).ready(ready);
$(document).on('page:load', ready);