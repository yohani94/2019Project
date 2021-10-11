<%@page import="kr.ac.knu.ActionForward"%>
<%@page import="kr.ac.knu.entity.MemberEntity"%>
<%@page import="kr.ac.knu.entity.FaqEntity"%>
<%@page import= "javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
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

<link rel="stylesheet" href="css/smallbutton.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/boardDetailStyle.css">
<link href="css/comment.css" rel="stylesheet" type="text/css">
<link href="css/liststyle.css" rel="stylesheet" type="text/css">
<link href="css/normalize.css" rel="stylesheet" type="text/css">
<link href="css/webflow.css" rel="stylesheet" type="text/css">
<link href="css/surf-theme.webflow.css" rel="stylesheet" type="text/css">

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
   hr.one {          
            border-bottom: 0px;           
            margin-left:0px;
            width: 100%;}
.button{
        background-color:#ffffff;
        text-decoration:none;
        border:1px solid #F7CA18;
        color:#F7CA18;
        padding-top:5px;
        padding-bottom:5px;
        padding-left: 15px;
        padding-right: 15px;
        font-size: 12px;
        cursor:pointer;

      }
.button:hover{
        background-color:#F7CA18;
        color:#191919;
      }  
      
</style>
<link rel="stylesheet" href="css/button.css">
</head>

<body>

<%
		MemberEntity member =
		(MemberEntity)session.getAttribute("member");
		FaqEntity faq = (FaqEntity)request.getAttribute("faq");
		
		request.setCharacterEncoding("euc-kr");
%>

<header class="header">
		<div class="navbar w-nav" data-animation="default"
			data-collapse="medium" data-duration="400" id="top">
			<header class="container in-nav w-container">
				<a class="w-nav-brand" href="#top"> <img alt="KKANGAZI Logo"
					class="KKANGAZI-logo" src="images/mainlogo.png" width="300">
				</a>
				<nav class="nav-menu w-clearfix w-nav-menu" role="navigation">
					<a class="nav-link w-nav-link" href="index.jsp#introduce">소개</a> <a
						class="nav-link w-nav-link" href="index.jsp#process">입양절차</a> <a
						class="nav-link w-nav-link" href="boardList.do">입양/분양</a> <a
						class="nav-link w-nav-link" href="qnaList.do#qnabbs">고객지원</a>
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
				
				<div class="middle-line" data-ix="float-in-on-scroll-3"></div>
		</article>
		
               <%-- ----------------------------  ---------------------------- -----------------------------%>
               
<div class="container">
            <table class="table view-table">
    		<thead>
    			<!--#####===== 타이틀 =====#####-->
 	<div class='board_summary'>
               <div class='left'>
                  
                  <div class='author'>
                     
                     <div class='board_name'>
                     </div></div></div></div>
                     <form>
                     table No.  <%= faq.getFaq_number() %>
                     </form>
                     <tr class="subject-list clearfix">
                <th colspan="2" class="txt-h4 weight-600 page-title text-left">
                   <%= faq.getFaq_type() %> 
                   </th>
             </tr>
             <tr class="subject-list">
                <th colspan="3" class="txt-h0 weight-500 title ls-2">
                   <%= faq.getFaq_title() %></th>
             </tr>
             </thead>
             
             <tbody>
             <tr class="content-list img-mobile">
                            <table class="table info-table word-break">
                                <tbody>
                                
                                <tr>
                                	<th class="txt-h6 ls-03 weight-600 font-bm">Type</th>
                                	<td class="txt-h6 ls-03 weight-600 font-bm"><%= faq.getFaq_type() %></td>
                                </tr>
                                
                                </tbody>
                              </table>
                              <%= faq.getFaq_content().replaceAll("\n","<br/>") %>
                              <div class="gallery-item" tabindex="0">
                            </div>
                        </td>
                  </tr>
		   				</tbody>
		  </table>
		  
		  <hr class="line-orange-center" >
	 <div class="container">
	 
	 <a class= button href="faqList.do#faqbbs"style="text-decoration:none"><span>목록으로</span></a> 
    <%
	if(member.getMaster() == 1) {
	%>
	<a href="faqDelete.do?faq_number=<%= faq.getFaq_number() %>"  onclick="return confirm('삭제할건가요')"
		class= button style="text-decoration:none"><span>게시글 삭제</span></a>         
	<a href="faqUpdateForm.do?faq_number=<%= faq.getFaq_number() %>" 
		class= button style="text-decoration:none"><span>게시글 수정</span></a>
	<%
	}
	%>
	
	</div>
	<br/>
	
	<hr class="one">
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
               
               
               
               
               
<%-- <table width="100%" height="150%" border = "1">
		<tr>
				<th bgcolor="#999999"><font color = "white"><div id="bottom" style="text-align:center;">일련번호</div></font></th>
				<td colspan = "3"><div id="bottom" style="text-align:center;"><%= faq.getFaq_number() %></div></td>
		</tr>
		<tr>
				<th bgcolor="#999999"><font color = "white"><div id="bottom" style="text-align:center;">타입</div></font></th>
				<td colspan = "3"><div id="bottom" style="text-align:center;"><%= faq.getFaq_type() %></div></td>
		</tr>
		<tr>
				<th bgcolor="#999999"><font color = "white"><div id="bottom" style="text-align:center;">제목</div></font></th>
				<td colspan = "3"><div id="bottom" style="text-align:center;"><%= faq.getFaq_title() %></div></td>
		</tr>
		<tr height="400" border = "1">
				<td colspan = "4"><%= faq.getFaq_content() %></td>
		</tr>
		<%
		if(member.getMaster() == 1) {
		%>
		<tr>
			<td><a href = "faqList.do">목록보기</a></td>
			<td><a href = "faqDelete.do?faq_number=<%= faq.getFaq_number() %>">삭제</a></td>
			<td><a href = "faqUpdateForm.do?faq_number=<%= faq.getFaq_number() %>">수정</a></td>
		</tr>
		<%
		} else {
		%>
		<tr>
			<td colspan ="3"><a href = "faqList.do"><div id="bottom" style="text-align:center;">목록보기</div></a></td>
		</tr>
		<%
		}
		%>
		
</table>
<br>

&nbsp;&nbsp;
<div id="bottom" style="text-align:right;"><a href="index.jsp">MAIN</a></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<div id="bottom" style="text-align:right;"><a href = "faqList.do#faqbbs">LIST</a></div>

</section>
	<br><br><br> 

<footer class="section">
				<footer class="both-top-and-bottom centered container w-container">
					<a class="footer-logo w-inline-block" data-ix="float-in-on-scroll"
				href="#"> <img alt="KKANGAZI Logo" src="images/mainlogo.png"
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
</html> --%>