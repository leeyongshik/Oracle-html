$(document).ready(function(){
	
	$.ajax({
		url : '/miniProject_mvc/board/getBoardView.do',
		type: 'post',
		data : 'seq='+$('#seq').val(),
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			//alert(data.list[0].id);
			
			$('#subjectSpan').text(data.subject);
			$('#seqSpan').text(data.seq);
			$('#idSpan').text(data.id);
			$('#hitSpan').text(data.hit);
			$('#contentSpan').text(data.content);
			
			if(data.id == $('#id').val()){
				$('#boardViewSpan').show();
			}else{
				$('#boardViewSpan').hide();
			}
		},
		error : function(err){
			console.log(err);
		}
	});
});