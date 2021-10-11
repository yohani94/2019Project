package kr.ac.knu.qnacommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.QnaDAO;
import kr.ac.knu.entity.*;
import kr.ac.knu.entity.QnaEntity;

public class QnaDeleteCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session = request.getSession();
		MemberEntity member = 
						(MemberEntity)session.getAttribute("member");
		
		ActionForward action = new ActionForward();
		
		String msg = "0";
		
		if(member == null) {
			action.setPath("memberloginForm.do");
			action.setSend(true);
		}
		
		else {
			
		String id = request.getParameter("id");
		String type = request.getParameter("type");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String qna_pas = request.getParameter("qna_pas");
        String ref = request.getParameter("ref");
        
		QnaDAO dao = new QnaDAO();
		
		QnaEntity qna = dao.select(Integer.parseInt(id));
		
		QnaEntity qnaa = dao.selectt(qna.getRef());
		
		request.setAttribute("qnaa", qnaa);
		
		request.setAttribute("qna", qna);
		
		System.out.println(qna.getStep());
		
		String members_id = qna.getMembers_id();
		String idid = member.getId();
		
		System.out.println(idid);
		System.out.println(members_id);
		
		if(qna.getStep() == 1)
		{
				if (idid.equals(members_id)) 
				{
					int result = dao.delete(id);
					
							if(result == 1) 
							{
									action.setPath("qnaList.do");
									action.setSend(true);
							}
							else
							{
								    action.setPath("WEB-INF/qnaDetail.jsp");
							}	
				}
				else {
					msg = "3";
					action.setPath("WEB-INF/qnaDetail.jsp?msg="+msg);
					action.setSend(false);
				}	
		}
		else if(qna.getStep() == 0)
		{
			if (idid.equals(members_id) || member.getMaster() == 1) 
			{
				int result = dao.delete(id);
				int result1 = dao.deletee(qna);
				
						if(result == 1) 
						{
								action.setPath("qnaList.do");
								action.setSend(true);
						}
						else
						{
							action.setPath("WEB-INF/qnaDetail.jsp");
						}	
			}
			else {
				msg = "2";
				action.setPath("WEB-INF/qnaDetail.jsp?msg="+msg);
				action.setSend(false);
			}	
		}
			
	}
	return action;
	}

}
