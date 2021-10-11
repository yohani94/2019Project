package kr.ac.knu.command;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.MemberDAO;
import kr.ac.knu.entity.MemberEntity;

public class MemberLoginCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		MemberEntity member = new MemberEntity();
		MemberDAO dao = new MemberDAO();
		member.setId(id);
		member.setPw(pw);

		member = dao.login(id, pw);
		
		int check = dao.loginCheck(id, pw);
		
		ActionForward action = new ActionForward();
		
		if(member != null || check ==1) {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			
			request.setAttribute("id", id);
			
			action.setPath("index.jsp");
			action.setSend(false);
			
		} else if(check ==0) {//
			action.setPath("memberloginForm.do?msg=0");
			action.setSend(true);
		} else {
			action.setPath("memberloginForm.do?msg=-1");
			action.setSend(true);
		}
		return action;
	}

}