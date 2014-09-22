var storyAngle = 0;
var contactAngle = 0;
var storyInterval;
var contactInterval;

$(document).ready(function(){
	$(".main").onepage_scroll({
    	sectionContainer: "div.scroll",
    	easing: "ease",
    	responsiveFallback: 600,
    	loop: true,
    	pagination: false,
	});

    $("#story-img").hover(function(){
        console.log("In Hover Story");
        window.clearInterval(storyInterval);
    }, function(){
        console.log("Out of Hover Story");
        setStoryInterval();
    });

    $("#contact-img").hover(function(){
        console.log("In Hover Contact");
        window.clearInterval(contactInterval);
    }, function(){
        console.log("Out of Hover Contact");
        setContactInterval();
    });

    setStoryInterval();
    setContactInterval();

    $("#flipbook").turn({
        width: "100%",
        height: 500,
        autoCenter: true,
        elevation: 10
    });

    $("#flipbook").turn("page",3);
});

function setStoryInterval(){
    storyInterval = window.setInterval(function(){
        if(storyAngle == 360){
            storyAngle = 0;
        }

        rotate(storyAngle, "story-img");
        storyAngle += 1;
    }, 10);
}

function setContactInterval(){
    contactInterval = window.setInterval(function(){
        if(contactAngle == 360){
            contactAngle = 0;
        }

        rotate(contactAngle, "contact-img");
        contactAngle += 1;
    }, 10);
}

function rotate(degrees, id){
    $("#" + id).css(
        {
            '-webkit-transform' : 'rotate('+ degrees +'deg)',
            '-moz-transform' : 'rotate('+ degrees +'deg) ',
            '-ms-transform' : 'rotate('+ degrees +'deg) ',
            'transform' : 'rotate('+ degrees +'deg) '
        }
    );
}

function scroll(index){
	console.log(index);
	$(".main").moveTo(index);
}



