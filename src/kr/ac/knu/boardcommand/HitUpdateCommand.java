package kr.ac.knu.boardcommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.BoardDAO;
import kr.ac.knu.entity.MemberEntity;

public class HitUpdateCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(); 
		MemberEntity member =
				(MemberEntity)session.getAttribute("member");
		
		ActionForward action = new ActionForward();
		
		if(member == null) {
			action.setPath("memberloginForm.do?msg=2"); //로그인해주세요  창
	        action.setSend(true);
		}else {
						
			String dog_number = request.getParameter("dog_number");
			String animaltype1 = request.getParameter("animaltype1");
			
			BoardDAO dao = new BoardDAO();
			dao.hitUpdate(dog_number);
			
			action.setPath("boardDetail.do?dog_number=" + dog_number+"&animaltype1="+animaltype1);
			action.setSend(true);
		}
		return action;
	}
}
