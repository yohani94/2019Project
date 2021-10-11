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

public class FaqUpdateCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
	
	{
		HttpSession session = request.getSession();
	      MemberEntity member = 
	            (MemberEntity)session.getAttribute("member");
		
		ActionForward action = new ActionForward();
		
		 String msg = "0";
			
		
		if( member == null ) {
	         action.setPath("memberloginForm.do");
	         action.setSend(true);
	         
	      } else {
		try 
		{
          request.setCharacterEncoding("UTF-8");
       } 
		catch (UnsupportedEncodingException e) 
		{
          e.printStackTrace();
       }
       
      
      	 	 String faq_number = request.getParameter("faq_number");
      	 	 String faq_type = request.getParameter("faq_type");
      	 	 String faq_title = request.getParameter("faq_title");
      	 	 String faq_content = request.getParameter("faq_content");
   
	         FaqEntity faq = new FaqEntity();
	        
	         faq.setFaq_number(Integer.parseInt(faq_number));
	         faq.setFaq_type(faq_type);
	         faq.setFaq_title(faq_title);
	         faq.setFaq_content(faq_content);
	         
	         FaqDAO dao = new FaqDAO();
	         
	          request.setAttribute("faq", faq);
	          
	         int result = dao.update(faq);
       
		         if(result == 1) 
		         {
		            action.setPath("faqList.do#faqbbs");
		            action.setSend(true); 
		         } 
		         else 
		         { 
		        	 msg = "30";
		        	 action.setPath("WEB-INF/faqUpdateForm.jsp?msg="+msg);
			         action.setSend(false);
		         }
 
     
	      }
    return action;
		
	}

}
