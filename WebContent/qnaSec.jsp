<%@page import="kr.ac.knu.dao.QnaDAO"%>
<%@page import="kr.ac.knu.entity.QnaEntity"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link href="css/qnaSec.css" rel="stylesheet" type="text/css">

<%

	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	
	String msg = request.getParameter("msg");
	
	System.out.println("msg 으에에 sec");
	System.out.println(msg);
	
	if(msg == null){
		
	}else if(msg.equals("55")){
%>
<script>
   alert(" 비밀번호를 다시 확인해주시기 바랍니다. ");
</script>
<%
}
%>

</head>
<body>

<%
	Boolean check = (Boolean)request.getAttribute("check");

	if(check != null && check) {
%>
<script>
	opener.location.href = "qnaDetail.do?id=<%= id %>&check=<%= check %>";
	window.close();
</script>
<%
	}
%>

<form id = "myForm" action = "qnaSec.do" method = "post"> 
<table>

  <thead>
  
    <tr>
      <th colspan="3">Password</th>
    </tr>
    <tr>
      <th>Serial Number</th>
      <th colspan="2"><%= id %><input type="hidden" name="id" value="<%= id %>" /></th>
    </tr>
    <tr>
    	<th colspan="3">
			<input type="password" name="ppss" placeholder="password" class="form__input" maxlength="6">
        	<input type="submit" value="Search" class="button">
		</th>
    </tr>
    
    </thead>
    
</table>
</form>

</body>
</html>