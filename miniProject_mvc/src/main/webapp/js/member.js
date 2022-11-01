function checkWrite() {
	document.getElementById("nameDiv").innerText="";
 	document.getElementById("idDiv").innerText="";
	document.getElementById("pwdDiv").innerText="";
	document.getElementById("repwdDiv").innerText=""; 
	
	if(document.getElementById("name").value=="") document.getElementById("nameDiv").innerText="이름을 입력하세요.";
	else if(document.getElementById("id").value=="") document.getElementById("idDiv").innerText="아이디를 입력하세요.";
	else if(document.getElementById("pwd").value=="") document.getElementById("pwdDiv").innerText="비밀번호를 입력하세요.";
	else if(document.getElementById("repwd").value=="") document.getElementById("repwdDiv").innerText="재확인을 입력하세요.";
	else if(document.getElementById("pwd").value != document.getElementById("repwd").value) document.getElementById("repwdDiv").innerText="비밀번호와 재확인이 다릅니다.";
	else if(document.writeForm.id.value != document.writeForm.check.value) document.getElementById("idDiv").innerText="중복체크 하세요";
	//else if(count===0) alert("중복확인을 하세요.");
	else document.writeForm.submit();
}

//#중복 아이디 체크
$('#id').focusout(function(){
	if($('#id').val() == '') {
		$('#idDiv').text('먼저 아이디를 입력하세요.');
		$('#idDiv').css('color', 'magenta');
	}else{
		//서버로 요청하고 제자리로 돌아와라
		$.ajax({
			url : 'http://localhost:8080/miniProject_mvc/member/checkId.do', // 서버 주소
			type : 'post', // get or post
			data : 'id='+$('#id').val() , //서버로 보낼 데이터
			dateType : 'text', // 서버로부터 받을 데이터 자료형 text, html, xml, json
			success : function(data){
				data = data.trim();
				
				if(data == 'exist'){
					$('#idDiv').text('사용 불가능');
					$('#idDiv').css('color','red');
				} else if (data == 'non_exist'){
					$('#idDiv').text('사용 가능');
					$('#idDiv').css('color','blue');
					
					$('input[name="check"]').val($('#id').val());
				}
			},
			error : function(){}
		});//$.ajax
	}
});
