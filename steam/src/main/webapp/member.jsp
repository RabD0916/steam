<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>회원가입</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
	function idCheck(id) {
		frm = document.regFrm;
		if (id == "") {
			alert("아이디를 입력해 주세요.");
			frm.id.focus();
			return;
		}
	/* ① id 중복 체크로 아이디 값과 함께 열리도록. 입력하세요. */
	url = "idCheck.jsp?id=" +id;
		
	
		window.open(url, "IDCheck", "width=300,height=150");	}

	
</script>
</head>
<body bgcolor="#FFFFCC" onLoad="regFrm.id.focus()">
	<div align="center">
		<br /><br />
		<form name="regFrm" method="post" action="memberProc.jsp">
			<table cellpadding="5">
				<tr>
					<td bgcolor="#FFFFCC">
						<table border="1" cellspacing="0" cellpadding="2" width="600">
							<tr bgcolor="#996600">
								<td colspan="3"><font color="#FFFFFF"><b>회원 가입</b></font></td>
							</tr>
							<tr>
								<td width="20%">아이디</td>
								<td width="50%">
									<input name="u_id" size="15">
                                    	<!-- idCheck()로 유효성 검사 수행 -->
									<input type="button" value="ID중복확인" onClick="idCheck(this.form.id.value)">
								</td>
								<td width="30%">아이디를 적어 주세요.</td>
							</tr>
							<tr>
								<td>패스워드</td>
								<td><input type="password" name="u_pwd" size="15"></td>
								<td>패스워드를 적어주세요.</td>
							</tr>
							<tr>
								<td>패스워드 확인</td>
								<td><input type="password" name="repwd" size="15"></td>
								<td>패스워드를 확인합니다.</td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input name="u_name" size="15">
								</td>
								<td>이름을 적어주세요.</td>
							</tr>
							<tr>
							</tr>
							<tr>
								<td>휴대번호</td>
								<td><input name="u_phone" size="6">
									ex)01012345678</td>
								<td>휴대번호를 적어 주세요.</td>
							</tr>
							<tr>
								<td>Email</td>
								<td><input name="u_email" size="30">
								</td>
								<td>이메일를 적어 주세요.</td>
							</tr>							
							
							
							<tr>
								<td colspan="3" align="center">
								   <input type="submit" value="회원가입" onClick="inputCheck()"> &nbsp; &nbsp; 
								    <input type="reset" value="다시쓰기">
								    &nbsp; &nbsp; 
								    <input type="button" value="로그인" onClick="javascript:location.href='login.jsp'">
								 </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>