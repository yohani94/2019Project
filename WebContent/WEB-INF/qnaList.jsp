<%@page import="kr.ac.knu.dao.QnaDAO"%>
<%@page import="kr.ac.knu.dao.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.knu.entity.QnaEntity"%>
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

<link href="css/selectbox.css" rel="stylesheet" type="text/css">
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
      ArrayList<QnaEntity> list = (ArrayList<QnaEntity>)request.getAttribute("list"); 
      request.setCharacterEncoding("euc-kr");

      int totalPage = (int) request.getAttribute("totalPage");
      int startPageNum = (int) request.getAttribute("startPageNum");
      int pageScope = (int) request.getAttribute("pageScope");
      String column = (String) request.getAttribute("column");
      String keyword = (String) request.getAttribute("keyword");
      String Ttype = (String) request.getAttribute("Ttype");
      int curPage = (int) request.getAttribute("curPage");
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
 	<a href="faqList.do" style=color:black;><button>
 	<img src = "images/questionmost.png" style="width:20px; margin-right:3px;">자주 묻는 질문</button></a>
    <a href="qnaList.do"><button class="is-aactive">
    <img src="images/question.png" style="width:20px; margin-right:3px;">1:1 게시판</button></a>
</table>
<!--  상단 메뉴바 끝 -->

 <hr class="line-orange-center">
      </article>   
 
<div class="container">

  

<!--  qna 게시판 -->
<table class="table hoverable bordered">
 <form id = "submitForm">      
      <input type = "hidden" name = "id" />
</form>

 
    <thead>
    <td colspan="5" align="center" style="border-top:0px;">
      <form action="qnaList.do#qnabbs" method="post">
         <div id="bottom" style="text-align:right;"><font color="#FFD159"> 애완동물 분류 &nbsp;&nbsp;&nbsp;&nbsp; </font>
         <select name="Ttype">
            <option value="%%">전체</option>
            <option value="cat">CAT</option>
            <option value="dog">DOG</option>
            <option value="others">Others</option>
         </select>
         <input type="submit" value="적용" class="btn btn-sm animated-button thar-four"></div>
      </form>
    
    <form action="qnaList.do#qnabbs" method="post">
         <div id="bottom" style="text-align:right;"><font color="#FFD159"> 게시글 개수 &nbsp;&nbsp;&nbsp;&nbsp; </font>
         <select name="pScope">
            <option value="5">5개</option>
            <option value="10">10개</option>
            <option value="20">20개</option>
         </select>
         <input type="submit" value="확인" class="btn btn-sm animated-button thar-four"></div>
      </form>
    </td>
    
        <tr>
            <th ng-class="{'activetab waves-effect waves-light' : predicate == 'id'}" ng-click="predicate = 'id'; reverse=!reverse"class="activetab waves-effect waves-light">Number
               
               </th>
            <th ng-class="{'activetab waves-effect waves-light' : predicate == 'name'}" ng-click="predicate = 'name'; reverse=!reverse"class="activetab waves-effect waves-light">Type
               
               </th>
        
             
            <th ng-class="{'activetab waves-effect waves-light' : predicate == 'title'}" ng-click="predicate = 'email'; reverse=!reverse"class="activetab waves-effect waves-light">Title
               
            <th ng-class="{'activetab waves-effect waves-light' : predicate == 'type'}" ng-click="predicate = 'status'; reverse=!reverse"class="activetab waves-effect waves-light">Name
                              
            <th ng-class="{'activetab waves-effect waves-light' : predicate == 'status'}" ng-click="predicate = 'unix'; reverse=!reverse" class="activetab waves-effect waves-light">Date
            
  
        </tr>

    </thead>
    <tbody>
         <%
            if(list.size()==0){
        %>
            <tr>
               <th colspan="5">검색된 데이터 없음.</th>
            <tr/>
        <%
            }else{ for(QnaEntity qna : list){ 
        %>
             <tr>   
            <th ng-class="{'activetab waves-effect waves-light' : predicate == 'id'}" ><%= qna.getId() %></th>
            <th ng-class="{'activetab waves-effect waves-light' : predicate == 'id'}" ><%= qna.getType() %></th>
      
<%
      if(qna.getStep() != 0 && member.getMaster() != 1) { // 답글이고 마스터가 아닌경우
%>   
      <th ng-class="{'activetab waves-effect waves-light' : predicate == 'id'}"  name = "id" onclick = "Check('<%= qna.getId() %>')"><font color="#668cff">
<%
      int step = qna.getStep();

      for(int i=0; i<step; i++){ // 띄어쓰기 ㅇㅇㅇ
%>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<%
      
      }
%>      
<%
      if(step != 0) { // 이미지 출력해주고
%>
      <img src="images/자물쇠.png" 
         width="20"
         height="20"/> 
<%
      }
%>

      <%= qna.getTitle() %></font></th>
<%
      } 
      else { // 답글이 아니거나, 마스터인 경우 모두 해당
%>
<th ng-class="{'activetab waves-effect waves-light' : predicate == 'id'}">
<%
      int step = qna.getStep();

      for(int i=0; i<step; i++){
%>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<%
      
      }
%>      
<%
      if(step != 0) {
%>
      <img src="images/자물쇠.png" 
         width="20"
         height="20"/> 
<%
      }
%>

      <a href="qnaDetail.do?id=<%= qna.getId() %>"><font color="#668cff"><%= qna.getTitle() %></font></a></th>

<%
      }
%>


     <th ng-class="{'activetab waves-effect waves-light' : predicate == 'id'}" ><%= qna.getMembers_id() %></th>
      <th ng-class="{'activetab waves-effect waves-light' : predicate == 'id'}" ><%= qna.getQna_edit().substring(0, 10) %></th>
   </tr>
<%    
      }
   }
%>
   
   <tr>
    </tbody>
  
</table>
<!--  qna 게시판 끝  -->
 <hr class="line-orange-center">

<!-- 하단 서치바, 새글쓰기 버튼 정렬된 부분 -->
   <div class="row" style="margin-left:370px; margin-right:30px; margin-top:60px; width:900px;">



 <div class="s003">
      <form action="qnaList.do">
        <div class="inner-form">
          <div class="input-field first-wrap">
            <div class="input-select">
              <select name="column">
                         <option value="id">일련번호</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                        <option value="members_id">작성자</option>
                     </select>
            </div>
          </div>
          <div class="input-field second-wrap">
            <input type="text" placeholder="Search" name="keyword">
          </div>
          <div class="input-field third-wrap">
            <button class="btn-search" type="submit">
              <svg class="svg-inline--fa fa-search fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="search" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                <path fill="currentColor" d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path>
              </svg>
            </button>
          </div>
        </div>
      </form>
    </div>

       <a href="qnaInsertForm.do" class="btn btn-sm animated-button thar-four" style="width:200px; margin:auto; float:right;">새글쓰기</a> 
</div>  
<!-- 하단 서치바, 새글쓰기 버튼 정렬된 부분 끝 -->	
  	<div>   
     	<div>
<%   
   if(startPageNum  > 1){
%>     
      <div class="pagination p8">
      <ul>
         <a href="qnaList.do?page=1" style="text-decoration: none;"> <li> << </li> </a>
        <a class="is-active" href="qnaList.do?page=<%= startPageNum -1 %>" style="text-decoration: none;"><li> < </li></a>
      </ul>
     </div>
<%      
   }

      for(int i=startPageNum ; i< (startPageNum + pageScope); i++){
         if(i >totalPage){
            break;
         }
         if(curPage == i){
%>
         <div class="pagination p2">
         <ul>
           <a class="is-active" style="text-decoration: none;"><li><%= i %></li></a>
           

<%            
         } else{
%>
        <a href="qnaList.do?page=<%=i%>&column=<%= column %>
         &keyword=<%=keyword%>" style="text-decoration: none;"><%= i %></a>
            </ul>
          </div>
<%  
         }
      }
      if(startPageNum + pageScope <= totalPage){    
%>  
<div class="pagination p8">
<ul>
<a href="qnaList.do?page=<%= startPageNum + pageScope %>" style="text-decoration: none;"><li>></li></a>
<a href="qnaList.do?page=<%= totalPage %>" style="text-decoration: none;" ><li> >> </li> </a>
</ul>
</div>
<%
	}
%>  
  
     	</div>  
  	</div>   

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