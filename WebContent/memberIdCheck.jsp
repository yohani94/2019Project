<%@page import="kr.ac.knu.entity.MemberEntity"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ID 찾기</title>
<script>
   function test(value) { // javascript 타입 , 한글 제약조건 
   
      var form = document.getElementById("myForm");
      var value = form.id.value;
      
      var regNumber = /^[0-9a-zA-Z-]+$/; //0~9까지 숫자,a~z까지 소문자,A~Z까지 대문자만 사용
      pattern = eval(regNumber);
      
      if(value.length > 0 && pattern.test(value) == false) {
           form.id.value = "";
           form.id.focus();
           alert("한글과 특수문자는 사용할 수 없습니다.");
           
           return false;
           
      } else {  // 제대로 입력되었으면 아래 action을 실행하여 중복체크 실행
      
         form.action = "memberIdCheck.do";
         form.submit();
      }
   }
   
   function putValue(id) { // 중복체크 창에서 ID 적용버튼. 적용 버튼 누를시 창꺼지고 회원가입창에 ID정보 입력.

   opener.document.getElementById("frontId").value = id; 
      opener.document.getElementById("id").value = id; 
      
      window.close();
   }
</script>
</head>
<body>
<%
   String id = request.getParameter("id");
   String stNo = (String)request.getAttribute("stNo");
%>
<%
   if( id == null || id.length() == 0 ) {
%>
    아이디를 검색하세요.<br/>
   <font size="2px" color="green">아이디는 최소 4자리 입니다.</font>
   <br/>
    <form id="myForm" method="post">
       <input type="text" name="id" id="id" maxlength="16" autofocus/>
       <input type="submit" onclick="test()" value="확인"><!-- submit은 정보를 보낼때 실행된다. button으로 했을때는 안먹음 --> 
       <input type="button" value="취소" onclick="window.close()" ><br>
    </form>

<%
   } else {
      if( stNo != null ) {
%>
        <font color="red"><%= id %></font>는 존재하는 아이디 입니다.<br/>
        <form id="myForm" method="post" >
           <input type="text" name="id" id="id" maxlength="16" autofocus />
           <input type="submit" onclick="test()" value="확인" >
           <input type="button" value="취소" onclick="window.close()" ><br>   
        </form>
<%
      } else {
%>
        <font color="red"><%= id %></font>는 사용할 수 있는 아이디 입니다.
         <input type="button" value="적용" onclick="putValue('<%= id %>')" >
         <input type="button" value="취소" onclick="window.close()" ><br>
<%
      }
   }
%>
</body>
</html>
