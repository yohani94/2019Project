package kr.ac.knu.qnacommand;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.entity.*;

public class QnaInsertFormCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
	{
		
		HttpSession session = request.getSession();
	      MemberEntity member = (MemberEntity)session.getAttribute("member");
	      
	      ActionForward action = new ActionForward();
	      
	      if(member == null) {
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
	    	  
	         action.setPath("WEB-INF/qnaInsertForm.jsp");
	         action.setSend(false);
	      }
	      
	      return action;
	   }

}
