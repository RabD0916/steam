<%@ page contentType="text/html; charset=utf-8" %>
<%
	  request.setCharacterEncoding("utf-8");

     /*  ① 세션에 저장되어 있는 'idKey' 키 값을 반환. 로그인하지 않았다면 null값 반환. 입력하세요 */
	 String u_id = (String)session.getAttribute("idKey");
     
%>
<html>
<head>
<title>로그인</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function loginCheck() {
		if (document.loginFrm.u_id.value == "") {
			alert("아이디를 입력해 주세요.");
			document.loginFrm.u_id.focus();
			return;
		}
		if (document.loginFrm.u_pwd.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.loginFrm.u_pwd.focus();
			return;
		}
		document.loginFrm.submit();
	}
</script>
</head>
<body bgcolor="#ffffcc">
<div align="center"><br/><br/>
		<%if (u_id != null) {%>
		<b><%=u_id%></b>님 환영 합니다.
		<p>제한된 기능을 사용 할 수가 있습니다.<p/>
			<a href="logout.jsp">로그아웃</a>
			<%} else {%>
		<form name="loginFrm" method="post" action="loginProc.jsp">
			<table>
				<tr>
					<td align="center" colspan="2"><h4>로그인</h4></td>
				</tr>
				<tr>
					<td>아 이 디</td>
					<td><input name="u_id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="u_pwd"></td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="right">
							<input type="button" value="로그인" onclick="loginCheck()">&nbsp;
							<input type="button" value="회원가입" onClick="javascript:location.href='member.jsp'">
						</div>
					</td>
				</tr>
			</table>
		</form>
		<%}%>
	</div>
</body>
</html>