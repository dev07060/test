package handler.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class MainNavHandler implements CommandHandler{

	@RequestMapping("/mainNav")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("memId");
		request.setAttribute("id", id);
//		
		
		return new ModelAndView("pinned/mainNav");
	}
}
