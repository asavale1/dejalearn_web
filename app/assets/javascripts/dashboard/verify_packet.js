
function fullVerify(){
	var tValid = textVerify();

	if(tValid){
		$('#submit').removeAttr('disabled');
	}else{
		$('#submit').attr('disabled', "disabled");
	}
}

function textVerify(){
	var valid = true;

	$('.field').map(function(index) {
	    if(!$(this).val().trim()){
	    	valid = false;
	    }
	});

	var questions = $('.types').length;
	var iter = 0;

	$('.answers').map(function(index){
		if(this.value.trim()){
			iter = iter + 1;
		}
	});
	if(iter!=questions){
		valid = false;
	}

	if(!(questions > 0)){
		$('#submit').hide();
		valid = false;
	}else{
		$('#submit').show();
	}

	return valid;
}

function imageVerify(){
	$('.field').map(function(index) {
	    if(!$(this).val().trim()){
	    	valid = false;
	    }
	});
}

function selectImageVerify(index){
	console.log("selectImageVerify");
	//$('#urlImage-'+index)
}

function urlImageVerify(){
	console.log("urlImageVerify");
}



