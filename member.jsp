<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>회원가입</title>
<link href="member.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
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
<body onLoad="regFrm.id.focus()">
<%@ include file="nav.jsp"%>

<div class="container right-panel-active">
  <!-- 회원 가입 -->
  <div class="container__form container--signup">
    <form name="regFrm" method="post" action="memberProc.jsp" class="form" id="form1">
      <h2 class="form__title">회원 가입</h2>
      <input type="text" name="id" placeholder="아이디" class="input" size="15"/>
      <!-- idCheck()로 유효성 검사 수행 -->
      <button type="button" class="btn" onclick="idCheck(this.form.id.value)">ID 중복 확인</button>
      <p class="form__description">아이디를 적어 주세요.</p>

      <input type="password" name="pwd" placeholder="패스워드" class="input" size="15"/>
      <p class="form__description">패스워드를 적어주세요.</p>

      <input type="password" name="repwd" placeholder="패스워드 확인" class="input" size="15"/>
      <p class="form__description">패스워드를 확인합니다.</p>

      <input type="text" name="name" placeholder="이름" class="input" size="15"/>
      <p class="form__description">이름을 적어주세요.</p>

      <div>
        성별:
        <label><input type="radio" name="gender" value="1" checked>남</label>
        <label><input type="radio" name="gender" value="2">여</label>
      </div>
      <p class="form__description">성별을 선택하세요.</p>

      <input type="text" name="birthday" placeholder="생년월일" class="input" size="6"/>
      <p class="form__description">생년월일를 적어 주세요. (ex: 830815)</p>

      <input type="text" name="email" placeholder="Email" class="input" size="30"/>
      <p class="form__description">이메일을 적어 주세요.</p>

      <div class="form__actions" align="center">
        <input type="submit" value="회원 가입" onClick="inputCheck()" class="btn">
        <input type="reset" value="다시 쓰기" class="btn">
        <input type="button" value="로그인" onClick="javascript:location.href='login.jsp'" class="btn">
      </div>
    </form>
  </div>
</div>


</body>
<%@ include file="footer.jsp"%>
</html>