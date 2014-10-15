$(document).ready(function(){
	$("#bottom").hide();
});

function signup(){
	$("div#bottom").show("slide", { direction: "up" }, 1000);
	$("#sign-up-button").hide();
}