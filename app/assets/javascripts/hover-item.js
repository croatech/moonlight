var ready;
ready = function() {

  $('.t-background > #block').hover(function () {
    $(this).find('#stats').css('display', 'block');
  }, function () {
    $(this).find('#stats').css('display', 'none');
  });

};

$(document).ready(ready);
$(document).on('page:load', ready);