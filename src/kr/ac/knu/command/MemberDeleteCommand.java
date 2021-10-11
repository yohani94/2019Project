package kr.ac.knu.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.MemberDAO;
import kr.ac.knu.entity.MemberEntity;

public class MemberDeleteCommand implements Command {

	public ActionForward execute(HttpServletRequest request , HttpServletResponse response) {
		HttpSession session = request.getSession(); 
		MemberEntity member =
				(MemberEntity)session.getAttribute("member");
		
		ActionForward action = new ActionForward();
		
		if(member == null) {
			action.setPath("memberloginForm.do?msg=2"); //로그인해주세요  창
	        action.setSend(true);
		}else {
			String id = request.getParameter("id");
			
			MemberDAO dao = new MemberDAO();
			
			int result = dao.delete(id);
			
		
			if(result == 1) {
				session.invalidate();
				action.setPath("index.jsp");
				action.setSend(true);
			}else {
				action.setPath("memberUpdateForm.do");
				action.setSend(false);
			}
		}
		return action;
	}

}
