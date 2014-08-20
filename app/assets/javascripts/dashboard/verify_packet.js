function fullVerify(){
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

	if(valid){
		$('#submit').removeAttr('disabled');
	}else{
		$('#submit').attr('disabled', "disabled");
	}
}


