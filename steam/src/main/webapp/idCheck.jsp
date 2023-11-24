<%@ page contentType="text/html; charset=utf-8" %>

<!-- ① useBean 액션 태그로 MemberMgr 객체를 생성하고, id(참조변수))는 mMgr로 지정 -->
<jsp:useBean id="mMgr" class="steam.MemberMgr" />

<%	
    request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
/* ②	id 중복 검사를 위해 MemberMgr 클래스에 있는 checkId() 메서드 호출 */
	boolean result=mMgr.checkId(id);

%>
<html>
<head>
<title>ID 중복체크</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br/><b><%=id%></b>
		<%
			if (result) {
				out.println("는 이미 존재하는 ID입니다.<p/>");
			} else {
				out.println("는 사용 가능 합니다.<p/>");
			}
		%>
		<a href="#" onClick="self.close()">닫기</a>
	</div>
</body>
</html>