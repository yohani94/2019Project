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


public class FaqListCommand implements Command {

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
		try 
		{
			request.setCharacterEncoding("euc-kr");
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		
	   
	   FaqDAO daoa = new FaqDAO();
	   

	   
		String ppgg = request.getParameter("ppage");
		
		String ftype = request.getParameter("ftype");
		
		
		if(ftype == null) {
			ftype = "%%";
		}
		
		
		int ccurPage = 1;
		int sscope = 15;
		
		
		
		if(ppgg != null) {
			ccurPage = Integer.parseInt(ppgg);
		}
		
		Object oobj = session.getAttribute("sscope");
		
		if(oobj != null) {
			sscope = (Integer)oobj;
		}

		session.setAttribute("sscope", sscope);
		
		int ppageScope = 5;

		int sstartNum = (ccurPage-1)*sscope +1;

        ArrayList<FaqEntity> lista = daoa.selectAll(sstartNum, sscope, ftype);

        request.setAttribute("lista", lista);

		int ttotalRow = daoa.totalRow(ftype);
		int ttotalPage = (ttotalRow-1)/sscope +1;
		int sstartPageNum = ((ccurPage -1)/ppageScope)*ppageScope +1 ;
		

		request.setAttribute("ttotalPage",ttotalPage);
		request.setAttribute("sstartPageNum",sstartPageNum);
		request.setAttribute("ppageScope",ppageScope);
		request.setAttribute("ccurPage", ccurPage);
		request.setAttribute("ftype",ftype);
		
		System.out.println("≈‰≈ª∆‰¿Ã¡ˆ");
		System.out.println(request.getParameter("ttotalPage"));
		System.out.println(request.getParameter("ssrartPageNum"));
		System.out.println(request.getParameter("ppageScope"));
        
        action.setPath("WEB-INF/faqList.jsp");
        action.setSend(false);
        
		}
        return action;
	 }

}

