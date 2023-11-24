<%@ page contentType="text/html; charset=utf-8" %>
<jsp:useBean id="mMgr" class="steam.PMemberMgr" />
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("user_num");
	boolean result = mMgr.checkId(id);
%>
<html>
<head>
<title>ID 중복체크</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br /> <b><%=id%></b>
		<%
			if (result) {
				out.println("는 이미 존재하는 ID입니다.<p>");
			} else {
				out.println("는 사용 가능 합니다.<p>");
			}
		%>
		<a href="#" onClick="self.close()">닫기</a>
	</div>
</body>
</html>