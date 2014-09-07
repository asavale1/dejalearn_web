var index = 0;
var count = 0;
$(document).ready(function() { 
	$('#submit').hide(); 
});

function createQuestion(qType){
	$('#submit').show();

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

	$('#type').val("Add Question");
	count = count + 1;
	$('#submit').attr('disabled', "disabled");

	$('#submit').show();
	
}

function deleteQuestion(Qindex){
	$('#question-id-'+ Qindex).remove();
	if(index == Qindex){
		console.log("DELETE LAST QUESTION");
	}
	fullVerify();
	count = count - 1;
}

function setCount(){
	$('#count').val(count);
	return;
}
