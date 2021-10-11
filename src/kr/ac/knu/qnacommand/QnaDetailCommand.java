package kr.ac.knu.qnacommand;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.QnaDAO;
import kr.ac.knu.entity.*;

public class QnaDetailCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session = request.getSession();
		MemberEntity member = 
						(MemberEntity)session.getAttribute("member");
		
		ActionForward action = new ActionForward();
		
		if(member == null) {
			action.setPath("memberloginForm.do");
			action.setSend(true);
		}
		
		else {
		
			String id = request.getParameter("id");
			
			String ppss = request.getParameter("ppss");
			
			String check = request.getParameter("check");
			
			QnaDAO dao = new QnaDAO();
			
			QnaEntity qna = dao.select(Integer.parseInt(id));
			
			QnaEntity qnaa = dao.selectt(qna.getRef());
			
			request.setAttribute("qnaa", qnaa);
			
			request.setAttribute("qna", qna);
			
			if(member.getId().equals("master") || qna.getStep() == 0) {
				action.setPath("WEB-INF/qnaDetail.jsp");
				action.setSend(false);	
				
			}
			else {
				if(check != null && check.equals("true")) {
					action.setPath("WEB-INF/qnaDetail.jsp");
					action.setSend(false);	
				}			
			}
		}
		return action;
	}

}
