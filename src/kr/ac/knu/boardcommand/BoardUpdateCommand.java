package kr.ac.knu.boardcommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.ac.knu.ActionForward;
import kr.ac.knu.Command;
import kr.ac.knu.dao.BoardDAO;
import kr.ac.knu.entity.BoardEntity;
import kr.ac.knu.entity.MemberEntity;

public class BoardUpdateCommand implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(); 
		MemberEntity member =
				(MemberEntity)session.getAttribute("member");
		
		ActionForward action = new ActionForward();
		
		if(member == null) {
			action.setPath("memberloginForm.do?msg=2");
			action.setSend(true);
		}else {
			
			int size = 1024 * 1024 * 50 ;
			
			try {
				request.setCharacterEncoding("utf-8");
				
				MultipartRequest mr = new MultipartRequest(request,
						savePath, size, "utf-8", new DefaultFileRenamePolicy() );
				
				String dog_number = mr.getParameter("dog_number");
				System.out.println(dog_number);
				String dog_title = mr.getParameter("dog_title");
				String animaltype = mr.getParameter("animaltype");
				String dc_type = mr.getParameter("dc_type");
				String dc_sex = mr.getParameter("dc_sex");
				String dc_age = mr.getParameter("dc_age");
				String dc_sex_neu = mr.getParameter("dc_sex_neu");
				String dc_size = mr.getParameter("dc_size");
				String dc_vaccinate = mr.getParameter("dc_vaccinate");
				String dc_others = mr.getParameter("dc_others");
				String dog_comment = mr.getParameter("dog_comment");
				String upfile = mr.getFilesystemName("upfile");
				
				if(dc_sex_neu==null) {
		               dc_sex_neu = "x";
		            }
				
				BoardEntity board = new BoardEntity();

				board.setDog_title(dog_title);
				board.setAnimaltype(animaltype);
				board.setDc_type(dc_type);
				board.setDc_sex(dc_sex);
				board.setDc_sex_neu(dc_sex_neu);
				board.setDc_age(dc_age);
				board.setDc_sex_neu(dc_sex_neu);
				board.setDc_size(dc_size);
				board.setDc_vaccinate(dc_vaccinate);
				board.setDc_others(dc_others);
				board.setMembers_id(member.getId());
				board.setDog_comment(dog_comment);
				board.setUpfile(upfile);
				board.setDog_number(Integer.parseInt(dog_number));
				
				BoardDAO dao = new BoardDAO();
				int result = dao.update(board);		
				
				if(result == 1) {
					action.setPath("boardList.do");
					action.setSend(true);
				}else {
					action.setPath("WEB-INF/error.jsp");
					action.setSend(false);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return action;

}
	}
