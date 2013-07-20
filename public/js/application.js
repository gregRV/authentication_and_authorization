$(document).ready(function() {

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function(e) {
    e.preventDefault();
    var request = $.ajax({ 
    	url: $(this).attr('href'), 
    	type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

  // STOPS FORM AND DISPLAYS ERRORS
  $('#sign-up').on('submit', function(e){    
  	var nameLength = $('.name').val().length;
    var emailLength = $('.email').val().length;
    var passwordLength = $('.password').val().length;

    $('.name-errors').empty();
    $('.email-errors').empty();
    $('password-errors').empty();

    if (nameLength === 0){
      e.preventDefault();
      $('.name-errors').html("<li>Please enter your Name.</li>");
    }

    if (emailLength === 0){
      e.preventDefault();
      $('.email-errors').html("<li>Please enter your Email.</li>");
    }

    if (passwordLength < 6){
      e.preventDefault();
      $('.password-errors').html("<li>Password must be at least 6 characters.</li>");
    }
  });
});
