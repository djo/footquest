$(function () {
  var form = $('#new_comment');
  var errors = $('.errors', form);
  var comments= $('#comments')
  
  var addComment = function (event, data) {
    comments.prepend(data);
    errors.empty();
    $(':input', form).not(':button, :submit, :reset, :hidden').val('');
  }
  
  var addErrors = function (event, xhr) {
    errors.html(xhr.responseText);
  }
  
  form.bind('ajax:success', addComment);
  form.bind('ajax:error', addErrors);
});
