package kr.ac.knu.boardcommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.BoardDAO;
import kr.ac.knu.entity.BoardEntity;
import kr.ac.knu.entity.MemberEntity;

public class BoardUpdateFormCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
	      MemberEntity member = 
	            (MemberEntity)session.getAttribute("member");
	      
	      ActionForward action = new ActionForward();
	     
	      if( member == null ) {
	         action.setPath("memberloginForm.do?msg=2");
	         action.setSend(true);
	         
	      } else {
	    	  
	    	  try 
		      {
		        request.setCharacterEncoding("utf-8");
		          String dog_number = request.getParameter("dog_number");
		          BoardDAO dao = new BoardDAO();
		          BoardEntity board = dao.select(Integer.parseInt(dog_number));
		          
		          request.setAttribute("board", board);
		          
		          action.setPath("WEB-INF/boardUpdateForm.jsp?dog_number="+dog_number);
		          action.setSend(false);
		
		      } catch (Exception e) {
		         e.printStackTrace();
		      }  
	       }
		return action;
	}

}
