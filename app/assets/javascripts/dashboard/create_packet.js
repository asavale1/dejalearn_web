var index = 0;

function createQuestion(){
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

	$("#type option[value='Add Question']").attr("selected", "selected");
}