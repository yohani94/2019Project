<%@page import="kr.ac.knu.dao.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.knu.entity.QnaEntity"%>
<%@page import="kr.ac.knu.entity.BoardEntity"%>
<%@page import="kr.ac.knu.ActionForward"%>
<%@page import="kr.ac.knu.entity.MemberEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-wf-page="58f24ff59590171867ff6fe7"
	data-wf-site="58f24ff59590171867ff6fe6">
<head>
<title>KKANGAZI</title>
<meta content="" name="description">
<meta content="" property="og:title">
<meta content="" property="og:description">
<meta content="width=device-width, initial-scale=1" name="viewport">

<link href="css/sidemenubar.css" rel="stylesheet">
<link href="css/liststyle.css" rel="stylesheet" type="text/css">
<link href="css/normalize.css" rel="stylesheet" type="text/css">
<link href="css/webflow.css" rel="stylesheet" type="text/css">
<link href="css/surf-theme.webflow.css" rel="stylesheet" type="text/css">

<%
		MemberEntity member =
		(MemberEntity)session.getAttribute("member");
		QnaEntity qna = (QnaEntity)request.getAttribute("qna");
		request.setCharacterEncoding("UTF-8"); 
		
		String msg = request.getParameter("msg");

		System.out.println("msg");
		System.out.println(msg);
		
		if (msg == null){

		} else if(msg.equals("21")){
%>
<script>
	alert(" 비밀번호를 작성해주세요 ");
</script>
<%
		}else if(msg.equals("22")){
%>			
<script>
	alert(" 모든 칸을 작성하셔야 합니다 ");
</script>
<%		
		} else {
%>
<script>
	alert("에러");
</script>
<%		
		}
%>

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
            width: 166px;}
</style>
<link rel="stylesheet" href="css/button.css">
</head>
   
   <meta content="" name="description">
   <meta content="width=device-width, initial-scale=1" name="viewport">
   <link href="css/normalize.css" rel="stylesheet" type="text/css">
   <link href="css/webflow.css" rel="stylesheet" type="text/css">
   <link href="css/surf-theme.webflow.css" rel="stylesheet" type="text/css">
   <link href="css/table.css" rel="stylesheet" type="text/css">
   
<body>



<header class="header">
		<div class="navbar w-nav" data-animation="default"
			data-collapse="medium" data-duration="400" id="top">
			<header class="container in-nav w-container">
				<a class="w-nav-brand" href="index.jsp#top"> <img alt="KKANGAZI Logo"
					class="KKANGAZI-logo" src="images/mainlogo.png" width="300">
				</a>
				<nav class="nav-menu w-clearfix w-nav-menu" role="navigation">
					<a class="nav-link w-nav-link" href="index.jsp#introduce">소개</a> <a
						class="nav-link w-nav-link" href="index.jsp#process">입양절차</a> <a
						class="nav-link w-nav-link" href="boardList.do">입양/분양</a> <a
						class="nav-link w-nav-link" href="qnaList.do">고객지원</a>
						<a class="nav-link w-nav-link"></a><a class="nav-link w-nav-link"></a>
					 <%
   if(member == null){
%>               
               <a class="nav-link w-nav-link" href="memberloginForm.do" > Login</a>
<%
   }else {
%>
               <a class="nav-link w-nav-link" href="memberUpdateForm.do?id=<%= member.getId() %>"><%= member.getId() %>
               <img src= "images/mypageicon.png" width="30" height = "30" ></a>   
               <a class="nav-link w-nav-link" href="memberlogout.do" ><img src= "images/Logout.png" width="36" height = "36" ></a>                        
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

<!--         ---------				--------			---------		-------                               -----------				--------------				-------------- -->

<section class="section">
		<div class="side-bar">
			<p class="side-bar__text">Save our Animals!</p>
		</div>
		<main class="container w-container">
		<div class="hero-section w-clearfix">
			<img alt="Dog" class="dog" data-ix="fade-in-on-load"
				sizes="(max-width: 479px) 81vw, (max-width: 767px) 78vw, (max-width: 991px) 80vw, 73vw"
				src="images/faqmain.jpg" srcset="images/faqmain.jpg 1056w">
			<div class="hold-slide-content">
				<h1 class="heading" data-ix="float-in-on-load-2">
					고객지원
					</p>
				</h1>
			</div>
		</div>
		</main>
		
		<article class="container quote w-container">
			<p class="quote-text" data-ix="float-in-on-scroll">다양한 고객지원을 받으실 수 있습니다.</p>
				<hr class="line-orange-center" >
		</article>
		
		<h2 align="center" id = qnabbs><font color="#FFD159">글 수정</font></h2>

		<form action="qnaUpdate.do" method="post">
		<div class = "container">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th>No</th>
						<td>
						<%= qna.getId() %>
						<input type="hidden" name="id" value="<%= qna.getId() %>" class="form-control"/>
						</td>
					</tr>
					<%
					if (member.getMaster() == 1){
					%>
					<tr>
						<th>Type</th>
						<td><%= qna.getType() %><input type = "hidden" name = "type" value ="<%= qna.getType() %>" class="form-control"/></td>
					</tr>
					<%
					} else {
					%>
					<tr>
						<th>Type</th>
						  <td>
			         			<select name="type" class ="form-control">
			            			<option value="cat">CAT</option>
			           				<option value="dog">DOG</option>
			           				<option value="others">Others</option>
			         			</select>
			           </td>  
					</tr>
					<%
					}
					if (member.getMaster() == 1) {
					%>
					<tr>
     				 	<th>Title</th>
				      	<td><%= qna.getTitle() %><input type = "hidden" name = "title" value ="<%= qna.getTitle() %>" class="form-control"/></td>
				   </tr>
					<%
					} else {
					%>
					<tr>
     				 	<th>Title</th>
				      <td><input type="text" name="title" value="<%= qna.getTitle() %>" class="form-control"/></td>
				   </tr>
				   <%
					}
				   %>
				   <tr>
				      <td colspan = "2" ><textarea name="content" cols="250" rows="22" placeholder="내용을 입력해주세요." class="form-control"><%= qna.getContent() %></textarea></td>
				   </tr>
				   <%
				   if(member.getMaster() == 1){
				   %>
				   <tr>
						<th width = "150">QNA password</th>
						<td><%= qna.getId() %><input type="hidden" name="qna_pas" value="<%= qna.getQna_pas() %>" class="form-control"/></td>
					</tr>
				   <%
				   } else {
				   %>
				   <tr>
						<th width = "150">QNA password</th>
						<td><input type="password" name="qna_pas" placeholder="숫자,영문,특수문자 조합의 최대 6글자" value="<%= qna.getQna_pas() %>"class="form-control" maxlength="6"/></td>
					</tr>
					<%
				   }
					%>
					<tr hidden="">
						<td><input type = "hidden" name = "ref" value="<%= qna.getRef() %>"class="form-control"/></td>
					</tr>
					<tr>
				      <th colspan="2" style = "text-align:center;">
				         <input type="submit" value="수정" />
				      </th>
				   </tr>
				</tbody>
			</table>
			
			<div>
			<span style="width:200px; float:right; margin-top: 20px">
					       <a href="qnaList.do#qnabbs" class="btn btn-sm animated-button thar-four">LIST</a> 
			</span>
			</div>
	
		</div>
		</form>
		</section>

<footer class="section">
				<footer class="both-top-and-bottom centered container w-container">
					<a class="footer-logo w-inline-block" data-ix="float-in-on-scroll"
				href="index.jsp#top"> <img alt="KKANGAZI Logo" src="images/mainlogo.png"
				width="500">
				</a>
					<div class="text-links" data-ix="float-in-on-scroll-2">
						<a class="nav-link w-nav-link" href="index.jsp#introduce">소개</a> <a
							class="nav-link w-nav-link" href="index.jsp#process">입양 절차</a> <a
							class="nav-link w-nav-link" href="boardList.do">입양/분양</a> <a
							class="nav-link w-nav-link" href="qnaList.do">고객지원</a>
					</div>
				</footer>
			</footer>
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