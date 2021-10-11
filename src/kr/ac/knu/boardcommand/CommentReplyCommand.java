package kr.ac.knu.boardcommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.CommentDAO;
import kr.ac.knu.dao.QnaDAO;
import kr.ac.knu.entity.BoardEntity;
import kr.ac.knu.entity.CommentEntity;
import kr.ac.knu.entity.MemberEntity;
import kr.ac.knu.entity.QnaEntity;

public class CommentReplyCommand implements Command {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      HttpSession session = request.getSession();
      MemberEntity member = (MemberEntity) session.getAttribute("member");

      ActionForward action = new ActionForward();

      if (member == null) {
         action.setPath("memberloginForm.do?msg=2"); // 
         action.setSend(true);
      } else {
         try {
            request.setCharacterEncoding("utf-8");
            String comment_content = request.getParameter("comment_content");
            String dog_number = request.getParameter("dog_number");
            String step = request.getParameter("step");
            String ref = request.getParameter("ref");
            System.out.println(ref+"ref값");
            
            CommentEntity comment = new CommentEntity();
   
            comment.setComment_content(comment_content);
            comment.setStep(Integer.parseInt(step)+1);
            comment.setMembers_id(member.getId());
            comment.setRef(Integer.parseInt(ref));
            
            System.out.println(comment.getCom_num()+"sadfjk;ladjsflkjfasd");
            BoardEntity board = new BoardEntity();
            board.setDog_number(Integer.parseInt(dog_number));
            
            
            CommentDAO dao = new CommentDAO();
            int result = dao.Reply(comment,board,member.getId(),ref);
            
            
            if (result == 1) {
               action.setPath("boardDetail.do?dog_number=" + dog_number);
               action.setSend(true);
   
            } else {
               action.setPath("WEB-INF/error.jsp");
               action.setSend(false);
            }
         }catch (Exception e) {
            e.printStackTrace();
         }
      }

      return action;
   }

}