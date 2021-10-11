<%@page import="javafx.scene.control.Alert"%>
<%@page import="kr.ac.knu.entity.MemberEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-wf-page="58f24ff59590171867ff6fe7"
   data-wf-site="58f24ff59590171867ff6fe6">
<head>
 <%
//       MemberEntity member = 
//         (MemberEntity)session.getAttribute("member");//jsp 
       
         String id = request.getParameter("id");
      
         if(id!=null){
 %>
 <script>
    var id = '<%=request.getParameter("id")%>';
       alert(id+"님환영합니다."); 
    </script>
 <%
 
         }
 %>
<title>KKANGAZI</title>
<meta content="" name="description">
<meta content="" property="og:title">
<meta content="" property="og:description">
<meta content="width=device-width, initial-scale=1" name="viewport">
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
</style>
<link rel="stylesheet" href="css/button.css">
</head>
<body>

<%@ include file="WEB-INF/Header.jsp" %>

   <section class="section">
 <%@ include file="WEB-INF/Side-bar.jsp" %>
      <main class="container w-container">
      <div class="hero-section w-clearfix">
         <img alt="Dog" class="dog" data-ix="fade-in-on-load"
            sizes="(max-width: 479px) 81vw, (max-width: 767px) 78vw, (max-width: 991px) 80vw, 73vw"
            src="images/maindog.jpg" srcset="images/maindog.jpg 1056w">
         <div class="hold-slide-content">
            <h1 class="heading" data-ix="float-in-on-load-2">
               STAY WITH
               </p>
               OUR ADORABLE PETS!
            </h1>
            <div class="col-md-3 col-sm-3 col-xs-6" data-ix="float-in-on-load-2">
               <a href="boardList.do" id="introduce"
                  class="btn btn-sm animated-button thar-three" font-size="32px">지금
                  입양하세요!</a>
            </div>
         </div>
      </div>
      </main>
      <article class="container quote w-container">
         <p class="quote-text" data-ix="float-in-on-scroll">
            KKANGAZI는 애완동물의 입양 정보를 공유할 수 있는 사이트입니다.<br> 애견인들이 애완동물 파양해야 할
            어려움을 겪을 경우 <br> 애완동물을 무단으로 유기하기보다, 다른 사람에게 양도할 수 있도록 <br>
            도와주는 시스템의 필요를 느껴 만들어졌습니다.
         </p>
         <div class="text-block-2" data-ix="float-in-on-scroll-2">With
            Kangnam Univ.</div>
         <div class="middle-line" data-ix="float-in-on-scroll-3"></div>
      </article>
      <article class="both-top-and-bottom container w-container">
         <div class="w-row">
            <div class="column-2 w-col w-col-6 w-col-small-6 w-col-tiny-6">
               <img alt="dogncats" data-ix="float-in-on-scroll"
                  src="images/dogncat.jpg">
               <div class="padded-text-container" data-ix="float-in-on-scroll-3">
                  <p class="padded-text">사지 말고 입양하세요. 매일 안락사 당하는 아이들을 구해주세요</p>
               </div>
            </div>
            <div class="column w-col w-col-6 w-col-small-6 w-col-tiny-6">
               <a class="image w-inline-block w-lightbox"
                  data-ix="hover-play-icon" href="#"> <img alt="Dog"
                  src="images/dogs.jpg">
               </a>
            </div>
         </div>
         <div class="bottom middle-line" data-ix="float-in-on-scroll"></div>
      </article>
      <article class="container quote w-container">
         <p class="quote-text" data-ix="float-in-on-scroll" id="process">입양절차</p>
         <div class="text-block-2" data-ix="float-in-on-scroll-2">
            KKANGAZI의 입양 절차에 대해 알려드립니다.faadfsafds</div>
      </article>
      <article class="both-top-and-bottom container w-container">
         <div class="flex-row w-row">
            <div class="column-3 w-col w-col-5">
               <div class="heading-block" data-ix="float-in-on-scroll">
                  <div class="number">01</div>
                  <h2 class="sub-heading">애견선택</h2>
                  <div class="small-hr"></div>
               </div>
               <p class="text-bottom" data-ix="float-in-on-scroll-2"> 
               본 홈페이지에서 입양 분양 게시글에서 
               <br> 마음에 든 반려동물을 선택한 후 
               <br> 고객 지원 게시판이나 카카오톡 KKANGAZI로 문의 주시면
               <br> 애완동물의 종류, 성별, 라이프 스타일을 고려해서 
               <br> 전문가와 충분한 상담을 진행 하실 수 있습니다</p>
            </div>
            <div class="column-4 w-col w-col-7">
               <img alt="dog" class="image-3" data-ix="float-in-on-scroll"
                  sizes="(max-width: 479px) 96vw, (max-width: 767px) 92vw, (max-width: 991px) 55vw, 50vw"
                  src="images/choosingdog.jpg"
                  srcset="imageschoosingdog.jpeg 500w, images/choosingdog.jpg 762w">
            </div>
         </div>
      </article>
      <article class="both-top-and-bottom container w-container">
         <div class="flex-row reverse w-row">
            <div class="column-7 w-col w-col-7">
               <img alt="Point Break" class="image-3" data-ix="float-in-on-scroll"
                  src="images/peoplewithdog.jpg">
            </div>
            <div class="column-3 w-col w-col-5">
               <div class="heading-block" data-ix="float-in-on-scroll">
                  <div class="number">02</div>
                  <h2 class="sub-heading">보호동물 면회</h2>
                  <div class="small-hr"></div>
               </div>
               <p class="text-bottom" data-ix="float-in-on-scroll-2">
               전문가 상담을 마치셨다면 직접 방문을 통해 
               <br> 분양을 원하는 반려동물의 미용상태, 건강검진결과를
               <br> 눈으로 확인하면서 면회 합니다.
			   </p>
            </div>
         </div>
      </article>
      <article class="both-top-and-bottom container w-container">
         <div class="flex-row w-row">
            <div class="column-3 w-col w-col-5">
               <div class="heading-block" data-ix="float-in-on-scroll">
                  <div class="number">03</div>
                  <h2 class="sub-heading">입양 결정후 계약서 작성</h2>
                  <div class="small-hr"></div>
               </div>
               <p class="text-bottom" data-ix="float-in-on-scroll-2">
               	접종내용이나 기타 성별, 모색, 등급, 혈통등의 보증내용을 확인 후
               	<br> 보호자분께서 반려견을 분양하기로 결정하셨다면
               	<br> 재정 경제부에서 고시한 애견 거래법상의
               	<br> 보상규정이 명시된 책임분양 계약서를 작성합니다. 
			</p>
            </div>
            <div class="column-4 w-col w-col-7">
               <img alt="Point Break" class="image-3" data-ix="float-in-on-scroll"
                  src="images/contract.jpg">
            </div>
         </div>
      </article>
      <article class="both-top-and-bottom container w-container">
         <div class="flex-row reverse w-row">
            <div class="column-7 w-col w-col-7">
               <img alt="dog" class="image-3" data-ix="float-in-on-scroll"
                  sizes="(max-width: 479px) 96vw, (max-width: 767px) 92vw, (max-width: 991px) 55vw, 50vw"
                  src="images/happydog2.jpg"
                  srcset="images/happydog2.jpg 500w, images/happydog2.jpg 762w">
            </div>
            <div class="column-3 w-col w-col-5">
               <div class="heading-block" data-ix="float-in-on-scroll">
                  <div class="number">04</div>
                  <h2 class="sub-heading"> 분양 완료</h2>
                  <div class="small-hr"></div>
               </div>
               <p class="text-bottom" data-ix="float-in-on-scroll-2">
               <br> 최종적으로 책임분양 계약서까지 작성했다면
               <br> 계약을 분양이 완료되었습니다 
               <br> 사랑스러운 반려동물을 아낌없이 사랑해 주세요
               </p>
            </div>
         </div>
      </article>

   <div class="contact-bg">
      <article class="centered container w-container">
         <div class="bottom middle-line" data-ix="float-in-on-scroll"></div>
         <h2 class="sub-heading" data-ix="float-in-on-scroll-2">Join the
            Member of KKANGAZI!</h2>
         <p class="max-500 text-bottom" data-ix="float-in-on-scroll-3">KKANGAZI의   회원이 되어 귀여운 아이들을 만나보세요!</p>
         <div class="form-wrapper w-form">
         <div class="row">
            <a href="memberInsertForm.do" class="btn btn-sm animated-button thar-one">회원 가입</a>
            </div>
         </div>
      </article>
   </div>
   <div class="footer section">
      <address class="both-top-and-bottom container w-container">
         <div class="row w-row">
            <div class="column-5 w-col w-col-6">
               <img alt="BBangmu'sBoyfreind" class="image-4"
                  src="images/우리조.jpg">
            </div>
            <div class="column-6 w-col w-col-6">
               <div class="footer-sub-head">우리 조원들^^</div>
               <h3 class="heading-2">
                  정 민주(27)<br>이 성훈(25)<br>이 요한(26), 박 혜진(25)<br>혜원짱짱 (25)</h3>
               </h3>
               
            </div>
         </div>
      </address>
   </div>
<%@ include file="WEB-INF/Footer.jsp" %>
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
</section>
</body>
</html>