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

<link href="css/liststyle.css" rel="stylesheet" type="text/css">
<link href="css/normalize.css" rel="stylesheet" type="text/css">
<link href="css/webflow.css" rel="stylesheet" type="text/css">
<link href="css/surf-theme.webflow.css" rel="stylesheet" type="text/css">

<script
   src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script>
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
		|| dc_age == "" || dc_size == ""|| dc_vaccinate == ""
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
   </script>
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
<body>
<%@ include file="Header.jsp" %>
   <section class="section">
<%@ include file="Side-bar.jsp" %>
      <main class="container w-container">
      <div class="hero-section w-clearfix">
         <img alt="Dog" class="dog" data-ix="fade-in-on-load"
            sizes="(max-width: 479px) 81vw, (max-width: 767px) 78vw, (max-width: 991px) 80vw, 73vw"
            src="images/boardInsertmain.jpg" srcset="images/boardInsertmain.jpg 1056w">
         <div class="hold-slide-content">
            <h1 class="heading" data-ix="float-in-on-load-2">
               분양/입양</p>
               글쓰기
            </h1>
         </div>
         
      </div>
      </main>
 <!-- 여기서부터임 페이지내용임 &************************************************************************************************* -->     
      <article class="container quote w-container">
         <p class="quote-text" data-ix="float-in-on-scroll">KKANGAZI는 다양한
            외모와 성격을 가진 강아지와 고양이를 전문으로 분양하고 있습니다.</p>
            <hr class="line-orange-center">
            </article>
      <body>
            <div class="container">
                <table class="table table-bordered">
                  <tbody>
 		<form action="boardInsert.do" 
					method="post"
					enctype="multipart/form-data"
                     	id="myForm" onsubmit="return validationCheck()" >
                        <tr>
                           <th>제목:</th>
                           <td colspan="5"><input type="text" placeholder="제목을 입력하세요. "
                              name="dog_title" class="form-control" /></td>
                        </tr>
			 			<tr>
							<th>종류 : </th>
				         			<td colspan="5">
				         				<select name="animaltype" class="form-control">
				            			<option value="dog">강아지</option>
				            			<option value="cat">고양이</option>
				           				
				           				</select>
				          			</td>
						</tr>
                        <tr>
                           <th class="txt-h6 ls-03 weight-600 font-bm">견종</th>
                     <td class="txt-h6 ls-03 weight-600 font-bm" >
                     <input type="text" placeholder="ex)푸들, 레브라도리트리버"
                              name="dc_type" class="form-control" /></td>
                          <th class="txt-h6 ls-03 weight-600 font-bm">성별</th>
                           <td class="txt-h6 ls-03 weight-600 font-bm" >
                           		암<input type = "radio"  name= "dc_sex"  class="" value="암컷"/>
                           		수<input type = "radio" name="dc_sex" class="m"/ value="수컷">
                        </tr>
                        <tr>
                           <th class="txt-h6 ls-03 weight-600 font-bm">나이</th>
                           <td class="txt-h6 ls-03 weight-600 font-bm" >
                           <input type="text" placeholder="ex)1,2년 1년 미만일 경우 개월"
                              name="dc_age" class="form-control" /></td>
                           <th class="txt-h6 ls-03 weight-600 font-bm">중성화 여부</th>
                           <td class="txt-h6 ls-03 weight-600 font-bm" >
                          		 했음 <input type = "checkbox"  name= "dc_sex_neu" value="중성화 o" />
                      </tr>
                         <tr>
                         	<th class="txt-h6 ls-03 weight-600 font-bm">접종</th>
                           <td class="txt-h6 ls-03 weight-600 font-bm" >
                           <input type="text" placeholder="ex)예방접종여부"
                              name="dc_vaccinate" class="form-control" /></td>
                           <th class="txt-h6 ls-03 weight-600 font-bm">사이즈</th>
                           <td class="txt-h6 ls-03 weight-600 font-bm" >
	                           	대<input type = "radio"  name= "dc_size"  class="" value="대형견"/>
                           		중<input type = "radio" name="dc_size" class=""/ value="중형견">
                             	소<input type = "radio" name="dc_size" class=""/ value="소형견">
                           </tr>
                        <tr>
                           <th>기타 사항:</th>
                           <td colspan="5"><textarea cols="10" placeholder="기타 특이사항 입력해주세요. "
                                 name="dc_others" class="form-control"></textarea></td>
                        </tr>
                  <tr>
                           <th>내용:</th>
                           <td colspan="5" height="250">
                           <textarea cols="10" placeholder="내용을 입력하세요." style="height: 100%" name="dog_comment" class="form-control"></textarea></td>
                        </tr>
                        <tr>
                           <th>동물사진: 
                             <!--  <input type="button" value="-" onclick="deleteInput();" class="pull-right"/>
                                 <input type="button" value="+" onclick="addInput();" class="pull-right" /> -->
                        </th>
                           <td colspan="4" > 사진을 추가해주세요  (jpg, gif, png, jpeg지원)
                            <input type='file' placeholder='파일을 선택하세요.'   name='upfile' 
                             accept='.gif, .jpg, .png .jpeg'  >
                            </td> 
                            
                        </tr>
                        <tr>
                           <td colspan="6">
                           <input type="submit" value="등록"  class="pull-right"/> 
                          </form> 
                           <input type="submit" value="reset" class="pull-left" 
                           onclick="javascript:location.href='boardInsertForm.do'"/> 
                           <input type="submit" value="글 목록으로... " class="pull-right"
                              onclick="javascript:location.href='boardList.do'" /> 
                              <!-- <a class="btn btn-default" onclick="sendData()"> 등록 </a>
                    <a class="btn btn-default" type="reset"> reset </a>
                    <a class="btn btn-default" onclick="javascript:location.href='list.jsp'">글 목록으로...</a> -->
                           </td>
                        </tr>
                     
                  </tbody>
               </table>
    </section>
      </body>           
<%@ include file="Footer.jsp" %>
            </div>
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
               $('.form-control').keyup(
                     function() {
                        if ($(this).val().length > 0) {
                           $(this).closest('.form-group').addClass(
                                 'filled');
                        } else {
                           $(this).closest('.form-group').removeClass(
                                 'filled');
                        }
                     });
               /// Check for the input field filled focus
               var $formControl = $('.form-control');
               var values = {};
               var validate = $formControl.each(function() {
                  if ($(this).val().length > 0) {
                     $(this).closest('.form-group').addClass('filled');
                  } else {
                     $(this).closest('.form-group')
                           .removeClass('filled');
                  }
               });
            </script>
 <!--사진 올리기 스크립트에용 사진 올리기 스크립트에용사진 올리기 스크립트에용사진 올리기 스크립트에용사진 올리기 스크립트에용사진 올리기 스크립트에용사진 올리기 스크립트에용사진 올리기 스크립트에용  -->             
   <script type="text/javascript">
var arrInput = new Array(0);
var arrInputValue = new Array(0);
 
function addInput() {
   if(arrInput.length < 5){
  arrInput.push(arrInput.length);
  arrInputValue.push("");
  display();
   }else{alert("사진은 다섯개까지만요!!");}
   
}

function deleteInput() {
     if (arrInput.length > 0) { 
        arrInput.pop(); 
        arrInputValue.pop();
     }
     display(""); 
   }
 
function display() {
  document.getElementById('parah').innerHTML="파일은 최대 5개까지 최소 1개이상 업로드해주세요. ";
  for (intI=0;intI<arrInput.length;intI++) {
    document.getElementById('parah').innerHTML+=createInput(arrInput[intI], arrInputValue[intI]);
  }
}
 
function saveValue(intId,strValue) {
  arrInputValue[intId]=strValue;
}  
 
function createInput(id,value) {
   return "<input type='file' placeholder='파일을 선택하세요.'   name='upfile'  accept='.gif, .jpg, .png .jpeg'  >";
}/* class='form-control' */
 

</script> 
<!--사진 올리기 스크립트에용 사진 올리기 스크립트에용사진 올리기 스크립트에용사진 올리기 스크립트에용사진 올리기 스크립트에용사진 올리기 스크립트에용사진 올리기 스크립트에용사진 올리기 스크립트에용  -->                   
            
         </body>
</html>
