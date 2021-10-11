package kr.ac.knu.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.QnaDAO;
import kr.ac.knu.entity.MemberEntity;
import kr.ac.knu.entity.QnaEntity;

public class MemberQnaFormCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session = request.getSession();
		MemberEntity member = 
						(MemberEntity)session.getAttribute("member");
		
		ActionForward action = new ActionForward();
		
		if(member == null) 
		{
			action.setPath("memberloginForm.do");
			action.setSend(true);
		}
		
		else 
		{
			try 
			{
				request.setCharacterEncoding("euc-kr");
			}
			catch(Exception e) 
			{
				e.printStackTrace();
			}
			
			QnaDAO dao = new QnaDAO();

			String pg = request.getParameter("page");
			
			int curPage = 1; 
			int scope = 20; 
			
			if(pg != null) {
				curPage = Integer.parseInt(pg);
			}
			
			
			Object obj = session.getAttribute("scope"); 
			
			
			if(obj != null){
				scope = (Integer)obj;
			} 
			session.setAttribute("scope", scope);
			
			int pageScope = 5; 
			
			int startNum = (curPage-1) * scope +1;
			
			String id = member.getId();
			
			System.out.println(id);
			System.out.println(startNum);
			System.out.println(scope);
			
			ArrayList<QnaEntity> listaa = dao.selectAlll(id,startNum,scope);
			
			request.setAttribute("listaa", listaa);
			
			int totallRow = dao.totallRow(id);
			
			int totalPage = (totallRow-1) / scope +1;
			
			int startPageNum = ((curPage -1) / pageScope) * pageScope + 1 ; //
			
			request.setAttribute("totalPage",totalPage);
			request.setAttribute("startPageNum",startPageNum);
			request.setAttribute("pageScope",pageScope);
			request.setAttribute("curPage", curPage);
			request.setAttribute("member", member);
			
			action.setPath("WEB-INF/memberQnaForm.jsp");
	        action.setSend(false);
		}
		
		return action;
	}

}
