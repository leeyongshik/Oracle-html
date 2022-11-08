<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>글수정</h3>
<form id="boardUpdateForm" name="boardUpdateForm">
<input type="text" name ="seq" id="seq" value="${seq}">
<input type="text" name ="pg" id="pg" value="${pg}">
	<table border="1">
		<tr>
			<td width="80" align="center">제목</td>
			<td width="150">
				<input type="text" name="subject" id="subject" style="width: 250px;">
				<div id="subjectDiv"></div>
			</td>
		</tr>
		<tr>
			<td align="center">내용</td>
			<td>
				<textarea cols="30" rows="15" name="content" id="content"></textarea>
				<div id="contentDiv"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="글수정" id="boardUpdateBtn">
				<input type="reset" value="다시작성" onclick="location.reload()">
			</td>
			
		</tr>
	
	</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

$(function(){
	$.ajax({
		url : '/miniProject_mvc/board/getBoardUpdate.do',
		type:'post',
		data : 'seq='+$('#seq').val(),
		dataType : 'json', /* text, html, json, xml  */
		success : function(data){
			//alert(JSON.stringify(data));
			$('#subject').val(data.subject);
			$('#content').val(data.content);
			
		},
		error: function(err){
			console.log(err);
		}
	});
});







$('#boardUpdateBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	if($('#subject').val() == ''){
			$('#subjectDiv').text('제목을 입력하세요.');
			$('#subject').focus;
	}else if($('#content').val() == ''){
			$('#contentDiv').text('내용를 입력하세요.');
			$('#content').focus;
	}else{
		
		$.ajax({
			url : '/miniProject_mvc/board/boardUpdate.do',
			type : 'post',
			data : $('#boardUpdateForm').serialize(),// 주소창과 같이 데이터 담기
			success: function(){
					alert("글수정 완료");
					location.href = '/miniProject_mvc/board/boardView.do?seq='+$('#seq').val()+'&pg='+$('#pg').val();
				},
				error : function(err){
					console.log(err);
				}
		});
		
	}
});
</script>
</body>
</html>