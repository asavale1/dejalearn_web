$(document).ready(function(){
	$(".main").onepage_scroll({
        	sectionContainer: "div.scroll",
        	easing: "ease",
        	responsiveFallback: 600,
        	loop: true,
        	pagination: false,
      	});
});

function scroll(index){
	console.log(index);
	$(".main").moveTo(index);
}