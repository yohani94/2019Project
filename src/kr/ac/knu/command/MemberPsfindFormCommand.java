package kr.ac.knu.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;

public class MemberPsfindFormCommand implements Command {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
   {	
	   String msg = request.getParameter("msg");
	   
      ActionForward action = new ActionForward();
       action.setPath("WEB-INF/memberPsfindForm.jsp?msg="+msg);
       action.setSend(false);
       return action;
   }

}