package kr.ac.knu.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.MemberDAO;
import kr.ac.knu.entity.MemberEntity;

public class MemberPsfindCommand implements Command {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
   {
     
      ActionForward action = new ActionForward();
      
      try {
			request.setCharacterEncoding("utf-8");
      
      String idid = request.getParameter("id");
      String username = request.getParameter("user_name");
      String userphone = request.getParameter("user_phone");
       
       MemberDAO dao = new MemberDAO();
       
       String stNo = dao.psHunt(idid,userphone,username);
       
       int check = dao.pwFind(idid, username, userphone);
       
       if(stNo != null) {
          request.setAttribute("stNo", stNo);
           
           action.setPath("WEB-INF/memberPsfind.jsp");
           action.setSend(false);
         }else if(check==0){ 
           action.setPath("memberPsfindForm.do?msg=0"); // 
            action.setSend(false);
         }else {
            action.setPath("memberPsfindForm.do?msg=-1"); 
             action.setSend(false);
         }
   } catch (Exception e) {
		e.printStackTrace();
	}
  
      return action;
   }

}