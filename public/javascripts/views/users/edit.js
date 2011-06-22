$(function () {
  var togglePasswordSection = function () {
    var passwordSection = $('#password_section');
    
    passwordSection.toggleClass('hidden');
    
    if (passwordSection.is(':hidden')) {
      $('input', passwordSection).attr('disabled', 'disabled');
    } else {
      $('input', passwordSection).removeAttr('disabled');
    }
    
    return false;
  }
  
  $('#change_password').click(togglePasswordSection);
});

var hidePasswordSection = function(condition) {
  if (condition) $('#change_password').click();
}
