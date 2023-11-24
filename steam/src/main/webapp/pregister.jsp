<%@page contentType="text/html; charset=utf-8"%>
<%
     /* PMemberPostServlet.java에서 가입시 전달되는 메시지를 세션에서 리턴 */
		String msg = (String)session.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>PhotoBlog</title>
	
	<!-- 화면 구성에 필요한 jquery와 css로 구성된 파일을 include 지시자로 가져옴 -->
	
	<script type="text/javascript">
 		function register() {
			document.frm.submit();
		} 		
 		
 	</script>
</head>
<body>
<script>
	function register(){
		var form = document.frm;
		if (form.u_id.value ==""){
			alert("아이디는 필수입력입니다");
			form.u_id.focus();// 커서가 되게
			return false;
		}else if(form.u_id.value.length <5){
			alert("아이디는 5자리이상이어야합니다")
			form.u_id.select();
			return;
		}else if (form.u_pwd.value ==""){
			alert("비밀번호는 필수입력입니다");
			form.u_pwd.focus();// 커서가 되게
			return false;
		}else if (form.u_pwd.value <8){
			alert("비밀번호는 8자리이상이어야합니다");
			form.u_pwd.focus();// 커서가 되게
			return false;
		}
		form.submit();
	}
</script>
<div data-role="page">
	<div data-role="content">
	<h1>PMember Register</h1>
    	<form method="post" name="frm" action="pmemberPost" enctype="multipart/form-data" class="post_form">
           <p>
               <label for="user_id">아이디:
                   <input name="u_id">
                       </label>
                   </p>
           <p>
               <label for="user_email">이메일:
                   <input name="u_email">
                       </label>
                   </p>
                   <p>
                      <label for="user_name">이름:
                        <input name="name">
                       </label>
                   </p>
                   <p>
                       <label for="user_password">비밀번호:
                        <input type="password" name="u_pwd">
                       </label>
                   </p>
                   <p>
                     <label for="user_phone">번호:
                      <input name="u_phone">
                    </label>
                 </p>
                <input type="button"  value="회원가입" onclick="register()">
                 <%if(msg!=null){%>
				<div align="center"><font color="red"><%=msg%></font></div>
				<%}%>    
    	</form>
	</div>
	
	<!-- 모든 화면의 하단을 담당하는 foot.jsp를 include 지시자로 가져옴 -->
</div>
</body>
</html>