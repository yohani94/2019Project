package kr.ac.knu.qnacommand;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.QnaDAO;
import kr.ac.knu.entity.*;


public class QnaUpdateFormCommand implements Command {

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
		          request.setCharacterEncoding("euc-kr");
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
	          
	          String idid = member.getId();
	          String members_id = qna.getMembers_id();
	        
	          if(idid.equals(members_id)) {
	          action.setPath("WEB-INF/qnaUpdateForm.jsp");
	          action.setSend(false);
	          }
	          else {
	          msg = "5";
	  		  action.setPath("WEB-INF/qnaDetail.jsp?msg="+msg);
	  		  action.setSend(false);	  
	          }
	       }
	      
		
		return action;
	}

}
