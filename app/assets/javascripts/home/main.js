var storyAngle = 0;
var contactAngle = 0;
var storyInterval;
var contactInterval;

$(document).ready(function(){
	
    setupOnePageScroll()
    
    $("#story-img").hover(function(){
        
        console.log("In Hover Story");
        window.clearInterval(storyInterval);
        $("#story-info").show("slide", { direction: "down" }, 1000);

    }, function(){
        setStoryInterval();
        $('#story-info').hide("slide", { direction: "down" }, 1000);  
    });

    $("#contact-img").hover(function(){
        
        window.clearInterval(contactInterval);
        $("#contact-info").show("slide", { direction: "down" }, 1000);
    
    }, function(){
        setContactInterval();
        $('#contact-info').hide("slide", { direction: "down" }, 1000);
    });

    setStoryInterval();
    setContactInterval();

    setupFlipbook();

    $('#story-info').hide();
    $('#contact-info').hide();
});

function setupOnePageScroll(){
    $('.main').fullpage({
        scrollingSpeed: 1000,
        easing: 'swing',
        loopBottom: true,
        anchors: ['#1', '#2', '#3', '#4'],
        menu: "#menu"
    });
}

function navClick(value){
    console.log(this.value);
    $(".main").jumpTo(value);
}

function setupFlipbook(){
    $("#flipbook").turn({
        width: "100%",
        height: 500,
        autoCenter: true,
        elevation: 10
    });

    $("#flipbook").turn("page",3);
}

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
            '-webkit-transform' : 'translate(0%, -50%) rotate('+ degrees +'deg)',
            '-moz-transform' : 'translate(0%, -50%) rotate('+ degrees +'deg)',
            '-ms-transform' : 'translate(0%, -50%) rotate('+ degrees +'deg)',
            'transform' : 'translate(0%, -50%) rotate('+ degrees +'deg)'
        }
    );
}

function slideUp(degrees, id){
    /*$("#" + id).css(
        {
            '-webkit-transform' : 'translate(0%, -100%) rotate('+ degrees +'deg)',
            '-moz-transform' : 'translate(0%, -100%) rotate('+ degrees +'deg)',
            '-ms-transform' : 'translate(0%, -100%) rotate('+ degrees +'deg)',
            'transform' : 'translate(0%, -100%) rotate('+ degrees +'deg)'
        }
    );*/
}

function scroll(index){
	console.log(index);
	$(".main").moveTo(index);
}



