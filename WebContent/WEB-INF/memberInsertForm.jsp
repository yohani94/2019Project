<%@page import="java.io.UnsupportedEncodingException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Join Page</title>
<link href="css/loginstyle.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script src="js/loginJs.js" type="text/javascript"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
   function test(value) { // javascript 타입 , 한글 제약조건 
      var regNumber = /^[0-9a-zA-Z-]+$/;
      pattern = eval(regNumber);
      if(value.length > 0 && pattern.test(value) == false) {
         var idEle = document.getElementById("id");
         idEle.value = "";
         idEle.focus();
         alert("한글과 특수문자는 사용할 수 없습니다.");
      };
   }
   
   function dupsCheck() { // ID 중복찾기창 오픈
	  var popupX = (window.screen.width / 2) - (330 / 2);// 만들 팝업창 좌우 크기의 대략 1/2 정도만큼 보정값으로 빼주었음

	  var popupY = (window.screen.height /2) - (500 / 2);// 중앙보다 좀더 위에 떠지도록 500이라는 값을 넣었음
	
      window.open("memberIdCheck.jsp", "popup", "width=300, height=300, left="+ popupX + ", top="+ popupY + ", screenX="+ popupX + ", screenY= "+ popupY);
      
   }
   
/*    function addressCheck() { // 주소검색창 오픈
		  var popupX = (window.screen.width / 2) - (330 / 2);// 만들 팝업창 좌우 크기의 대략 1/2 정도만큼 보정값으로 빼주었음

		  var popupY = (window.screen.height /2) - (500 / 2);// 중앙보다 좀더 위에 떠지도록 500이라는 값을 넣었음
		
	      window.open("jusoPopup.jsp", "popup", "width=300, height=300, left="+ popupX + ", top="+ popupY + ", screenX="+ popupX + ", screenY= "+ popupY);
	      
	   }
   
   function jusoCallBack(address){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.address.value = address;	
} */
   
   
   function aaaa(idName) { // enter시 콘솔 이동코드 . ex)아이디 입력창에서 엔터하면 비밀번호버튼으로 콘솔 이동
        if (window.event.keyCode == 13) { 
          document.getElementById(idName).focus();
        }
	
   }
   
   function enterkey() {  // enter시  자동으로 버튼이 눌러지는 경우를 배제하기 위한 코드. ex)아이디입력창에서 엔터시 비밀번호로 이동해야하지만 비밀번호찾기 버튼도 함께 눌러지는 경우 발생함. 
      var form = document.getElementById("insertForm");
      
      if(validationCheck()) {
          form.action = "memberInsert.do";
          form.submit();  
      }

   }

	   function validationCheck() { // 알림창을 위한 설정
	      var form = document.getElementById("insertForm");
	      
	      var id = form.id.value;
	      var pw = form.pw.value;
	      var nick = form.nick.value;
	      var address = form.address.value;
	      var phone = form.phone.value;
	      var name = form.name.value;
	      var email = form.email.value;
	      
	      if (id == ""){
	         alert("ID를 입력해 주세요. 최소 4자리 이상 입력해야 됩니다.");
	         return false;
	         
	      }else if ((id.length < 4 )|| (id.length >16)) {
	         alert("ID는 4 ~ 16자리 입력해 주세요.");
	         return false;
	         
	      }else if (pw == ""){
	         alert("Password를 입력해 주세요. 최소 4자리 이상 입력해야 됩니다.");
	         return false;   
	      
	      }else if ((pw.length < 4) ||(pw.length >20)){
	         alert("Password는 4 ~ 20자리 입력해주세요.");
	         return false;
	      	           
	      }else if(nick == ""){
	         alert("별명을 입력해주세요. 별명은 최대 10자리 입력됩니다.");
	         return false;
	      
	      }else if (phone ==""){
		         alert("전화번호를 입력해주세요 .");
		         return false;
		         
	      }else if ((phone.length < 10)){
	         alert("전화번호는 '-' 없이  11자리 입력 해주세요.");
	         return false;
	         
	      }else if (name ==""){
		         alert("이름을 입력하세요.");
		         return false;    
	        
	      }
	      form.action="memberInsert.do";
	      form.method = "post";	      
	      return true;
	   }
</script>

</head>
<body>
   <div class="login-page">
      <div class="form">
         <form id="insertForm" class="login-form" action="memberInsert.do" method="post">
            <input type="text" placeholder="ID" disabled="disabled" style="width:159pt;" onblur="test(this.value)" maxlength="16" id="frontId" /> 
            <input type="hidden" name = "id" id="id" /> 
        	<input type="button" value="중복확인" onclick="dupsCheck()" style="width:40pt;height:20pt; font-size: 11px; padding:0 0 0 2px;" />
        	
            <input type="password" name = "user_pw" placeholder="Password" maxlength="20" id="pw" onkeyup="aaaa('nick')"/> 
            <input type="text" name = "user_nick" placeholder="Nickname" maxlength="10" id="nick" onKeyup="aaaa('address')"/>
            
            <input type="text" name = "user_address" placeholder="Address 생략가능합니다." style="background-color: Cornsilk" maxlength="100" id="address" onKeyup="aaaa('phone')"/>
            <!-- <input type="text" placeholder="Address" disabled="disabled" maxlength="100" id="frontaddress"/>
            <input type="hidden" name = "address" id="address" />
        	<input type="button" value="주소검색" onclick="addressCheck()" style="width:60pt;height:30pt;"/> -->
        	
            <input type="text" name = "user_phone" placeholder="Phone Number ( without '-' )" maxlength="11" id="phone" onKeyup="aaaa('name')"/>
            <input type="text" name = "user_name" placeholder="Name" maxlength="20" id="name" onKeyup="aaaa('email')"/>
            <input type="text" name = "user_email" placeholder="Email address 생략가능합니다." style="background-color: Cornsilk" maxlength="45" id="email" onKeyup="aaaa('user_gender')"/>
           
            <select name="user_gender" id="user_gender" style=" width:267px; height:45px;  background: #f2f2f2;  font-size: 14px; ">
				<option value="1">여자</option>
                <option value="2">남자</option>
           	</select> 
			<p/>
		</form>
            <input type="button" style="cursor:pointer; background-color :#FFD700; color: #ffffff" onclick="enterkey()" value="회원가입" />
            <p class="message">로그인하시겠습니까? <a href="memberloginForm.do">로그인</a></p>
            <p class="message"><a href="index.jsp">메인화면</a>
            </p>
      </div>
   </div>
</body>
</html>