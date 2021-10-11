<%@page import="kr.ac.knu.entity.BoardEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.knu.entity.MemberEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
      <%
      MemberEntity member = (MemberEntity) session.getAttribute("member");//jsp


    %>
   <header class="header">
      <div class="navbar w-nav" data-animation="default"
         data-collapse="medium" data-duration="400" id="top">     
         <header class="container in-nav w-container">
            <a class="w-nav-brand" href="index.jsp"> <img alt="KKANGAZI Logo"
               class="KKANGAZI-logo" src="images/mainlogo.png" width="300">
            </a>
            <nav class="nav-menu w-clearfix w-nav-menu" role="navigation" style="height: 76px">
               	<a class="nav-link w-nav-link" href="index.jsp#introduce">소개</a>
                <a class="nav-link w-nav-link" href="index.jsp#process">입양절차</a> 
                <a class="nav-link w-nav-link" href="boardList.do">입양/분양</a> 
                <a class="nav-link w-nav-link" href="qnaList.do">고객지원</a> 
                <a class="nav-link w-nav-link"></a>
               <%
                  if (member == null) {
               %>
               <a class="nav-link w-nav-link" href="memberloginForm.do">
                  Login</a>
               <%
                  } else {
               %>
               
               
               <a class="nav-link w-nav-link" style="padding-top: 15px"
                  href="memberUpdateForm.do?id=<%=member.getId()%>"><%=member.getId()%>
                  <img src="images/mypageicon.png" width="30" height="30"></a> 
                  <a class="nav-link w-nav-link" href="memberlogout.do" style="padding-top: 15px">
                  <img src="images/Logout.png" width="36" height="36"></a>
               <%
                  }
               %>
            </nav>
            <div class="menu-button w-nav-button">
               <div class="w-icon-nav-menu"></div>
            </div>
         </header>
      </div>
   </header>