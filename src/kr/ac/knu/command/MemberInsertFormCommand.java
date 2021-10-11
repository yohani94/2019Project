package kr.ac.knu.command;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;

public class MemberInsertFormCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward action = new ActionForward();
		try {
			request.setCharacterEncoding("UTF-8");
		
		action.setPath("WEB-INF/memberInsertForm.jsp");
		action.setSend(false);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return action;
	}

}
