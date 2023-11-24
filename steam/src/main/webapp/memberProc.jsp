<%@ page contentType="text/html; charset=utf-8" %>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="mMgr" class="steam.PMemberMgr"/>
<jsp:useBean id="mBean" class="steam.PMemberBean"/>
<jsp:setProperty  name="mBean" property="*"/>
<%
	  boolean result = mMgr.insertMember(mBean);
	  if(result){
%>
<script type="text/javascript">
		alert("회원가입을 하였습니다.");
		location.href="./index.jsp";
</script>
<% }else{%>
<script type="text/javascript">
		alert("회원가입에 실패 하였습니다.");
		history.back();
</script>
<%} %>