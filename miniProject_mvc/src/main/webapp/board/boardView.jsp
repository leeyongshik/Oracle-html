
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" cellpadding="5" frame="hsides" rules="rows" width="500">
	<tr>
		<td height="20px" colspan="3">
			<h2><span id="subjectSpan"></span></h2>
		</td>
	</tr>
	<tr>
		<td width="150px" align="center">글번호 : <span id="seqSpan"></span></td>
		
		<td width="200px" align="center">작성자 : <span id="idSpan"></span></td>
		
		<td width="150px" align="center"> 조회수 : <span id="hitSpan"></span></td>
		
	</tr>
	<tr>
		<td colspan="3" height="200px" valign="top">
			<div style="width: 100%; height: 100%; overflow: auto;">
			<pre style="white-space: pre-wrap; word-break:break-all;"><span id ="contentSpan"></span></pre>
			</div>
		</td>
	</tr>

</table>
<br>
<input type="button" value="목록" onclick="location.href='/miniProject_mvc/board/boardList.do?pg=${pg}'">
<span id="boardViewSpan">
	<input type="button" value="수정" onclick="location.href='/miniProject_mvc/board/boardUpdateForm.do?seq=${seq}&pg=${pg}'"/>
	<input type="button" value="삭제" id="deleteBtn"/>
</span>

<input type="hidden" id="id" value="${id}">
<input type="hidden" id="pg" value="${pg}">
<input type="text" id="seq" value="${seq}">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="../js/boardView.js"></script>
<script type="text/javascript">
$('#deleteBtn').click(function(){
	if(confirm("정말로 삭제하시겠습니까?")){
		$.ajax({
			url : '/miniProject_mvc/board/boardDelete.do',
			type : 'post',
			data : 'seq='+$('#seq').val(),
			success: function(){
					alert("글 삭제 성공");
					location.href = '/miniProject_mvc/board/boardList.do?pg=1';
				},
				error : function(err){
					console.log(err);
				}
		});
	}
	
});  
/* $('#deleteBtn').click(function(){
	if(confirm("정말로 삭제 하시겠습니까?")){
		$('#boardViewForm').attr('action','/miniProject_mvc/board/board~~~.do');
		$('#boardViewForm').submit();
	}
}); */
</script>
</body>
</html>