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
						  .append($('<td/>',{})
						  		.append($('<a/>',{href:'#', text: items.subject, class:'subjectA'})))
						  .append($('<td/>',{align : 'center', text: items.id}))
						  .append($('<td/>',{align : 'center', text: items.hit}))
						  .append($('<td/>',{align : 'center', text: items.logtime})).appendTo($('#boardListTable'));
				
			});//$.each
			// 페이징 처리 
			$('#pagingDiv').html(data.pagingHTML);
			
			
			$('.subjectA').click(function(){
				
				//로그인 여부
				if($('#id').val()=='')
					alert('먼저 로그인하세요.');
				else {
				var seq = $(this).parent().prev().text();
				
				//alert($(this).parent().prev().text());
				location.href = '/miniProject_mvc/board/boardView.do?seq='+seq+"&pg="+$('#pg').val();
				}
			});
		},
		error : function(err){
			console.log(err);
		}
	});
});

