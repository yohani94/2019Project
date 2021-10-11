package kr.ac.knu.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;

public class MemberLogoutCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward action = new ActionForward();
	      request.getSession().invalidate();
	      
	      action.setPath("index.jsp");
	      action.setSend(false);   
	      
	      return action;
	}

}
