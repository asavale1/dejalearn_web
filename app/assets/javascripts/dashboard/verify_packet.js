
function fullVerify(){
	var tValid = textVerify();
	var iValid = imageVerify();
	
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
	var imgArray = $(".image-field");
	var pairArray = [];
	for(var i = 0; i<imgArray.length; i = i + 2){
		pairArray[pairArray.length] = new imagePair(imgArray[i], imgArray[i + 1]);
	}

	var iValid = true;
	for(var i = 0; i < pairArray.length; i++){
		if(!pairArray[i].select.value && !pairArray[i].url.value){
			iValid = false;
		}	
	}
	return iValid;
}

function imagePair(select, url){
	this.select = select;
	this.url = url;
}

