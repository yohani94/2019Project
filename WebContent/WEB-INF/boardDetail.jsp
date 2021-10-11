<%@page import="kr.ac.knu.entity.CommentEntity"%>
<%@page import="java.util.ArrayList"%>
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

<link rel="stylesheet" href="css/smallbutton.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/boardDetailStyle.css">
<link href="css/comment.css" rel="stylesheet" type="text/css">
<link href="css/liststyle.css" rel="stylesheet" type="text/css">
<link href="css/normalize.css" rel="stylesheet" type="text/css">
<link href="css/webflow.css" rel="stylesheet" type="text/css">
<link href="css/surf-theme.webflow.css" rel="stylesheet" type="text/css">
<link href="css/Adopted_btn.css" rel="stylesheet" type="text/css">

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
<script src="js/minjucomjs.js" type="text/javascript"></script>
<script src="js/modernizr.js" type="text/javascript"></script>
<script src="js/comment.js" type="text/javascript"></script>
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
 hr.line-orange-center {
            border: 0;
            height: 3px;
            background-color: #FFD700;
            margin-top : 60px;
            margin-bottom : 40px;
            width: 166px;}

</style>

</head>
<body>
 <%
   
 //민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주민주
      BoardEntity board = (BoardEntity)request.getAttribute("board");
       BoardEntity board2 = (BoardEntity)request.getAttribute("board2");//다음번호정보
       BoardEntity board3 = (BoardEntity)request.getAttribute("board3");//전번호 정보
      
        ArrayList<CommentEntity> list =    
              (ArrayList<CommentEntity>)request.getAttribute("list");
         
        int totalPage = (int)request.getAttribute("totalPage");
        int startPageNum = (int)request.getAttribute("startPageNum");
        int pageScope = (int)request.getAttribute("pageScope");
        int curPage  = (int)request.getAttribute("curPage");
       String column = (String)request.getAttribute("column");
       String keyword = (String)request.getAttribute("keyword");
       String animaltype1 = (String)request.getAttribute("animaltype1");
 %>
<%@ include file="Header.jsp" %>
   <section class="section">
<%@ include file="Side-bar.jsp" %>
      <main class="container w-container">
      <div class="hero-section w-clearfix">
         <img alt="Dog" class="dog" data-ix="fade-in-on-load"
            sizes="(max-width: 479px) 81vw, (max-width: 767px) 78vw, (max-width: 991px) 80vw, 73vw"
            src="images/boardDetailmain.jpg" srcset="images/boardDetailmain.jpg 1056w">
         <div class="hold-slide-content">
            <h1 class="heading" data-ix="float-in-on-load-2">
               애완동물</p>
               상세정보
            </h1>
         </div>
      </div>
      </main>
      <article class="container quote w-container">
         <p class="quote-text" data-ix="float-in-on-scroll">KKANGAZI는 다양한
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
      </section>
  
 <!-- 음 여기가 디테일 시작부분  음 여기가 디테일 시작부분음 여기가 디테일 시작부분음 여기가 디테일 시작부분음 여기가 디테일 시작부분음 여기가 디테일 시작부분 -->
   <div class="container">
          <table class="table view-table" border="1">
          <thead>
             <!--#####===== 타이틀 =====#####-->
             <tr class="subject-list clearfix">
                <th colspan="2" class="txt-h4 weight-600 page-title text-left">
                   <%= board.getAnimaltype()%>          
                   <th class="txt-h6 weight-500 text-right date hidden-xs-down">
                   <span>작성일</span> <%=board.getDog_date() %>        
                   </th>
             </tr>

             <tr class="subject-list">
                <th colspan="5" class="txt-h0 weight-500 title ls-2">
                   <%= board.getDog_title() %>                </th>
             </tr>

             <tr class="subject-list2">
                <th colspan="3" class="txt-h6 weight-500 ">
                   작성자 : <%= board.getMembers_id()%> 
                </th>
                <th colspan="2" class="txt-h6 weight-500">
                      조회수 <%=board.getHit() %>
                  </th>
             </tr>
          </thead>

          <tbody>
             <!--#####===== 컨텐츠 =====#####-->
             <tr class="content-list img-mobile">
                <td colspan="5" class="text-center txt-h7 ls-03 word-break">
                                                    <div class="title text-left txt-h3 font-bm ls-05">반려견 정보</div><!-- /.title- -->
                            <table class="table info-table word-break">
                                <tbody>
                                    <tr>
                                        <th class="txt-h6 ls-03 weight-600 font-bm">견종</th>
                                        <td class="txt-h6 ls-03 weight-600 font-bm"><%= board.getDc_type() %></td>
                                        <th class="txt-h6 ls-03 weight-600 font-bm">성별</th>
                                        <td class="txt-h6 ls-03 weight-600 font-bm"><%= board.getDc_sex() %></td>
                                    </tr>
                                    <tr>
                                        <th class="txt-h6 ls-03 weight-600 font-bm">나이</th>
                                        <td class="txt-h6 ls-03 weight-600 font-bm"><%=board.getDc_age() %></td>
                                        <th class="txt-h6 ls-03 weight-600 font-bm">중성화 여부</th>
                                        <td class="txt-h6 ls-03 weight-600 font-bm"><%=board.getDc_sex_neu() %></td>
                                    </tr>
                                    <tr>
                                       <th class="txt-h6 ls-03 weight-600 font-bm">접종여부</th>
                                        <td class="txt-h6 ls-03 weight-600 font-bm"><%= board.getDc_vaccinate()%></td>
                                        <th class="txt-h6 ls-03 weight-600 font-bm">사이즈</th>
                                        <td class="txt-h6 ls-03 weight-600 font-bm"><%= board.getDc_size() %></td>
                                        
                                    </tr>
                                    <tr>
                                        <th class="txt-h6 ls-03 weight-600 font-bm">기타 특이사항</th>
                                        <td colspan="3" class="txt-h6 ls-03 weight-600 font-bm"><%= board.getDc_others() %></td>
                                    </tr>
                                </tbody>
                            </table>
                              <div class="gallery-item" tabindex="0">
                        <img src="download/<%=board.getUpfile()%>"class="gallery-image" 
                        style="width: auto; min-width:70%; max-width:70%; height: auto; min-height:70%; max-height:70%;
                        margin-left:auto; margin-right:auto;" >
                        </div>   
                    </td>    
             </tr>
         </tbody>
       </table>
       <div align="center" style = "font-size:1.5em; font-family: arial;"><%= board.getDog_comment().replaceAll("\n","<br/>") %></div>
       <br>
   <!--입양완료버튼 -->
       <div class="Adopted_btn" style="text">
            <form action="compleUpdate.do" method="post" align="right">
  <%   if(board.getMembers_id().equals(member.getId())||member.getId().equals("master")){
     if(board.getComple().equals("1")){
  %>    

             <input type="hidden" name="dog_number" value="<%=board.getDog_number()%>" />
                <span>
                    <button class= button name="comple"  value="0"  href="boardList.do"style="text-decoration:none">입양진행중</button>
                </span>    
  <%
     }else if(board.getComple().equals("0")){
  %>   
                <input type="hidden" name="dog_number" value="<%=board.getDog_number()%>" />
              <span>
                    <button class= button name="comple" value="1"  href="boardList.do"style="text-decoration:none">입양완료</button>
                </span>
  <%
     }}
  %>   
            </form>     
      </div>
            <!--입양완료버튼끝 -->

       <hr class="line-orange-center" >
<!--댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글  댓글 댓글 댓글 댓글 댓글 댓글 댓글 댓글 -->      

<ul class="comment-section">
<%
   if(list.size()==0){
%>
         <li class="comment user-comment">

                <div class="info">
                    <a href="#"></a>
                   
                </div>

                <a class="avatar" href="#">    
                </a>

                <p>아직 댓글이 없습니다. 애완동물을 입양할 때에는 신중하게 생각해 주세요!</p>

         </li>
<%
   }else{ 
      for(CommentEntity comment : list){
         if(comment.getStep() == 0){
%>
      
         <li class="comment user-comment">

                <div class="info">
                    <a href="#" id="pagedown"><%=comment.getMembers_id()%></a>
                    <span><%=comment.getCom_date()%></span>
                </div>

                <a class="avatar" href="#">    
                </a>

          <p>

      <%= comment.getComment_content().replaceAll("\n","<br/>") %>
<%               
	 if(comment.getMembers_id().equals(member.getId())||member.getId().equals("master")){
%>      
               <a href = "commentDelete.do?com_num=<%= comment.getCom_num() %>&dog_number=<%=board.getDog_number()%>#pagedown" onclick="return confirm('삭제할건가요')"  class="pull-right">삭제</a> 
<%               
 }
%>             
        <a class="pull-right" onClick="insRow(<%=comment.getRef()%>)" >답글</a>        
          </p> 
         
           <table id="addTable<%=comment.getRef()%>" 
           style="margin-left:300px; width:800px; cellspacing:0; cellpadding:0; bgcolor:#FFFFFF;">
                   
         </table>
           
       </li>
       
       
<%   
         }else{
      int step = comment.getStep();
      for(int i=0; i<step; i++){
%>
      <li class="comment author-comment">

                <div class="info">
                    <a href="#" ><%=comment.getMembers_id()%></a>
                    <span><%=comment.getCom_date()%></span>
                </div>

                <a class="avatar" href="#">    
                </a>
            <p>
                      <%= comment.getComment_content().replaceAll("\n","<br/>") %>
                         
<%               
if(comment.getMembers_id().equals(member.getId())||member.getId().equals("master")){
%>      
              <a href = "commentDelete.do?com_num=<%= comment.getCom_num() %>&dog_number=<%=board.getDog_number()%>#pagedown" onclick="return confirm('삭제할건가요')"  class="pull-right">삭제</a>
                             
<%               
 }
%>                         
           </p>
         </li>
<%
      }
%>   
      
<%    
      }
   }
   }
   if(startPageNum  > 1){
%>
      <a href="boardDetail.do?dog_number=<%=board.getDog_number()%>&page=1"> 맨 앞으로 </a>
      <a href="boardDetail.do?dog_number=<%=board.getDog_number()%>&page=<%= startPageNum  -1 %>" >&lt;</a>
<%      
   }
      for(int i=startPageNum ; i< (startPageNum + pageScope); i++){
         if(i!=1){
         if(i >totalPage){
            break;
         }
         if(curPage == i){
%>
         <font color="red"><b>[<%= i %>]</b></font>
<%            
         } else{
%>
         [<a href="boardDetail.do?dog_number=<%=board.getDog_number()%>&page=<%=i%>&column=<%= column %>&keyword=<%=keyword%>"><%= i %></a>] 
<%            
         }}
      }
   if(startPageNum + pageScope <= totalPage){
%>      
      <a href="boardDetail.do?dog_number=<%=board.getDog_number()%>&page=<%= startPageNum + pageScope %>" >&gt;</a>
      <a href="boardDetail.do?dog_number=<%=board.getDog_number()%>&page=<%= totalPage %>" > 맨 뒤로 </a>
<%
      }
%>
            <li class="write-new" style="display:table; margin-left: auto; margin-right: auto;" >
                <form action="commentInsert.do#pagedown" method="post">
            <%= member.getId() %> : 
                    <textarea placeholder="Write your comment here" name="comment_content"></textarea>
                <input type=hidden name="dog_number" value="<%=board.getDog_number()%>" />
                    <div>
                        <button type="submit">Submit</button>
                    </div>
                </form>
            </li>
      </ul>
   <!--  댓글창  끝 -->
   <hr class="line-orange-center" >
    <div class="container">
   <a class= button href="boardList.do"style="text-decoration:none"><span>목록으로</span></a> 
      <a class=button href="boardDelete.do?dog_number=<%= board.getDog_number() %>" 
      onclick="return confirm('삭제할건가요')" style="text-decoration:none">
      <span>게시글삭제</span></a> 
      <a href="#" class= button style="text-decoration:none"><span>게시글 수정</span></a> 
   </div>
<br/>


<hr class="one">
<%      
   if(board2==null){
%>
<p style="margin-left:47px;color: #333333;">다음 게시물 없음 </p>
 <%
   }else {
       %> 
         <img src="images/arrowup.png" style="width:30px; margin-right:15px">
          다음 게시물 : <a href = "boardDetail.do?dog_number=<%=board2.getDog_number()%>&animaltype1=<%=animaltype1%>">
          <%=board2.getDog_title()%></a>
          <%      
    }
%>

         
<hr class="one">
<%
if(board3!=null){
%>
         <img src="images/arrowdown.png" style="width:30px; margin-right:15px">
         이전 게시물 : <a href = "boardDetail.do?dog_number=<%=board3.getDog_number()%>&animaltype1=<%=animaltype1%>">
         <%=board3.getDog_title() %></a>
<%
         }else {
 %> <p style="margin-left:47px;color: #333333;">이전 게시물 없음 </p>
 <%
    }
 %>
<hr class="one">

   
 </div>          

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
         <script language="javascript">
      
      var i =0;
      var oTbl;
      //Row 추가
       function insRow(ref) {
         
         if(i!=1){
              oTbl = document.getElementById("addTable"+ref);
              
              var oRow = oTbl.insertRow();
              oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
              var oCell = oRow.insertCell();
               
              //삽입될 Form Tag
                          
              var frmTag = "";
              frmTag += "<li class=write-new>"+
              "<form action=commentReply.do#pagedown method=post><%= member.getId() %>"+
              " :<a onClick=removeRow() class=pull-right >"+
              "입력창 접기</a>"+
              " <textarea placeholder=Write your comment here name=comment_content>"+
              "</textarea><input type=hidden name=step value =0 />"+
              "<input type=hidden name=dog_number value=<%=board.getDog_number()%> />"+
              "<input type=hidden name=ref value=" + ref  +" />"+
              "<div><button type=submit>Submit</button></div></form></li>";
               
              i++; //여러번새김방지용
              oCell.innerHTML = frmTag;
              
         }
      }
      //Row 삭제
      function removeRow() {
        oTbl.deleteRow(oTbl.clickedRowIndex);
        i--;
      }


</script>
</body>
</html>