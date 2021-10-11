<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ID Find Page</title>
<link href="css/loginstyle.css" rel="stylesheet" type="text/css">
<script src="js/loginJs.js" type="text/javascript"></script>
<script>
function aaaa(idName) {  // enter시 콘솔 이동코드 . ex)아이디 입력창에서 엔터하면 비밀번호버튼으로 콘솔 이동
    if (window.event.keyCode == 13) { 
      document.getElementById(idName).focus();
    }

}
function enterkey() { // enter시  자동으로 버튼이 눌러지는 경우를 배제하기 위한 코드. ex)아이디입력창에서 엔터시 비밀번호로 이동해야하지만 비밀번호찾기 버튼도 함께 눌러지는 경우 발생함. 
    var form = document.getElementById("IDFindForm");
    form.action = "memberIdfind.do";
    form.submit();
 }

  </script>
 <%
  String msg = request.getParameter("msg");
  
  if(msg.equals("-1")){
  %> 
  <script>
var msg = '<%=request.getParameter("msg")%>';
alert("존재하지 않는 이름입니다.");
</script>       
<%}   
  else if(msg.equals("0")){
%>        
<script>
var msg = '<%=request.getParameter("msg")%>';
alert("휴대폰번호를 확인해주세요");
</script>   
<%}else if(msg.equals("2")){
%>      
<script>
var msg = '<%=request.getParameter("msg")%>';
alert("로그인 해주세요");
</script>     
<% }%>
 
</head>
<body>

   <div class="login-page">
      <div class="form">
      	<form id="IDFindForm" action="memberIdfind.do" class="login-form" method = "post" >  <!-- 여기서 action은 id="PSFindform"로 인해 상단의 action이 실행된다. -->
            <input type="text" name = "user_name" placeholder="이름을 입력해 주세요" maxlength="20" onKeyup="aaaa('phone')" autofocus/> <!--onKeyup="aaaa('phone')"는 엔터시 phone입력창으로 콘솔 위치 지정  ,autofocus는 자동으로 현재 위치에 콘솔이 나타나도록 설정  -->
            <input type="text" name = "user_phone" id="phone" maxlength="11" placeholder="휴대폰 번호를 입력해 주세요 ('-' 제외)" onKeyup="aaaa('button')">
            <button>ID 찾기</button>
       <!-- <input type="button" id="button" style="cursor:pointer; background-color :#FFD700; color: #ffffff" onclick="enterkey()" value="ID 찾기" /> -->
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