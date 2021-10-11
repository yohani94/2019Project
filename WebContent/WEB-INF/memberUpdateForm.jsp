<%@page import="kr.ac.knu.entity.MemberEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--  This site was created in Webflow. http://www.webflow.com -->
<!--  Last Published: Thu May 11 2017 02:12:15 GMT+0000 (UTC)  -->
<html data-wf-page="58f24ff59590171867ff6fe7"
 data-wf-site="58f24ff59590171867ff6fe6">
<head>
<meta charset="UTF-8">
<title>KKANGAZI</title>
<meta content="" name="description">
<meta content="" property="og:title">
<meta content="" property="og:description">
<meta content="width=device-width, initial-scale=1" name="viewport">

<link href="css/topmenubar.css" rel="stylesheet" type="text/css">
<link href="css/liststyle.css" rel="stylesheet" type="text/css">
<link href="css/normalize.css" rel="stylesheet" type="text/css">
<link href="css/webflow.css" rel="stylesheet" type="text/css">
<link href="css/surf-theme.webflow.css" rel="stylesheet" type="text/css">
<link href="css/memberupdateTable.css" rel="stylesheet" type="text/css">

<script
 src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script>
<script type="text/javascript">
 WebFont
   .load({
    google : {
     families : [
       "Lato:100,100italic,300,300italic,400,400italic,700,700italic,900,900italic",
       "Oswald:200,300,400,500,600,700",
       "Open Sans:300,300italic,400,400italic,600,600italic,700,700italic,800,800italic",
       "Playfair Display:regular,700,900" ]
    }
   });
</script>
<script src="js/modernizr.js" type="text/javascript"></script>
<link href="images/logo.png" rel="shortcut icon" type="image/x-icon">
<link href="images/logo.png" rel="apple-touch-icon">
<style>
.form-group .form-control {
 position: relative;
 z-index: 2;
 padding: 12px;
 width: 100%;
 box-shadow: none;
}

.form-group .form-control:focus, .form-group .form-control:active {
 box-shadow: none;
 outline: none;
}

.form-group .form-label {
 color: #222222;
 font-size: 14px;
 min-height: 42px;
 text-align: left;
 position: absolute;
 top: 14px;
 left: 10px;
 right: 0;
 -webkit-transition: 0.3s;
 transition: 0.3s;
 z-index: 3;
}

.form-group.focus:after {
 opacity: 1;
 width: 100%;
}

.form-group.focus .form-label, .form-group.filled .form-label {
 top: -20px;
 font-size: 12px;
 left: 0px;
 color: #5da8ef;
}

hr.line-orange-center {
            border: 0;
            height: 3px;
            background-color: #FFD700;
            margin-top : 60px;
            margin-bottom : 40px;
            width: 166px;
            }            
/* 아래 코드는 수정,삭제 버튼에 대한 CSS입니다. 

button{
  background:#FFD700;;
  color:#fff;
  border:none;
  position:relative;
  height:25px;
  font-size:1em;
  padding:0 1em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:ffffff;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #FFD700;;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
*/
</style>
<link rel="stylesheet" href="css/button.css">
</head>
<body>
<%
  MemberEntity member = (MemberEntity) request.getAttribute("member");//jsp
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

 <section class="section">
<%@ include file="Side-bar.jsp" %>
  <main class="container w-container">
  <div class="hero-section w-clearfix">
   <img alt="Dog" class="dog" data-ix="fade-in-on-load"
    sizes="(max-width: 479px) 81vw, (max-width: 767px) 78vw, (max-width: 991px) 80vw, 73vw"
    src="images/mypagemain.jpg" srcset="images/mypagemain.jpg 1056w">
   <div class="hold-slide-content">
    <h1 class="heading" data-ix="float-in-on-load-2">
     마이페이지
     </p>
    </h1>
   </div>
  </div>
  </main>
  <article class="container quote w-container">
   <p class="quote-text" data-ix="float-in-on-scroll"></p>

  
   
  <!--  상단 메뉴바 -->
 <table>
    <a href="memberUpdateForm.do?id=<%=member.getId()%>"><button type="button" class="is-aactive"> 
    <img src ="images/memberupdate.png" style="width:20px; margin-right:3px;">회원정보 수정</button></a>
    
    <a href="myboardList.do" style=color:black;"><button type="button"> 
    <img src = "images/document.png" style="width:20px; margin-right:3px;">내가 쓴 글</button></a>
    
    <a href="memberQnaForm.do" style=color:black;><button type="button">
     <img src = "images/document.png" style="width:20px; margin-right:3px;">내가 쓴 QNA</button></a>
</table>
<!--  상단 메뉴바 끝 --> 
    <hr class="line-orange-center">
  </article>

   <form class="login-form" method="post">
   
    <table class="memberupdateTable" align="center" style="margin-top : 50px">
   <thead>
      <tr>
        <th scope="cols">타이틀</th>
        <th scope="cols">내용</th>
       </tr>
    </thead>
    <tbody>
      <tr>
         <th>아이디</th>
         <td><%=member.getId()%> <input type="hidden" name="id" value="<%=member.getId()%>" /></td>
      </tr>
      <tr>
         <th>비밀번호</th>
         <td><input type="password" name="user_pw" value="<%=member.getPw()%>" /></td>
      </tr>
      <tr>
         <th>닉네임</th>
         <td><%=member.getNick()%></td>
      </tr>
      <tr>
         <th>주소</th>
         <td><input type="text" name="user_address" value="<%=member.getAddress()%>" size="55" /></td>
      </tr>
      <tr>
         <th>전화번호</th>
         <td><input type="text" name="user_phone" maxlength="11" value="<%=member.getPhone()%>" /></td>
      </tr>
      <tr>
         <th>이름</th>
         <td><%=member.getName()%></td>
      </tr>
      <tr>
         <th>이메일</th>
         <td><input type="text" name="user_email" value="<%=member.getEmail()%>" /></td>
      </tr>
      <tr>
         <th>성별</th>
         <td><select name="user_gender">
            <option value="1"
               <%=(member.getGender().equals("1")) ? "selected" : ""%>>여자</option>
            <option value="2"
               <%=(member.getGender().equals("2")) ? "selected" : ""%>>남자</option>
         </select></td>
      </tr>
      </tbody>
   </table>
   
    </p>
    
     <hr class="line-orange-center">
    <div class ="row">
       <button type="submit" formaction="memberUpdate.do" style="width:100px;">수정</button>
       <button type="submit" formaction="memberDelete.do?id=<%=member.getId()%>" style="width:100px;">회원탈퇴</button>
      </div>
   


   </form>
 <p />
<%@ include file="Footer.jsp" %>
 </section>
 <script
  src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"
  type="text/javascript"></script>
 <script src="js/webflow.js" type="text/javascript"></script>
 <script>
  $('.form-control').focusout(function() {
   $('.form-group').removeClass('focus');
  });
  $('.form-control').focus(function() {
   $(this).closest('.form-group').addClass('focus');
  });
  /// Check for the input field keypress
  $('.form-control').keyup(function() {
   if ($(this).val().length > 0) {
    $(this).closest('.form-group').addClass('filled');
   } else {
    $(this).closest('.form-group').removeClass('filled');
   }
  });
  /// Check for the input field filled focus
  var $formControl = $('.form-control');
  var values = {};
  var validate = $formControl.each(function() {
   if ($(this).val().length > 0) {
    $(this).closest('.form-group').addClass('filled');
   } else {
    $(this).closest('.form-group').removeClass('filled');
   }
  });
 </script>
</body>
</html>