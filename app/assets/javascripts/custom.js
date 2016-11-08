$(document).ready(function() {
  $('.modal').modal()
  $('select').material_select();
  $('.parallax').parallax();

  $('#picker-button').on('click', onApiLoad())
});
