function inputCheck(){
	if(document.regFrm.u_id.value==""){
		alert("아이디를 입력해주세요.");
		document.regFrm.u_id.focus();
		return;
	}
	if(document.regFrm.u_pwd.value==""){
		alert("비밀번호를 입력해주세요.");
		document.regFrm.u_pwd.focus();
		return;
	}
	if(document.regFrm.repwd.value==""){
		alert("비밀번호를 확인해주세요");
		document.regFrm.repwd.focus();
		return;
	}
	if(document.regFrm.u_pwd.value != document.regFrm.repwd.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.regFrm.repwd.value="";
		document.regFrm.repwd.focus();
		return;
	}
	if(document.regFrm.u_name.value==""){
		alert("이름을 입력해 주세요.");
		document.regFrm.u_name.focus();
		return;
	}
	if(document.regFrm.u_phone.value==""){
		alert("휴대번호 입력해 주세요.");
		document.regFrm.u_phone.focus();
		return;
	}
	if(document.regFrm.u_email.value==""){
		alert("이메일을 입력해 주세요.");
		document.regFrm.u_email.focus();
		return;
	}
	/*이메일 형식 검사 코드*/
    var str=document.regFrm.u_email.value;	   
    var atPos = str.indexOf('@');
    var atLastPos = str.lastIndexOf('@');
    var dotPos = str.indexOf('.'); 
    var spacePos = str.indexOf(' ');
    var commaPos = str.indexOf(',');
    var eMailSize = str.length;
    if (atPos > 1 && atPos == atLastPos && 
	   dotPos > 3 && spacePos == -1 && commaPos == -1 
	   && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
    else {
          alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
	      document.regFrm.u_email.focus();
		  return;
    }
   	

	document.regFrm.submit();
}

function win_close(){
	self.close();
}