<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Password Find Page</title>
<link href="css/loginstyle.css" rel="stylesheet" type="text/css">
<script src="js/loginJs.js" type="text/javascript"></script>
</head>
<body>

   <div class="login-page">
      <div class="form">
         <table width="400px" style="margin-top:3%" >
                  <% String stNo = (String)request.getAttribute("stNo"); 
                System.out.println(stNo);%>
             <tr>
                        찾으시는 비밀번호는 <br>
                        " <%= stNo %> " 입니다.
             </tr>
      </table>
            <p class="message"><a href="memberloginForm.do">로그인</a></p>
            <p class="message"><a href="memberIdfindForm.do">아이디 찾기</a></p>
            <p class="message"><a href="index.jsp">메인화면</a>
            </p>
      </div>
   </div>
</body>
</html>
