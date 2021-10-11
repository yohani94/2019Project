package kr.ac.knu.qnacommand;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.entity.MemberEntity;

public class FaqInsertFormCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
	      MemberEntity member = (MemberEntity)session.getAttribute("member");
	      
	      ActionForward action = new ActionForward();
	      
	      try 
	      {
	        request.setCharacterEncoding("euc-kr");
	      } 
	      catch (Exception e) 
	      {
	         e.printStackTrace();
	      }
	      
	      if(member == null) {
	 	         action.setPath("memberloginForm.do");
	 	         action.setSend(true);
	      }
	      else {
	    	  
	    	  try 
		  		{
		            request.setCharacterEncoding("UTF-8");
		         } 
		  		catch (UnsupportedEncodingException e) 
		  		{
		            e.printStackTrace();
		         }
	      
	      if(member.getMaster() != 1) {
	         action.setPath("qnaList.do");
	         action.setSend(true);
	         
	      } 
	      else {
	         action.setPath("WEB-INF/faqInsertForm.jsp");
	         action.setSend(false);
	      }
	      }
	      return action;
	      
	      
	   }
}
