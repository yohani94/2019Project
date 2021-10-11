<%@page import="kr.ac.knu.entity.FaqEntity"%>
<%@page import="kr.ac.knu.dao.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.knu.entity.QnaEntity"%>
<%@page import="kr.ac.knu.entity.BoardEntity"%>
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

<link href="css/topmenubar.css" rel="stylesheet" type="text/css">
<link href="css/pagination.css" rel="stylesheet" type="text/css">
<link href="css/searchbar.css" rel="stylesheet" type="text/css">
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
<script type="text/javascript">

function  Check(id) {
   // 새 창 오픈해서 나타내는걸로
   var width = 550;
   var height = 230;
   
   var pwidth = Math.ceil((window.screen.width - width)/2);
   
   var pheight = Math.ceil((window.screen.height - height)/2);

   window.open('qnaSec.do', 'popup', 'width = '+width+', height = '+height+', top = '+pheight+', left = '+pwidth+'');
   
   var submitForm = document.getElementById("submitForm");
   
   submitForm.id.value = id; 
   submitForm.action = "qnaSec.jsp";
   submitForm.method = "post";
   submitForm.target = "popup";
   submitForm.submit(); 
   
//   window.close();
}

</script>

<script src="js/faqstyle.js" type="text/javascript"></script>
<script src="js/modernizr.js" type="text/javascript"></script>
<script src="js/main.js" type="text/javascript"></script>

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
   margin-top: 60px;
   margin-bottom: 40px;
   width: 166px;
}
</style>
<meta content="" name="description">
<meta content="width=device-width, initial-scale=1" name="viewport">
<link href="css/normalize.css" rel="stylesheet" type="text/css">
<link href="css/webflow.css" rel="stylesheet" type="text/css">
<link href="css/surf-theme.webflow.css" rel="stylesheet" type="text/css">
<link href="css/table.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/button.css">
</head>

<body>
 <%
         ArrayList<FaqEntity> lista = (ArrayList<FaqEntity>)request.getAttribute("lista"); 
      request.setCharacterEncoding("euc-kr");

      int ttotalPage = (int)request.getAttribute("ttotalPage");
      int sstartPageNum = (int)request.getAttribute("sstartPageNum");
      int ppageScope = (int)request.getAttribute("ppageScope");
      String ftype = (String)request.getAttribute("ftype");
      int ccurPage = (int)request.getAttribute("ccurPage");   
%>


<%@ include file="Header.jsp"%>
   <section class="section">
<%@ include file="Side-bar.jsp"%>
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
         <p class="quote-text" data-ix="float-in-on-scroll">다양한 고객지원을 받으실
            수 있습니다.</p>

        
         <!--  상단 메뉴바 -->

 <table>
 	<a href="faqList.do" style=color:black;><button class="is-aactive">
 	<img src = "images/questionmost.png" style="width:20px; margin-right:3px;">자주 묻는 질문</button></a>
    <a href="qnaList.do" style=color:black;><button>
    <img src="images/question.png" style="width:20px; margin-right:3px;">1:1 게시판</button></a>
</table>
<!--  상단 메뉴바 끝 -->

 <hr class="line-orange-center">
      </article>   
 
<div class="container">

  

<!--  qna 게시판 -->
<table class="table hoverable bordered">
 <!--            ============================                    table               ========================         -->

<thead>


      <td colspan="3" align="center">
      <form action="faqList.do#faqbbs" method="post">
         <div id="bottom" style="text-align:right;"><font color="#FFD159"> TYPE &nbsp;&nbsp;&nbsp;&nbsp; </font>
         <select name="ftype">
            <option value="%%">전체</option>
            <option value="how">입양 방법</option>
            <option value="set">입양 결정</option>
            <option value="cus">고객 정보</option>
         </select>
         <input type="submit" value="적용" class="btn btn-sm animated-button thar-four"></div>
      </td> 
      
    <tr>
          <th ng-class="{'activetab waves-effect waves-light' : predicate == 'id'}" ng-click="predicate = 'id'; reverse=!reverse"class="activetab waves-effect waves-light">No
               </th>
            <th ng-class="{'activetab waves-effect waves-light' : predicate == 'id'}" ng-click="predicate = 'id'; reverse=!reverse"class="activetab waves-effect waves-light">Type
               </th>
            <th ng-class="{'activetab waves-effect waves-light' : predicate == 'name'}" ng-click="predicate = 'name'; reverse=!reverse"class="activetab waves-effect waves-light">Title
               </th>
     </tr>
</thead>

<tbody>
        <%
            if(lista.size()==0){
        %>
            <tr>
               <th colspan="3">FAQ 데이터 없음.</th>
            <tr/>
        <%
            }else{ for(FaqEntity faq : lista){ 
        %>
              <tr>
              <th ng-class="{'activetab waves-effect waves-light' : predicate == 'id'}" ><%= faq.getFaq_number() %></th>
              <th ng-class="{'activetab waves-effect waves-light' : predicate == 'id'}" ><%= faq.getFaq_type() %></th>
              <th ng-class="{'activetab waves-effect waves-light' : predicate == 'id'}" ><a href="faqDetail.do?faq_number=<%= faq.getFaq_number() %>">
              <font color="#668cff"><%= faq.getFaq_title() %></font></a></th>
              </tr>
<%
            }
            }
%>
<tr>
</tbody>
</table>


        <%
   if(member.getMaster() == 1) { 
%>
          
       <a href="faqInsertForm.do" class="btn btn-sm animated-button thar-four" style="width:200px; margin:auto; float:right;">새글쓰기</a> 
         
<%
} 
%> 
      <div>
      <div>
      

  </div>
  </div>
  </section>
         
</body>
</html>



      <%@ include file="Footer.jsp"%>
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