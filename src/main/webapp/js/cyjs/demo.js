/**
 * Particleground demo
 * @author Jonathan Nicol - @mrjnicol
 */

$(document).ready(function() {
  $('#particles').particleground({
    dotColor: '#ffffff',
    lineColor: '#47a4e1',
  });
  $('.intro').css({
    'margin-top': -($('.intro').height() / 2)
  });
});