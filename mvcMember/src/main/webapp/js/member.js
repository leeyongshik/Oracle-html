
	
	
	
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

function checkId(){
	
	var sId = document.getElementById("id").value;
	document.getElementById("idDiv").innerText="";
	if  (document.getElementById("id").value=="")
	//document.getElementById("idDiv").innerText="먼저 아이디를 입력하세요.";
	document.getElementById("idDiv").innerHTML="<font color='magenta'>먼저 아이디를 입력하세요.</font>";
	else 
		window.open("/mvcMember/member/checkId.do?id="+sId,"checkId","width =500 height=300 left=500 top=200")
}
function countReset(){
	count =0;
}