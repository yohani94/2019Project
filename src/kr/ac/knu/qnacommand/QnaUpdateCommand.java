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


public class QnaUpdateCommand implements Command {

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
	    	  
        
        	 String id = request.getParameter("id");
        	 String type = request.getParameter("type");
             String title = request.getParameter("title");
             String content = request.getParameter("content");
             String qna_pas = request.getParameter("qna_pas");
             String ref = request.getParameter("ref");
     
	         QnaEntity qna = new QnaEntity();
	         qna.setId( Integer.parseInt(id));
	         qna.setType(type);
	         qna.setTitle(title);
	         qna.setContent(content);
	         qna.setQna_pas(qna_pas);
	         qna.setRef(Integer.parseInt(ref));
	         
	         QnaDAO dao = new QnaDAO();
	         
	         request.setAttribute("qna", qna);
	         
	        if(qna_pas.length() == 0) {
	        	 msg = "21";
	        	 action.setPath("WEB-INF/qnaUpdateForm.jsp?msg="+msg);
		         action.setSend(false);
	         }
	         
	         int result = dao.update(qna);
	         int result1 = dao.updateRe(qna);
	         

		         if(result == 1) 
		         {
		            action.setPath("qnaList.do");
		            action.setSend(true); 
		         } 
		         else 
		         { 
		        	 msg = "22";
		        	 action.setPath("WEB-INF/qnaUpdateForm.jsp?msg="+msg);
			         action.setSend(false);
		         }

	      }
      return action;
   }

}

