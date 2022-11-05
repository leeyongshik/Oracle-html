//회원가입
$('#writeBtn').click(function(){
	$('#nameDiv').empty();
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	
	if($('#name').val() == ''){
			$('#nameDiv').text('이름을 입력하세요.');
			$('#name').focus;
	}else if($('#id').val() == ''){
			$('#idDiv').text('아이디를 입력하세요.');
			$('#id').focus;
	}else if($('#pwd').val() == ''){
			$('#pwdDiv').text('비밀번호를 입력하세요.');
			$('#pwd').focus;
	}else if($('#repwd').val() == ''){
			$('#repwdDiv').text('재확인을 입력하세요.');
			$('#repwd').focus;
	}else if($('#pwd').val() != $('#repwd').val()){
		$('#pwdDiv').text('비밀번호와 재확인이 다릅니다.');
	}else if($('#id').val() != $('#check').val()){
		$('#idDiv').text('아이디 중복체크를 하세요.');
		$('#id').focus;
	} else{
		
		$.ajax({
			url : '/miniProject_mvc/member/write.do',
			type : 'post',
			data : $('#writeForm').serialize(),// 주소창과 같이 데이터 담기
			success: function(){
					alert("회원가입 성공");
					location.href = '/miniProject_mvc/index.jsp';
				},
				error : function(err){
					console.log(err);
				}
		});
		
	}
});


//#중복 아이디 체크
$('form[name="writeForm"] #id').focusout(function(){
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



//회원 정보 수정
$('#updateBtn').click(function(){
	$('#nameDiv').empty();
	$('#pwdDiv').empty();
	
	if($('#name').val() == ''){
			$('#nameDiv').text('이름을 입력하세요.');
			$('#name').focus;
	}else if($('#pwd').val() == ''){
			$('#pwdDiv').text('비밀번호를 입력하세요.');
			$('#pwd').focus;
	}else if($('#repwd').val() == ''){
			$('#repwdDiv').text('재확인을 입력하세요.');
			$('#repwd').focus;
	}else if($('#pwd').val() != $('#repwd').val()){
		$('#pwdDiv').text('비밀번호와 재확인이 다릅니다.');
	}else{
		
		$.ajax({
			url : '/miniProject_mvc/member/update.do',
			type : 'post',
			data : $('#updateForm').serialize(),// 주소창과 같이 데이터 담기
			success: function(){
					alert("회원정보 수정 성공");
					location.href = '/miniProject_mvc/index.jsp';
				},
				error : function(err){
					console.log(err);
				}
		});
		
	}
});
