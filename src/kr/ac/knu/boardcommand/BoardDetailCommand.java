package kr.ac.knu.boardcommand;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.BoardDAO;
import kr.ac.knu.dao.CommentDAO;
import kr.ac.knu.dao.QnaDAO;
import kr.ac.knu.entity.BoardEntity;
import kr.ac.knu.entity.CommentEntity;
import kr.ac.knu.entity.MemberEntity;
import kr.ac.knu.entity.QnaEntity;

public class BoardDetailCommand implements Command {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

      HttpSession session = request.getSession();
      MemberEntity member = (MemberEntity) session.getAttribute("member");
      
      ActionForward action = new ActionForward();

      if (member == null) {
         action.setPath("memberloginForm.do?msg=2"); //
           action.setSend(true);
           } else {
              
              String dog_number = request.getParameter("dog_number");
              String animaltype1 = request.getParameter("animaltype1");
            
              System.out.println(animaltype1);
              
            BoardDAO dao = new BoardDAO();
            BoardEntity board = dao.select(Integer.parseInt(dog_number));
            BoardEntity board2 = new BoardEntity();
            BoardEntity board3 = new BoardEntity();
            String animaltype = board.getAnimaltype();
            
            board2 = dao.select2(Integer.parseInt(dog_number), animaltype1);
            board3 = dao.select3(Integer.parseInt(dog_number), animaltype1); 
            
            if(member.getMaster() == 1) {
               
            }
            else {
               if(board2 != null) {
                  if(board2.getMembers_id().equals(member.getId())){
                     }else{
                        board2 = dao.select4(Integer.parseInt(dog_number), animaltype1);   
                     }
               }if(board3 != null) {
                  if(board3.getMembers_id().equals(member.getId())){
                     }else{
                        board3 = dao.select5(Integer.parseInt(dog_number), animaltype1);   
                     }
               }
            }
      
            BoardEntity   board1 = new BoardEntity();
            board1.setDog_number(Integer.parseInt(dog_number));
         
            CommentDAO dao1 = new CommentDAO();
            
            String column = request.getParameter("column");
            String keyword = request.getParameter("keyword");
            String pg = request.getParameter("page");
            String pScope = request.getParameter("pScope");

            int curPage = 1;
            int scope = 30;
            
            if(column == null) {
               column = "comment_content";
            }
            if(keyword == null) {
               keyword = "";
            }
            
            if (pg != null) {
               curPage = Integer.parseInt(pg);
            }

            Object obj = session.getAttribute("scope");

            if (obj != null) {
               scope = (Integer) obj;
            }

            if (pScope != null) {
               scope = Integer.parseInt(pScope);
               session.setAttribute("scope", scope);
            }

            int pageScope = 5;

            int startNum = (curPage - 1) * scope + 1;

            ArrayList<CommentEntity> list = dao1.selectAll(board1,startNum, scope);
            
            int totalRow = dao1.totalRow(column, keyword,board1);

            int totalPage = (totalRow - 1) / scope + 1;
            int startPageNum = ((curPage - 1) / pageScope) * pageScope + 1;

            request.setAttribute("list", list);

            request.setAttribute("totalPage", totalPage);
            request.setAttribute("startPageNum", startPageNum);
            request.setAttribute("pageScope", pageScope);
            request.setAttribute("curPage", curPage);
            request.setAttribute("column", column);
            request.setAttribute("keyword", keyword);
            request.setAttribute("scope", scope);
            request.setAttribute("animaltype1",animaltype1);
            
            ////////////////////////////////////////////
            
            request.setAttribute("board", board);
            request.setAttribute("board2", board2);
            request.setAttribute("board3", board3);
            request.setAttribute("member", member);
            
            
            
            action.setPath("WEB-INF/boardDetail.jsp");
            action.setSend(false);
      }

      return action;
   }
}