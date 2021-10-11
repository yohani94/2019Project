package kr.ac.knu.boardcommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.CommentDAO;
import kr.ac.knu.entity.CommentEntity;
import kr.ac.knu.entity.MemberEntity;

public class CommentDeleteCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberEntity member = 
				(MemberEntity)session.getAttribute("member");
		
		ActionForward action = new ActionForward();
		
		String dog_number = request.getParameter("dog_number");
		String com_num = request.getParameter("com_num");
		String idid = member.getId();
			
		CommentDAO dao = new CommentDAO();
		CommentEntity comment = dao.select(Integer.parseInt(com_num));
	      
	      request.setAttribute("comment", comment);
	      
	      if(comment.getStep() == 0) 
	      {
	         if(member.getMaster() == 1 || idid.equals(comment.getMembers_id())) 
	            {
	                  int result = dao.delete(com_num);
	                  int result1 = dao.deletere(comment);
	                  
	                  if(result == 1) 
	                  {
	                     action.setPath("boardDetail.do?dog_number=" + dog_number);
	                     action.setSend(true);
	                        
	                  } 
	                  else 
	                  {
	                     action.setPath("WEB-INF/error.jsp");
	                     action.setSend(false);
	                  }
	            
	            }
	         else 
	         {
	            action.setPath("boardDetail.do?dog_number=" + dog_number);
	            action.setSend(true);
	         }
	      }
	      else if(comment.getStep()  == 1)
	      {
	         if(member.getMaster() == 1 || idid.equals(comment.getMembers_id())) 
	         {
	               int result = dao.delete(com_num);
	               
	               if(result == 1) 
	               {
	                  action.setPath("boardDetail.do?dog_number=" + dog_number);
	                  action.setSend(true);
	                     
	               } 
	               /*else 
	               {
	                  code = "3";
	                  action.setPath("WEB-INF/error.jsp?code="+code);
	                  action.setSend(false);
	               }*/
	         }
	         else
	         {
	            action.setPath("boardDetail.do?dog_number=" + dog_number);
	            action.setSend(true);
	         }      
	      }
	      return action;
	}
}
