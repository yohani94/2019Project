package kr.ac.knu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	String savePath = 
	"C:\\Users\\hddod\\eclipse-workspace\\KKANGAZI\\WebContent\\download";
	
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response);
}
