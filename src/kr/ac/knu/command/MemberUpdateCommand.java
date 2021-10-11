package kr.ac.knu.command;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.MemberDAO;
import kr.ac.knu.entity.MemberEntity;

public class MemberUpdateCommand implements Command {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward action = new ActionForward();
		try {
			request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		MemberEntity member = 
				(MemberEntity)session.getAttribute("member");

		if( member == null ) {
			action.setPath("memberloginForm.do");
			action.setSend(true);
			
		} else {
			
			try {
				String pw = request.getParameter("user_pw");
				String address = request.getParameter("user_address");
				String phone = request.getParameter("user_phone");
				String email = request.getParameter("user_email");
				String gender = request.getParameter("user_gender");
				String id = request.getParameter("id");
				
				member = new MemberEntity();
				member.setPw(pw);
				member.setAddress(address);
				member.setPhone(phone);
				member.setEmail(email);
				member.setGender(gender);
				member.setId(id);
				
				MemberDAO dao = new MemberDAO();
				int result = dao.update(member);
				
				if(result == 1) {
					action.setPath("memberUpdateForm.do?id=" + id); // id 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎄꺅占쎈쐻�뜝占�.
					action.setSend(true);
					
				} else {
					action.setPath("memberloginForm.do");
					action.setSend(true);
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return action;
	}
}