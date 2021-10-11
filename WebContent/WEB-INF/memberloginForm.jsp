<%@page import="kr.ac.knu.entity.MemberEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login page</title>
<link href="css/loginstyle.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script src="js/loginJs.js" type="text/javascript"></script>
<!-- 로그인 메시지 전달  로그인 메시지 전달  로그인 메시지 전달  로그인 메시지 전달  로그인 메시지 전달  로그인 메시지 전달  -->
<script src="js/loginJs.js" type="text/javascript"></script>
 <%
       MemberEntity member = 
         (MemberEntity)session.getAttribute("member");//jsp 
      
         String msg = request.getParameter("msg");
         
         if(msg.equals("-1")){
         %>
<script>
   var msg = '<%=request.getParameter("msg")%>';
   alert("존재하지 않는 아이디입니다.");
</script>       
<%}   
         else if(msg.equals("0")){
%>        
 <script>
   var msg = '<%=request.getParameter("msg")%>';
   alert("비밀번호를 확인해주세요");
</script>   
   <%}else if(msg.equals("2")){
   %>      
<script>
   var msg = '<%=request.getParameter("msg")%>';
   alert("로그인 해주세요");
</script>     
<% }%>
<script>

<!-- 로그인 메시지 전달  로그인 메시지 전달  로그인 메시지 전달  로그인 메시지 전달  로그인 메시지 전달  로그인 메시지 전달  -->
<script>
function test(value) { // javascript 타입 , 한글 제약조건 
   var regNumber = /^[0-9a-zA-Z-]+$/;
   pattern = eval(regNumber);
   if(value.length > 0 && pattern.test(value) == false) {
      var idEle = document.getElementById("id");
      idEle.value = "";
      idEle.focus();
      alert("한글과 특수문자는 사용할 수 없습니다.");
   };
}

function aaaa(idName) { // enter를 누르면 다음 버튼으로 넘어가는 기능  ex)아이디 입력창에서 엔터하면 비밀번호버튼으로 콘솔 이동
    if (window.event.keyCode == 13) { 
      document.getElementById(idName).focus();
    }

}
function enterkey() {  // enter시 자동으로 버튼이 눌러지는 경우를 배제하기 위한 코드. ex)아이디입력창에서 엔터시 비밀번호로 이동해야하지만 비밀번호찾기 버튼도 함께 눌러지는 경우 발생함. 
                       // 하지만 이 페이지에서는 input이 아닌 button을 사용하여 이코드가 실행되지는 않음. 그래서 하단의 form에 「action ="memberlogin.do"」을 두어, 엔터 누를시 바로 action이 실행 
    var form = document.getElementById("loginForm");
    form.action = "memberlogin.do";
    form.submit();
 }
</script>
</head>
<body>
   <div class="login-page">
      <div class="form">
       <form id="loginForm" class="login-form" action = "memberlogin.do" method = "post" > <!-- id="loginForm"를 통해서 상단의 form.action = "memberlogin.do";을 실행 -->
            <input type="text" name = "id" placeholder="ID" onblur="test(this.value)" id="id" maxlength="16" onKeyup="aaaa('pw')" autofocus/>
            <input type="password" name = "pw" placeholder="Password" id="pw" maxlength="20"/>         
           <!--  <input type="button" style="background-color :#FFD700; color: #ffffff" onclick="enterkey()" value="Login" />
            -->	<button>Login</button>
         </form>
            <p class="message">회원이 아니신가요?<a href="memberInsertForm.do">회원가입</a></p>
            <p class="message"><a href="memberIdfindForm.do">ID 찾기</a> / 
            <a href="memberPsfindForm.do">비밀번호 찾기</a></p>
            <p class="message"><a href="index.jsp">메인화면</a>
            </p>
      </div>
   </div>
</body>
</html>
