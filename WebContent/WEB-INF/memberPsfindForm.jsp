<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Password Find Page</title>
<link href="css/loginstyle.css" rel="stylesheet" type="text/css">
<script src="js/loginJs.js" type="text/javascript"></script>
<script>
function test(value) { // javascript 타입 , 한글 제약조건 
    var regNumber = /^[0-9a-zA-Z-]+$/; //0~9까지 숫자,a~z까지 소문자,A~Z까지 대문자만 사용
    pattern = eval(regNumber);
    if(value.length > 0 && pattern.test(value) == false) {
       var idEle = document.getElementById("id");
       idEle.value = "";
       idEle.focus();
       alert("한글과 특수문자는 사용할 수 없습니다.");
    };
 }
 
function aaaa(idName) { // enter시 콘솔 이동코드 . ex)아이디 입력창에서 엔터하면 비밀번호버튼으로 콘솔 이동
    if (window.event.keyCode == 13) { 
      document.getElementById(idName).focus();
    }

}

function enterkey() { // enter시  자동으로 버튼이 눌러지는 경우를 배제하기 위한 코드. ex)아이디입력창에서 엔터시 비밀번호로 이동해야하지만 비밀번호찾기 버튼도 함께 눌러지는 경우 발생함. 
    var form = document.getElementById("PSFindform");
    form.action = "memberPsfind.do";
    form.submit();
 }
</script>
<%
  String msg = request.getParameter("msg");
  
  if(msg.equals("-1")){
  %> 
  <script>
var msg = '<%=request.getParameter("msg")%>';
alert("아이디나 이름을 확인해주세요");
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
      	<form id="PSFindform" action="memberPsfind.do" class="login-form" method = "post" > <!-- 여기서 action은 id="PSFindform"로 인해 상단의 action이 실행된다. -->
      		<input type="text" name = "id" onblur="test(this.value)" id="id" maxlength="16" placeholder="ID를 입력해 주세요" onKeyup="aaaa('name')"/> <!-- onKeyup="aaaa('name')"는 엔터시 name입력창으로 콘솔 위치 지정 -->
            <input type="text" name = "user_name" id="name" maxlength="20" onKeyup="aaaa('phone')" placeholder="이름을 입력해 주세요" />
            <input type="text" name = "user_phone" id="phone" maxlength="11" placeholder="휴대폰 번호를 입력해 주세요 ('-' 제외)" onKeyup="aaaa('button')"/>
        <input type="button" id="button" style="cursor:pointer; background-color :#FFD700; color: #ffffff" onclick="enterkey()" value="패스워드 찾기" />
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