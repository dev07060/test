package handler.user;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.MemberDao;
import main.MemberDataBean;

@Controller
public class ModifyUserProHandler implements CommandHandler{

	@Resource
	private MemberDao memberDao;
	
	@RequestMapping("/modifyUserPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		MemberDataBean memberDto = new MemberDataBean();
//		
		memberDto.setId((String) request.getSession().getAttribute( "memId" ));
		memberDto.setPasswd( request.getParameter( "passwd" ) );
		memberDto.setAge(Integer.parseInt(request.getParameter("age")));
		memberDto.setZipcode(Integer.parseInt(request.getParameter("zipcode")));
		memberDto.setAddress(request.getParameter("address") );
		memberDto.setAddressDetail(request.getParameter("addressDetail") );
		memberDto.setEmail(request.getParameter("email") );
		memberDto.setUserState(Integer.parseInt(request.getParameter("userState")));
		
		int result = memberDao.updateMember( memberDto );
		request.setAttribute("result", result);
		return new ModelAndView("user/modifyUserPro");
		
	}
}
