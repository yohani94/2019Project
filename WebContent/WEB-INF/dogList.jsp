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

<title>KKANGAZI</title>
<meta charset="UTF-8">
<meta content="" name="description">
<meta content="" property="og:title">
<meta content="" property="og:description">
<meta content="width=device-width, initial-scale=1" name="viewport">


<link href="css/radiobutton.css" rel="stylesheet" type="text/css">
<link href="css/searchbar.css" rel="stylesheet" type="text/css">
<link href="css/pagination.css" rel="stylesheet" type="text/css">
<link href="css/liststyle.css" rel="stylesheet" type="text/css">
<link href="css/normalize.css" rel="stylesheet" type="text/css">
<link href="css/webflow.css" rel="stylesheet" type="text/css">
<link href="css/surf-theme.webflow.css" rel="stylesheet" type="text/css">


<script
   src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script>
<!-- 민주 민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주ㅍ -->
<script type="text/javascript">
function validationCheck() {
   var form = document.getElementById("myForm");
   
   var dog_title = form.dog_title.value;
   var animaltype = form.animaltype.value;
   var dc_type = form.dc_type.value;
   var dc_sex = form.dc_sex.value;
   var dc_age = form.dc_age.value;
   var dc_sex_neu = form.dc_sex_neu.value;
   var dc_size = form.dc_size.value;
   var dc_vaccinate = form.dc_vaccinate.value;
   var dc_others = form.dc_others.value;
   var dog_comment = form.dog_comment.value;
   var upfile = form.upfile.value;
   
   
   if (dog_title == ""){
      alert("제목을 입력해주세요.");
      return false;
      
   }else if (dc_type == ""|| dc_sex == ""
      || dc_age == ""|| dc_sex_neu == ""
      || dc_size == ""|| dc_vaccinate == ""
      || dc_vaccinate == "") {
      alert("세부 사항을 빠짐없이 입력해주세요.");
      return false;
      
   }else if (dog_comment==""){
      alert("입양견에대한 설명을 입력해주세요.");
      return false;   
   }else if(upfile ==""){
      alert("1개이상의 사진을 올려주세요.");
      return false;
   }
}   

function test(code, mode){
	var form = document.getElementById("test");
		
	form.action = "boardList.do?comple="+mode+"#sesu" ;
	form.submit();
}
   </script>   
   
<!-- 민주 민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주ㅍ -->
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
 .p {text-decoration: none;}
</style>
<link rel="stylesheet" href="css/button.css">
</head>
<body>

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
   String comple = (String)request.getAttribute("comple");
   
   String animaltype = (String)request.getAttribute("animaltype");
   System.out.println(animaltype+"선언된거");
   
   //민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주
%>
<%@ include file="Header.jsp" %>
   <section class="section">
<%@ include file="Side-bar.jsp" %>
      <main class="container w-container">
      
<%   
   if(animaltype.equals("dog")){
%>                  
         <div class="hero-section w-clearfix">
         <img alt="Dog" class="dog" data-ix="fade-in-on-load"
            sizes="(max-width: 479px) 81vw, (max-width: 767px) 78vw, (max-width: 991px) 80vw, 73vw"
            src="images/doglistmain.jpg" srcset="images/doglistmain.jpg 1056w">
         <div class="hold-slide-content">
            <h1 class="heading" data-ix="float-in-on-load-2">
                 입양
               <br>
                  강아지
            </h1>
         </div>
         </div>
<%
   }else if(animaltype.equals("cat")){
%>      
         <div class="hero-section w-clearfix">
         <img alt="Dog" class="dog" data-ix="fade-in-on-load"
            sizes="(max-width: 479px) 81vw, (max-width: 767px) 78vw, (max-width: 991px) 80vw, 73vw"
            src="images/catlistmain.jpg" srcset="images/catlistmain.jpg 1056w">
         <div class="hold-slide-content">
            <h1 class="heading" data-ix="float-in-on-load-2">
                  입양
               <br>
                  고양이
            </h1>
         </div>
         </div>
<%
   }else{
%>
      <div class="hero-section w-clearfix">
         <img alt="Dog" class="dog" data-ix="fade-in-on-load"
            sizes="(max-width: 479px) 81vw, (max-width: 767px) 78vw, (max-width: 991px) 80vw, 73vw"
            src="images/catlistmain.jpg" srcset="images/catlistmain.jpg 1056w">
         <div class="hold-slide-content">
            <h1 class="heading" data-ix="float-in-on-load-2">
                  입양
               <br>
                  고양이,강아지 입양
            </h1>
         </div>
         </div>
<%
   }
%>
      
      </main>
      <article class="container quote w-container">
         <p class="quote-text" data-ix="float-in-on-scroll" id="sesu">KKANGAZI는 다양한
            외모와 성격을 가진 견종을 전문으로 분양하고 있습니다.</p>
            <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-6">
               <a href="boardList.do?animaltype=dog" class="btn btn-sm animated-button thar-two">강아지</a>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-6">
               <a href="boardList.do?animaltype=cat" class="btn btn-sm animated-button thar-two">고양이</a>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-6">
               <a href="boardList.do?animaltype=" class="btn btn-sm animated-button thar-two">모두보기</a>
            </div>
         </div>
            <hr class="line-orange-center" >
      </article> 
      
 
 <%   
   if(animaltype.equals("")){
%> 
 
<form id="test" method="post">
 <div class="row">
   모두보기 <input type="radio" class="option-input radio" name="comple" onchange="test('','')"  <%=(comple.equals("")?"checked":"") %>/>
   분양완료 <input type="radio" class="option-input radio" name="comple" onchange="test('','1')" <%=(comple.equals("1")?"checked":"") %> />
   분양중 <input type="radio" class="option-input radio" name="comple" onchange="test('','0')"  <%=(comple.equals("0")?"checked":"") %>/>
</div>
</form>

<%   
   }else if (animaltype.equals("cat")){
%>

<form id="test" method="post">
 <div class="row">
   모두보기 <input type="radio" class="option-input radio" name="comple" onchange="test('cat','')"  <%=(comple.equals("")?"checked":"") %>/>
   분양완료 <input type="radio" class="option-input radio" name="comple" onchange="test('cat','1')" <%=(comple.equals("1")?"checked":"") %> />
   분양중 <input type="radio" class="option-input radio" name="comple" onchange="test('cat','0')"  <%=(comple.equals("0")?"checked":"") %>/>
   <input type="hidden" name="animaltype" value="cat" />
</div>
</form>

<%   
   }else{
%>

   <form id="test" method="post">
    <div class="row">
   모두보기 <input type="radio" class="option-input radio" name="comple" onchange="test('dog','')"  <%=(comple.equals("")?"checked":"") %>/>
   분양완료 <input type="radio" class="option-input radio" name="comple" onchange="test('dog','1')" <%=(comple.equals("1")?"checked":"") %> />
   분양중 <input type="radio" class="option-input radio" name="comple" onchange="test('dog','0')"  <%=(comple.equals("0")?"checked":"") %>/>
   <input type="hidden" name="animaltype" value="dog" />
</div>
</form>

<%   
   }
%>
  
  
      
<!-- 여기서부터 컨테이너 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 보드리스트 만든는것 -->


<div class="container">

<%
   if(list.size()==0){
%>   

         <div style="margin-bottom:100px;">
            검색된 항목이 없습니다.
         </div>
        
         <hr class="line-orange-center" >
      <%request.setCharacterEncoding("euc-kr"); %>
   
      <div class="row" style="margin-left:300px; margin-right:30px; width:auto;">
		<form action="boardList.do" class="search-wrapper cf" style="margin:auto; align:center;">
		<select name="animaltype">
		                         <option value="">전체</option>
		                        <option value="dog">강아지</option>
		                        <option value="cat">고양이</option>
		 </select>
		
		        <input type="text" placeholder="Search" name="keyword">
		           <button type="submit">
		              <span class="fontawesome-search"></span>
		           </button>
</form>
  
       <a href="boardInsertForm.do" class="btn btn-sm animated-button thar-four" style="width:200px; margin:auto; float:right;">새글쓰기</a> 
</div> 

  
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
////////////////////////완료일때 올린사람이거나, master 계정일경우 상세정보를 받아볼수 있음      ////////////////////
      if(board.getMembers_id().equals(member.getId())||member.getId().equals("master")){
%>      
	
      <div class="gallery-item" tabindex="0">
            <a href="hitUpdate.do?dog_number=<%=board.getDog_number()%>">
            <img src="download/<%=board.getUpfile()%>"class="gallery-image" alt="" 
            style="height:270px;">
            <img src="images/comple.png"class="gallery-image" alt=""
               style="height:270px;  display:block; position:absolute; top: 0px; left :0px; z-index:2">
                    
            <p><%= board.getDog_title() %></p><br>
            <p>작성자 : <%= board.getMembers_id()%></p>
            <p>작성일 : <%=board.getDog_date() %>    조회수<%=board.getHit() %></p>               
          </a>
        </div>   
        
       
<%      
   }else{////////////////////////완료일시 타사용자들은 상세정보를 볼 수 없음   ////////////////////
%>      

      <div class="gallery-item" tabindex="0">
             <img src="download/<%=board.getUpfile()%>"class="gallery-image" alt="" style="height:270px; width=270px;">
            <img src="images/comple.png"class="gallery-image" alt="" 
            style="height:270px; width=270px;display:block; position:absolute; top: 0px; left :0px; z-index:2">
            <div class="gallery-item-info" tabindex="0">
            </div>
           
           <p><%= board.getDog_title() %></p><br>
           <p>작성자 : <%= board.getMembers_id()%></p>
           <p>작성일 : <%=board.getDog_date() %>    조회수<%=board.getHit() %></p>   
          
        </div> 
        
     
<%      
      }
   }else{
%>     

      <div class="gallery-item" tabindex="0">
             <a href="hitUpdate.do?dog_number=<%=board.getDog_number()%>&animaltype1=<%=animaltype%>">
            <img src="download/<%=board.getUpfile()%>"class="gallery-image" style="height:270px; width=270px;">
            <div class="gallery-item-info" >
            </div>        
            <p><%= board.getDog_title() %></p><br>
            <p>작성자 : <%= board.getMembers_id()%></p>
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

<!-- 하단 서치바, 새글쓰기 버튼 정렬된 부분 -->
   <div class="row" style="margin-left:370px; margin-right:30px; width:900px;">

 <div class="s003">
      <form action="boardList.do">
        <div class="inner-form">
          <div class="input-field first-wrap">
            <div class="input-select">
              <select name="animaltype">
                         <option value="">전체</option>
                        <option value="dog">강아지</option>
                        <option value="cat">고양이</option>
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

       <a href="boardInsertForm.do" class="btn btn-sm animated-button thar-four" style="width:200px; margin:auto; float:right;">새글쓰기</a> 
</div>  
<!-- 하단 서치바, 새글쓰기 버튼 정렬된 부분 끝 -->

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
          </div> 

<%            
         } else{
%>
		<div class="pagination p2">
         
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
</div>

<!-- 여기까지 컨테이너 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 보드리스트 만든는것 -->   
<%@ include file="Footer.jsp" %>
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
         
         <script type="text/javascript">



</script>
         
   </section>
</body>
</html>