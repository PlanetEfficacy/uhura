$(document).ready(function() {
  $('.modal').modal()
  $('select').material_select();
  $('.parallax').parallax();
  $('#open-modal').modal('open')

  $('a.group-text-btn').on('click', function(){
    var href = $(this).siblings('h4').find('a').attr('href');
    var groupName = $(this).siblings('h4').text();
    var groupId = href.split('/')[2];
    var studentUrl = '/groups/' + groupId + '/messages/new';
    var guardianUrl = '/groups/' + groupId + '/guardians/messages/new';
    $('.group-name').html(groupName);
    $('#guardians').attr('href', guardianUrl);
    $('#students').attr('href', studentUrl);
  })
});
