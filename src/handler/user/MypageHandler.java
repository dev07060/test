package handler.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.MemberDao;

@Controller
public class MypageHandler implements CommandHandler{

	@Resource
	private MemberDao memberDao;
	
	@RequestMapping("/mypage.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		System.out.println("핸들러에 들어왔다");
		
		return new ModelAndView("/user/mypage");
	}
}
