package kr.ac.knu.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.MemberDAO;
import kr.ac.knu.entity.MemberEntity;

public class MemberIdfindCommand implements Command {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
   {
      
      
      ActionForward action = new ActionForward();
      
      try {
			request.setCharacterEncoding("utf-8");

      String username = request.getParameter("user_name");
       String userphone = request.getParameter("user_phone");
       
       MemberDAO dao = new MemberDAO();
       
       String stNo = dao.idHunt(userphone,username);
       
       int check = dao.idFind(username, userphone);
       
       if((stNo != null)) { 
    	   request.setAttribute("stNo", stNo);
           
           action.setPath("WEB-INF/memberIDFind.jsp");
           action.setSend(false);
         }else if(check==0) {    
        	 action.setPath("memberIdfindForm.do?msg=0"); 
             action.setSend(false);
         }else {
        	 action.setPath("memberIdfindForm.do?msg=-1"); 
             action.setSend(false);
         }
      } catch (Exception e) {
			e.printStackTrace();
		}
      return action;
   }

}