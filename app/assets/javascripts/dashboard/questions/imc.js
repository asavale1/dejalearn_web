function setIMCAnswer(index){
	answer = $("input[name='option-" + index + "']:checked").val();
	$('#answer-' + index).val(answer);

	verifyAnswer(index);
}