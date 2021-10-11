package kr.ac.knu.qnacommand;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.FaqDAO;
import kr.ac.knu.dao.QnaDAO;
import kr.ac.knu.entity.FaqEntity;
import kr.ac.knu.entity.MemberEntity;
import kr.ac.knu.entity.QnaEntity;

public class FaqUpdateFormCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session = request.getSession();
		
	      MemberEntity member = 
	            (MemberEntity)session.getAttribute("member");
		
		ActionForward action = new ActionForward();
		
		if( member == null ) {
	         action.setPath("memberloginForm.do");
	         action.setSend(true);
	         
	      } else {
			try 
			{
	          request.setCharacterEncoding("euc-kr");
	        } 
			catch (UnsupportedEncodingException e) 
			{
	          e.printStackTrace();
	        }
			
		String faq_number = request.getParameter("faq_number");
        FaqDAO dao = new FaqDAO();
        FaqEntity faq = dao.select(Integer.parseInt(faq_number));
        
        request.setAttribute("faq", faq);
        
        String idid = member.getId();
        
        if(idid.equals("master")) {
        action.setPath("WEB-INF/faqUpdateForm.jsp");
        action.setSend(false);
        }
        else {
        action.setPath("WEB-INF/error.jsp");
		  action.setSend(false);	  
        }
     }
	return action;
	}

}
