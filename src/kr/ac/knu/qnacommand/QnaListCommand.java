package kr.ac.knu.qnacommand;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.BoardDAO;
import kr.ac.knu.dao.FaqDAO;
import kr.ac.knu.entity.*;
import kr.ac.knu.dao.QnaDAO;


public class QnaListCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session = request.getSession(); 
		MemberEntity member =
				(MemberEntity)session.getAttribute("member");
		
		ActionForward action = new ActionForward();
		
		if(member == null) {
			action.setPath("memberloginForm.do");
			action.setSend(true);
		}
		
		else {
		
	   QnaDAO dao = new QnaDAO();

	   String column = request.getParameter("column");
		String keyword = request.getParameter("keyword");
		String pg = request.getParameter("page");
		String pScope = request.getParameter("pScope");
		String Ttype = request.getParameter("Ttype");
			
		if(column == null) {
			column = "title";
		}
		if(keyword == null) {
			keyword="";
		}
		if(Ttype == null) {
			Ttype="%%";
		}
			
		int curPage = 1; 
		int scope = 20; 
		

		if(pg != null) {
			curPage = Integer.parseInt(pg);
		}
	
		Object obj = session.getAttribute("scope"); 
		
		
		if(obj != null){
			scope = (Integer)obj;
		} 
		
		if(pScope != null){
			scope = Integer.parseInt(pScope);
			session.setAttribute("scope", scope);
		} 
		

		int pageScope = 5; 
		
		int startNum = (curPage-1) * scope +1;
	   
        ArrayList<QnaEntity> list = dao.selectAll(column, keyword, startNum, scope,Ttype);
        
        request.setAttribute("list", list);
        
        int totalRow = dao.totalRow(column,keyword,Ttype);
		int totalPage = (totalRow-1) / scope +1;
		int startPageNum = ((curPage -1) / pageScope) * pageScope + 1 ; //

		
		request.setAttribute("totalPage",totalPage);
		request.setAttribute("startPageNum",startPageNum);
		request.setAttribute("pageScope",pageScope);
		request.setAttribute("curPage", curPage);
		request.setAttribute("column", column);
		request.setAttribute("Ttype", Ttype);
		request.setAttribute("keyword", keyword);
		
        action.setPath("WEB-INF/qnaList.jsp");
        action.setSend(false);
        
		}
        return action;
	 }

}
