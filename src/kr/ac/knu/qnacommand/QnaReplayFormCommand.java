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


public class QnaReplayFormCommand implements Command {

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
		
		QnaDAO dao = new QnaDAO();
		
		QnaEntity qna = dao.select(Integer.parseInt(id));
		
		QnaEntity qnaa = dao.selectt(qna.getRef());
		
		request.setAttribute("qnaa", qnaa);
		
		request.setAttribute("qna", qna);
		
		if(member.getMaster() == 0) 
			{
			action.setPath("WEB-INF/qnaDetail.jsp");
			action.setSend(false);
			}
			else 
			{
			action.setPath("WEB-INF/qnaReplyForm.jsp?");
			action.setSend(false);
			}
		}
		return action;
	}

}


