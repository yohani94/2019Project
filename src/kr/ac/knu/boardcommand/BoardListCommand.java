package kr.ac.knu.boardcommand;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.BoardDAO;
import kr.ac.knu.entity.BoardEntity;
import kr.ac.knu.entity.MemberEntity;

public class BoardListCommand implements Command {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

      HttpSession session = request.getSession();
      MemberEntity member = (MemberEntity) session.getAttribute("member");

      ActionForward action = new ActionForward();

      if (member == null) {
         action.setPath("memberloginForm.do?msg=2"); //
           action.setSend(true);
      } else {
         
         
         BoardDAO dao = new BoardDAO();
         String column = request.getParameter("column");
         String keyword = request.getParameter("keyword");
         String pg = request.getParameter("page");
         String pScope = request.getParameter("pScope");
         String animaltype = request.getParameter("animaltype");
         String comple = request.getParameter("comple");
         
         
         if(comple == null) {
            comple = "";
         }
         
         if(animaltype == null) {
            animaltype="";
         }
         if (column == null) {
            column = "dog_title";
         }
         if (keyword == null) {
            keyword = "";
         }

         int curPage = 1;
         int scope = 12;

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

         ArrayList<BoardEntity> list = dao.selectAll(column, keyword, startNum, scope, animaltype,comple);

         request.setAttribute("list", list); 
         
         session.setAttribute("member", member);
         
         
         
         int totalRow = dao.totalRow(column, keyword,animaltype);

         int totalPage = (totalRow - 1) / scope + 1;
         int startPageNum = ((curPage - 1) / pageScope) * pageScope + 1;

         request.setAttribute("totalPage", totalPage);
         request.setAttribute("startPageNum", startPageNum);
         request.setAttribute("pageScope", pageScope);
         request.setAttribute("curPage", curPage);
         request.setAttribute("column", column);
         request.setAttribute("keyword", keyword);
         request.setAttribute("scope", scope);
         request.setAttribute("animaltype", animaltype);
         request.setAttribute("comple", comple);

         action.setPath("WEB-INF/dogList.jsp"); // jsp
         action.setSend(false);
      }
      return action;
   }

}