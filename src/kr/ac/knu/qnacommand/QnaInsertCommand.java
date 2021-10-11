package kr.ac.knu.qnacommand;


import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.entity.*;
import kr.ac.knu.dao.QnaDAO;


public class QnaInsertCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session = request.getSession();
	      MemberEntity member =  (MemberEntity)session.getAttribute("member");
	      ActionForward action = new ActionForward();
	      
	      String msg = "0";
	      
	      if(member == null) 
	      {
	         action.setPath("memberloginForm.do");
	         action.setSend(true);
	      } 
	      else 
	      { 
	    	  
	    	  try 
		  		{
		            request.setCharacterEncoding("UTF-8");
		         } 
		  		catch (UnsupportedEncodingException e) 
		  		{
		            e.printStackTrace();
		         }
		              String type = request.getParameter("type");
		              String title = request.getParameter("title");
		              String content = request.getParameter("content");
		              String qna_pas = request.getParameter("qna_pas");
		              String members_id = member.getId();
			         
			         QnaEntity qna = new QnaEntity();
			         
			         qna.setType(type);
			         qna.setTitle(title);
			         qna.setContent(content);
			         qna.setMembers_id(members_id);
			         qna.setQna_pas(qna_pas);
			         
			         
			         QnaDAO dao = new QnaDAO();
			         
			         if(qna_pas.length() == 0) {
			        	 msg = "10";
			        	 action.setPath("WEB-INF/qnaInsertForm.jsp?msg="+msg);
				         action.setSend(false);
			         }
			         
			         int result = dao.insert(qna);
			   
			         if(result ==   1) {
			            action.setPath("qnaList.do#qnabbs");
			            action.setSend(true);
			            
			         } else {
			        	 msg = "11";
			        	 action.setPath("WEB-INF/qnaInsertForm.jsp?msg="+msg);
				         action.setSend(false);
			         }
                                       
	      }
		return action;
	}

}
