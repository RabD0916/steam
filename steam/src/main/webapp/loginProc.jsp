<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--① useBean 액션 태그로 MeberMgr 객체 생성. id(참조변수)는 mMgr. 입력하세요     -->
<jsp:useBean id="mMgr" class="steam.MemberMgr" />

<%
	  request.setCharacterEncoding("utf-8");

	  String u_id = request.getParameter("u_id");
	  String u_pwd = request.getParameter("u_pwd");
	  String url = "login.jsp";
	  String msg = "로그인에 실패 하였습니다.";
	  
	  /* ② MemberMgr의 lginMember 호출. 입력하세요 */
	 	  boolean result = mMgr.loginMember(u_id, u_pwd);
	  
	  if(result){
	    session.setAttribute("idKey",u_id);
	    msg = "로그인에 성공 하였습니다.";
	  }
%>
<script>
	alert("<%=msg%>");	
	location.href="<%=url%>";
</script>