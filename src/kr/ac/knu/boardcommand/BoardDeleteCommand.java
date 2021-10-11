package kr.ac.knu.boardcommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.BoardDAO;
import kr.ac.knu.entity.MemberEntity;

public class BoardDeleteCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberEntity member = 
				(MemberEntity)session.getAttribute("member");
		
		ActionForward action = new ActionForward();
		
		if(member == null) {
			action.setPath("memberloginForm.do?msg=2"); //로그인해주세요  창
	        action.setSend(true);
		} else {
			String dog_number = request.getParameter("dog_number");
			
			BoardDAO dao = new BoardDAO();
			int result = dao.delete(dog_number, member.getId());
			
			if(result == 1) {
				action.setPath("boardList.do");
				action.setSend(true);
				
			} else {
				action.setPath("WEB-INF/error.jsp");
				action.setSend(false);
			}
		}
		
		return action;
	}

}
