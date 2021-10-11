package kr.ac.knu.qnacommand;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.BoardDAO;
import kr.ac.knu.entity.*;
import kr.ac.knu.dao.QnaDAO;


public class QnaReplayCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session = request.getSession(); 
		MemberEntity member =
				(MemberEntity)session.getAttribute("member");
		
		ActionForward action = new ActionForward();
		
		String msg = "0";
		
		if(member == null) {
			action.setPath("memberloginForm.do");
			action.setSend(true);
		}else {
			try 
	  		{
	            request.setCharacterEncoding("UTF-8");
	         } 
	  		catch (UnsupportedEncodingException e) 
	  		{
	            e.printStackTrace();
	         }
		
			String id = request.getParameter("id");
			String type = request.getParameter("type");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String qna_pas = request.getParameter("qna_pas");
			String idid = member.getId();
			String step = request.getParameter("step");
			String ref = request.getParameter("ref");
			
			System.out.println(step);
			System.out.println(ref);
			
			QnaDAO dao = new QnaDAO();
			QnaEntity qna = new QnaEntity();
			
			qna.setId(Integer.parseInt(id));
			qna.setType(type);
			qna.setTitle(title);
			qna.setContent(content);
			qna.setMembers_id(idid);
			qna.setQna_pas(qna_pas);
			qna.setStep(Integer.parseInt(step) + 1);
			qna.setRef(Integer.parseInt(ref));
			
			request.setAttribute("qna", qna);
			
			int result = dao.reply( qna );
			
			if(result ==1 ) {
				action.setPath("qnaList.do#qnabbs");
				action.setSend(true);
			}else {
				 msg = "40";
	        	 action.setPath("WEB-INF/qnaReplyForm.jsp?msg="+msg);
		         action.setSend(false);
			}
			
		}		
		return action;
	}

}