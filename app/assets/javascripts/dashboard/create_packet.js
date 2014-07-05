var index = 0;
var count = 0;
$(document).ready(function() { $('#submit').hide(); });

function createQuestion(){
	$('#submit').show();
	var qType = $('#type').val();
	if(qType == "Multiple Choice"){
		qType = "MC";
	}else if(qType == "Image Multiple Choice"){
		qType = "IMC";
	}else if(qType == "Fill in the Blank"){
		qType = "FIB";
	}

	$.ajax({
		type: "GET",
		url: "render_question",
		data: {
				"type" : qType,
				"index": index
			},
		success: function(data) {
			$('#question-form').append(data.html);
			index = index + 1; 
        }
	});

	$("#type").val(0);
	count = count + 1;
	reset(qType);

	$('#submit').show();
	
}

function deleteQuestion(Qindex){
	$('#question-id-'+ Qindex).remove();
	if(index == Qindex){
		console.log("DELETE LAST QUESTION");
	}
	count = count - 1;
}