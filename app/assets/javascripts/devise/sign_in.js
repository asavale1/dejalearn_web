$(document).ready(function(){
	$("#bottom").hide();
	options = {
		"trigger": "hover",
		"title":"Tie title",
		"placement":"right"
	}
	$('.help').tooltip(options);
});

function signup(){
	$("div#bottom").show("slide", { direction: "up" }, 1000);
	$("#sign-up-button").hide();
}

function checkEmail(){

}

function checkPassword(){

}