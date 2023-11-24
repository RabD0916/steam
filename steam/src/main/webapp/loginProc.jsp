<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--① useBean 액션 태그로 MeberMgr 객체 생성. id(참조변수)는 mMgr. 입력하세요     -->
<jsp:useBean id="mMgr" class="steam.MemberMgr" />

<%
	  request.setCharacterEncoding("utf-8");

	  String id = request.getParameter("id");
	  String pwd = request.getParameter("pwd");
	  String url = "login.jsp";
	  String msg = "로그인에 실패 하였습니다.";
	  
	  /* ② MemberMgr의 lginMember 호출. 입력하세요 */
	 	  boolean result = mMgr.loginMember(id, pwd);
	  
	  if(result){
	    session.setAttribute("idKey",id);
	    msg = "로그인에 성공 하였습니다.";
	  }
%>
<script>
	alert("<%=msg%>");	
	location.href="<%=url%>";
</script>