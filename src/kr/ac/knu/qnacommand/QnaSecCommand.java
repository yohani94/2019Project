package kr.ac.knu.qnacommand;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.entity.*;
import kr.ac.knu.dao.QnaDAO;


public class QnaSecCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session = request.getSession(); 
		MemberEntity member = (MemberEntity)session.getAttribute("member");
		
		ActionForward action = new ActionForward();
		
		String msg = "0";
		
		if(member == null) {
			action.setPath("memberloginForm.do");
			action.setSend(true);
		}else {
	
		String ppss = request.getParameter("ppss");
		String id = request.getParameter("id");
		
		QnaDAO dao = new QnaDAO();
		
		QnaEntity qna = dao.select(Integer.parseInt(id));
		
		if(ppss != null && qna.getQna_pas().equals(ppss)) {
			
			boolean check = false;
			
			if(ppss != null) {
				check = qna.getQna_pas().equals(ppss);
			}
			
			request.setAttribute("check", check);
		}else {
			msg = "55";
		}
		
		action.setPath("qnaSec.jsp?msg="+msg);
		action.setSend(false);
		}
		return action;
	}

}
