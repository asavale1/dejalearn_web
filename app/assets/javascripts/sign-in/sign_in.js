$(document).ready(function(){
	$("#bottom").hide();
	options = {
		"trigger": "hover",
		"title":"Tie title",
		"placement":"right"
	}
	$('.help').tooltip(options);
});

function showSignup(){
	$("div#bottom").show("slide", { direction: "up" }, 1000);
	$("#sign-up-button").hide();
}

function checkEmail(){

}

function checkPassword(){

}

function signup(){
	var email = $('.email_field').val();
	var password = $('.password_field').val();
	var password_confirmation = $('#password_confirmation').val();
	console.log($('.email_field'));
	console.log($('.password_field'));
	$.ajax({
        type:"POST",
        data: {
        	"email" : email,
        	"password" : password,
        	"password_confirmation" : password_confirmation,
            "recaptcha_challenge_field": $('#recaptcha_challenge_field').val(),
            "recaptcha_response_field" : $("#recaptcha_response_field").val()
        },
        url: 'sign_up',
        success: function(data) { 
        	$('#errors').empty();
        	for(var i = 0; i < Object.keys(data).length; i++){
        		$('#errors').append('<div class="message" ><div><p>* '+data[i]+'</p></div></div>')
        	}
		},
        error: function(data) { 
            $('#errors').empty();
            $('#errors').append('<div class="message" ><div><p>* Captcha failed</p></div></div>')
        }
    });
}