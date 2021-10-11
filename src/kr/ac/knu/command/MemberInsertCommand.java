package kr.ac.knu.command;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.MemberDAO;
import kr.ac.knu.entity.MemberEntity;

public class MemberInsertCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward action = new ActionForward();
		try {
			request.setCharacterEncoding("UTF-8");
		
			String id = request.getParameter("id");
			String pw = request.getParameter("user_pw");
			String nick = request.getParameter("user_nick");
			String address = request.getParameter("user_address");
			String phone = request.getParameter("user_phone");
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String gender = request.getParameter("user_gender");
			
			
			MemberEntity member = new MemberEntity();
			member.setId(id);
			member.setPw(pw);
			member.setNick(nick);
			member.setAddress(address);
			member.setPhone(phone);
			member.setName(name);
			member.setEmail(email);
			member.setGender(gender);
			
			MemberDAO dao = new MemberDAO();
			int result = dao.insert(member);
			
			
			
			if(result == 1) {
				action.setPath("loginSuccess.html");
				action.setSend(true);
				
			} else {
				action.setPath("index.jsp");
				action.setSend(true);
			}

			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}	
		return action;
	}

}
