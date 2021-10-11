<%@page import="kr.ac.knu.entity.BoardEntity"%>
<%@page import="java.util.ArrayList"%>
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

<link href="css/pagination.css" rel="stylesheet" type="text/css">
<link href="css/searchbar.css" rel="stylesheet" type="text/css">
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
            width: 166px;}
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
<%@ include file="Header.jsp" %>
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
    <a href="memberUpdateForm.do?id=<%=member.getId()%>"style=color:black;"><button type="button"> 
    <img src = "images/memberupdate.png" style="width:20px; margin-right:3px;">회원정보 수정</button></a>
    
    <a href="myboardList.do" style=color:black;"><button type="button" class="is-aactive"> 
    <img src = "images/document.png" style="width:20px; margin-right:3px;">내가 쓴 글</button></a>
    
    <a href="memberQnaForm.do" style=color:black;><button type="button">
     <img src = "images/document.png" style="width:20px; margin-right:3px;">내가 쓴 QNA</button></a>
</table>

<hr class="line-orange-center">
  </article>
<%   
   //민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주
   ArrayList<BoardEntity> list =    
         (ArrayList<BoardEntity>)request.getAttribute("list");
 
   request.setCharacterEncoding("euc-kr");
   int totalPage = (int)request.getAttribute("totalPage");
   int startPageNum = (int)request.getAttribute("startPageNum");
   int pageScope = (int)request.getAttribute("pageScope");
   String column = (String)request.getAttribute("column");
   String keyword = (String)request.getAttribute("keyword");
   int curPage  = (int)request.getAttribute("curPage");
   int scope =(int)request.getAttribute("scope");
   
   String animaltype = (String)request.getAttribute("animaltype");
   //민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주
%>        
<div class="container">

<%
   if(list.size()==0){
%>   

         <div style="margin-bottom:100px; text-align:center;">
            검색된 항목이 없습니다.
         </div>
        
         <hr class="line-orange-center" >
      <%request.setCharacterEncoding("euc-kr"); %>
   
 
  
<%
   }else{ 
      
      %>
      <div class="gallery">
      <%      
      int size = list.size();
      for(BoardEntity board : list) {
      
      int step = 0;
      for(int i=0; i<step; i++){
%>

      &nbsp;&nbsp;&nbsp;
<%
      }   if(board.getComple().equals("1")){
/////////////////////완료일때 올린사람이거나, master 계정일경우 상세정보를 받아볼수 있음  ////////////////////
      if(board.getMembers_id().equals(member.getId())||member.getId().equals("master")){
%>   
  
      <div class="gallery-item" tabindex="0">
            <a href="hitUpdate.do?dog_number=<%=board.getDog_number()%>">
            <img src="download/<%=board.getUpfile()%>"class="gallery-image" alt="" style="height:270px; width=270px;">
            <img src="images/comple.png"class="gallery-image" alt=""
               style="height:270px; width=270px;display:block; position:absolute; top: 0px; left :0px; z-index:2">
             
            <p><%= board.getDog_title() %></p><br>
            <p>작성자 : 관리자  <%= board.getMembers_id()%></p>
            <p>작성일 : <%=board.getDog_edit().substring(0, 10) %>    조회수<%=board.getHit() %></p>  
          </a>
        </div>  
       
<%      
   }else{////////////////////////완료일시 타사용자들은 상세정보를 볼 수 없음   ////////////////////
%>      
       <div class="gallery-item" tabindex="0">
             <img src="download/<%=board.getUpfile()%>"class="gallery-image" alt="">
            <img src="images/comple.png"class="gallery-image" alt="" 
            style="height:270px; width=270px;display:block; position:absolute; top: 0px; left :0px; z-index:2">
            
        </div>   
<%   
      }
   }else{
%>     
      <div class="gallery-item" tabindex="0">
             <a href="hitUpdate.do?dog_number=<%=board.getDog_number()%>">
            <img src="download/<%=board.getUpfile()%>"class="gallery-image" alt="" style="height:270px; width=270px;">
            
            <p><%= board.getDog_title() %></p><br>
            <p>작성자 : 관리자  <%= board.getMembers_id()%></p>
            <p>작성일 : <%=board.getDog_edit().substring(0, 10) %>    조회수<%=board.getHit() %></p>  
            </a>
        </div>     
<%      
   } }
       for(int i = size; i < 4; i ++){
 %>
      <div class="gallery-item" tabindex="0"></div>
 <%    
       }   
%> 
   </div>
<hr class="line-orange-center" >
<%request.setCharacterEncoding("euc-kr"); %>


   


     <div>   
        <div>
 
<%   
   if(startPageNum  > 1){
%>     
      <div class="pagination p8">
      <ul>
         <a href="boardList.do?page=1" style="text-decoration: none;"> <li> << </li> </a>
        <a class="is-active" href="boardList.do?page=<%= startPageNum -1 %>" style="text-decoration: none;"><li> < </li></a>
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
        <a href="boardList.do?page=<%=i%>&column=<%= column %>
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
<a href="boardList.do?page=<%= startPageNum + pageScope %>" style="text-decoration: none;"><li>></li></a>
<a href="boardList.do?page=<%= totalPage %>" style="text-decoration: none;" ><li> >> </li> </a>
</ul>
</div>
<%
   }
   }
%>  
  
        </div>  
     </div>   

</div> 


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