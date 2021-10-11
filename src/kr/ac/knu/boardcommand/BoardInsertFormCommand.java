package kr.ac.knu.boardcommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.entity.MemberEntity;

public class BoardInsertFormCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session = request.getSession();
	      MemberEntity member = (MemberEntity)session.getAttribute("member");
	      
	      ActionForward action = new ActionForward();

	      if(member == null) {
	    	  action.setPath("memberloginForm.do?msg=2"); //
		        action.setSend(true);
	         
	      } else {
	         action.setPath("WEB-INF/boardInsertForm.jsp");
	         action.setSend(false);
	      }
	      
	      return action;
	   }

}
