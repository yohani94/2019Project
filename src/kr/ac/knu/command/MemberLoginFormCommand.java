package kr.ac.knu.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;

public class MemberLoginFormCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
			
			String msg = request.getParameter("msg");
			
			ActionForward action = new ActionForward();
			action.setPath("WEB-INF/memberloginForm.jsp?msg="+msg);
			action.setSend(false);
			
			return action;
	}

}
