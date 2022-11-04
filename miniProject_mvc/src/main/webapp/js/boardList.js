//$(function(){}); 파일이 열리자 마자
$(document).ready(function(){
	//DB에서 1페이지당 5개의 데이터를 가져오기
	$.ajax({
		url : '/miniProject_mvc/board/getBoardList.do',
		type: 'post',
		data : 'pg='+$('#pg').val(),
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			//alert(data.list[0].id);
			
			$.each(data.list,function(index,items){
				console.log(index, items.seq, items.id, items.name, items.subject);
				$('<tr/>').append($('<td/>',{align : 'center', text: items.seq}))
						  .append($('<td/>',{text: items.subject}))
						  .append($('<td/>',{align : 'center', text: items.id}))
						  .append($('<td/>',{align : 'center', text: items.hit}))
						  .append($('<td/>',{align : 'center', text: items.logtime})).appendTo($('#boardListTable'));
				
			});//$.each
		},
		error : function(err){
			console.log(err);
		}
	});
});