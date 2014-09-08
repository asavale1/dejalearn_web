function setIMCAnswer(index){
	answer = $("input[name='option-" + index + "']:checked").val();
	$('#answer-' + index).val(answer);

	fullVerify();
}

function selectImageUpload(index, elem){
	var file = elem.files[0];
	var reader = new FileReader();
	reader.onload = function(e){
		$('#imc-image-box-'+index).empty();
		$('<img style="width: 200px; height: 200px;">').attr('src', e.target.result).appendTo('#imc-image-box-'+index);
	};
	reader.readAsDataURL(file);

	$('#urlImage-' + index).val("");
	fullVerify();
}

function urlImageUpload(index){
	var url = $('#urlImage-'+index).val();
	$('#selectImage-'+index).val('');

	$('#imc-image-box-'+index).empty();
	$('<img style="width: 200px; height: 200px;">').attr('src', url).appendTo('#imc-image-box-'+index);
	fullVerify();

}