<%@page contentType="text/html; charset=UTF-8"%>
<%
	/* 세션에서 id값과 MemberLoginServlet.java 서블릿에서 로그인시 세션에 저장한 값을 가져옴.  */
		String id = (String)session.getAttribute("idKey");
		String msg = (String)session.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>PhotoBlog</title>

<%@include file="css/js_css.html"%>
<script type="text/javascript">
 		function check() {
 			if (document.frm.id.value.length<5) {
 				alert("아이디는 5자리 이상.");
 				document.frm.id.focus();
 				return;
 			}
 			if (document.frm.pwd.value.length<5) {
 				alert("비번은 5자리 이상.");
 				document.frm.pwd.focus();
 				return;
 			}
 			document.frm.submit();
 		}
 	</script>
</head>
<body style="background-color: black;">
	<div data-role="page">
		<%@include file="nav.jsp"%>
<div data-role="content"
    style="height: 650px; width: 1100px; display: flex; align-items: center; 
    background-image: url('img/ilust.gif'); background-size: cover; background-repeat: no-repeat;
    margin: auto;">
			<!-- 세션에서 가져온 id 값이 null이면 로그인 입력 폼을 실행함 -->
			<%if(id==null){ %>

			<form method="post" name="frm" action="pmemberLogin"
				style="border-left-width: 10px; padding-left: -; padding-left: 150px;">
					<h1>LOGIN</h1>
	 <p>
                        <label for="user_id">아이디:
                        	<input name="id">
                        </label>
                    </p>
                    <p>
                        <label for="user_password">비밀번호:
                        	<input type="password" name="pwd">
                        </label>
                    </p>
                    <input type="button"  value="로그인" onclick="check()">
                    <input type="button"  value="회원가입" onclick="location.href='pregister.jsp'">
                </form>
	</div>
	</div>


	 <!-- 로그인 실패시 보이는 메시지 -->
	<%if(msg!=null){%>
		<div align="center">
			<font color="red"><%=msg%></font>
		</div>
	<%}%>
	
<%}else{%>

 <!-- 로그인 성공이라면 회원의 이름과 프로필 사진을 보여줌 -->
<div class="post_form">
<table>
	<tr>
		<td><div class="box" style="background: #BDBDBD;">

	</div></td>
	</tr>
	<tr>
		<td colspan="2">
		    <a href="#" onclick="location.href='pupdate.jsp'">회원수정</a>&nbsp;&nbsp;
			<a href="#" onclick="location.href='logout.jsp'">로그아웃</a>&nbsp;&nbsp;
		   <a href="#" onclick="alert('준비중입니다');">포토블로그</a>
		 </td>
	</tr>
</table>
</div>
<% } %>
</div>
</body>
</html>









