<%@page import="kr.ac.knu.entity.MemberEntity"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ID ã��</title>
<script>
   function test(value) { // javascript Ÿ�� , �ѱ� �������� 
   
      var form = document.getElementById("myForm");
      var value = form.id.value;
      
      var regNumber = /^[0-9a-zA-Z-]+$/; //0~9���� ����,a~z���� �ҹ���,A~Z���� �빮�ڸ� ���
      pattern = eval(regNumber);
      
      if(value.length > 0 && pattern.test(value) == false) {
           form.id.value = "";
           form.id.focus();
           alert("�ѱ۰� Ư�����ڴ� ����� �� �����ϴ�.");
           
           return false;
           
      } else {  // ����� �ԷµǾ����� �Ʒ� action�� �����Ͽ� �ߺ�üũ ����
      
         form.action = "memberIdCheck.do";
         form.submit();
      }
   }
   
   function putValue(id) { // �ߺ�üũ â���� ID �����ư. ���� ��ư ������ â������ ȸ������â�� ID���� �Է�.

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
    ���̵� �˻��ϼ���.<br/>
   <font size="2px" color="green">���̵�� �ּ� 4�ڸ� �Դϴ�.</font>
   <br/>
    <form id="myForm" method="post">
       <input type="text" name="id" id="id" maxlength="16" autofocus/>
       <input type="submit" onclick="test()" value="Ȯ��"><!-- submit�� ������ ������ ����ȴ�. button���� �������� �ȸ��� --> 
       <input type="button" value="���" onclick="window.close()" ><br>
    </form>

<%
   } else {
      if( stNo != null ) {
%>
        <font color="red"><%= id %></font>�� �����ϴ� ���̵� �Դϴ�.<br/>
        <form id="myForm" method="post" >
           <input type="text" name="id" id="id" maxlength="16" autofocus />
           <input type="submit" onclick="test()" value="Ȯ��" >
           <input type="button" value="���" onclick="window.close()" ><br>   
        </form>
<%
      } else {
%>
        <font color="red"><%= id %></font>�� ����� �� �ִ� ���̵� �Դϴ�.
         <input type="button" value="����" onclick="putValue('<%= id %>')" >
         <input type="button" value="���" onclick="window.close()" ><br>
<%
      }
   }
%>
</body>
</html>
