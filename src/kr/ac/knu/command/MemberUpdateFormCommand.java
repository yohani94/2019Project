package kr.ac.knu.command;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.MemberDAO;
import kr.ac.knu.entity.MemberEntity;

public class MemberUpdateFormCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward action = new ActionForward();
		try {
			request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		MemberEntity member = 
				(MemberEntity)session.getAttribute("member");

		if( member == null ) {
			action.setPath("memberloginForm.do?msg=2"); 
	        action.setSend(true);

		} else {
			String id = request.getParameter("id");

			MemberDAO dao = new MemberDAO();
			member= dao.select(id);

			request.setAttribute("member", member);

			action.setPath("WEB-INF/memberUpdateForm.jsp");
			action.setSend(false);
		}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return action;
	}
}
