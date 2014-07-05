var validQ = false;
var validA = false;
var validOptA = false;
var validOptB = false;
var validOptC = false;
var validOptD = false;
var validTitle = false;

function reset(type){
	validQ = false;
	validA = false;
	if(type == "MC"){
		validOptA = false;
		validOptB = false;
		validOptC = false;
		validOptD = false;
	}else if(type == "IMC"){
		validOptA = false;
		validOptB = false;
		validOptC = false;
		validOptD = false;
	}else if(type == "FIB"){

	}
	Qvalidate();
}

function verifyTitle(){
	var value = $('#title').val().trim();
	if(value){
		$.ajax({
			type: "GET",
			url: "check_title",
			data: {
				"title" : value
			},
			success: function(data) {
				if(data.valid){
					console.log("VALID");
					validTitle = true;
				}else{
					validTitle = false;
					console.log("INVALID");
				}
				Qvalidate();				
	        }
		});
	}else{
		validTitle = false;
		Qvalidate();
	}
}

function verifyQuestion(Qindex){
	var value = $('#question-' + Qindex).val().trim();
	if(value){
		validQ = true;
	}else{
		validQ = false;
	}

	Qvalidate();
}

function verifyAnswer(Qindex){
	var value = $('#answer-' + Qindex).val().trim();
	if(value){
		validA = true;
	}else{
		validA = false;
	}

	Qvalidate();
}

function verifyOptionA(Qindex){
	var value = $('#optionA-' + Qindex).val().trim();
	if(value){
		validOptA = true;
	}else{
		validOptA = false;
	}

	Qvalidate();
}

function verifyOptionB(Qindex){
	var value = $('#optionB-' + Qindex).val().trim();
	if(value){
		validOptB = true;
	}else{
		validOptB = false;
	}

	Qvalidate();
}

function verifyOptionC(Qindex){
	var value = $('#optionC-' + Qindex).val().trim();
	if(value){
		validOptC = true;
	}else{
		validOptC = false;
	}

	Qvalidate();
}

function verifyOptionD(Qindex){
	var value = $('#optionD-' + Qindex).val().trim();
	if(value){
		validOptD = true;
	}else{
		validOptD = false;
	}

	Qvalidate();
}

function Qvalidate(){
	var valid = validQ && validA && validOptA && validOptB && validOptC && validOptD;
	
	console.log(count);
	console.log(valid);
	
	if(validTitle){
		$('#submit').removeAttr('disabled');
	}else if(!validTitle){
		$('#submit').attr('disabled', "disabled");
	}

	if(valid){
		$('#type').removeAttr("disabled");
	}else if(!valid && count > 0){
		$('#type').attr("disabled", "disabled");
		$('#submit').attr('disabled', "disabled");
	}

	if(count > 0){
		$('#submit').show();
	}
}


