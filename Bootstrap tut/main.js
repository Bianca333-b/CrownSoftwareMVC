$(document).ready(function(){

  // Header full height
  $('.header').height($(window).height());

  // Smooth scroll
  $(".navbar a").click(function(){
    $("html, body").animate({
      scrollTop: $("#" + $(this).data('value')).offset().top
    }, 1000);
  });

  // Fun / Serious mode toggle
  $('#modeButton').click(function(){
    $('body').toggleClass('serious-mode');

    if ($('body').hasClass('serious-mode')) {
      $(this).text('Fun Mode'); // switch to fun
      $(this).removeClass('btn-dark').addClass('btn-light');
    } else {
      $(this).text('Serious Mode'); // switch to serious
      $(this).removeClass('btn-light').addClass('btn-dark');
    }
  });

});
