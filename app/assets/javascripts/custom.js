$(document).ready(function() {
  $('.modal').modal()
  $('select').material_select();
  $('.parallax').parallax();
  $('.start-open').modal('open')

  //$('#picker-button').on('click', onApiLoad())

  $('a.group-text-btn').on('click', function(){
    var href = $(this).parent().next().find('a').attr('href');
    var groupName = $(this).parent().next().find('a').text()
    var groupId = href.split('/')[2];
    var studentUrl = '/groups/' + groupId + '/messages/new';
    var guardianUrl = '/groups/' + groupId + '/guardians/messages/new';

    $('.group-name').html(groupName);
    $('#guardians').attr('href', guardianUrl);
    $('#students').attr('href', studentUrl);
  })


});
