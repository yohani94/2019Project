package kr.ac.knu.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.MemberDAO;
import kr.ac.knu.entity.MemberEntity;

public class MemberIdCheckCommand implements Command {

 public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
    {
  
  
  ActionForward action = new ActionForward();
  
             
       String id = request.getParameter("id");
        
        MemberDAO dao = new MemberDAO();
        
        String stNo = dao.IdCheck(id);

             action.setPath("memberIdCheck.jsp"); 
             action.setSend(false);

             request.setAttribute("stNo", stNo);
             System.out.println("===> " + stNo);
             

       return action;
 }

}
