package handler.survey;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.MemberDao;
import main.MemberDataBean;
import survey.SurveyDao;
@Controller
public class UploadResultHandler implements CommandHandler {

	@Resource
	MemberDao memberDao;
	
	@Resource
	SurveyDao surveyDao;
	
	@RequestMapping("/uploadResult")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 파라미터 가져오기
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		String s_num = (String) request.getParameter("s_num");
		int point = Integer.parseInt((String) request.getParameter("point"));
		Enumeration<String> params = request.getParameterNames();
		
		// 참여수 증가
		surveyDao.addPart(s_num);
		
		// 질문에 대한 답모아놓기
		List<Integer> choList = new ArrayList<Integer>();
		
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    if(!name.equals("s_num")&&!name.equals("point")) { // 넘어온 데이터 중 s_num은 위에서 받으므로 제외
			    choList.add(Integer.parseInt(request.getParameter(name)));
			    System.out.println("choList : " + request.getParameter(name));
		    }
		}
		
		// mybatis로 넘기기 위한 map
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("s_num", s_num);
		map.put("point", point);
		
		List<Map<String, Object>> choiceList = new ArrayList<Map<String, Object>>();
		
		for(int i = 0; i < choList.size(); i++) {
			Map<String, Object> choicemap = new HashMap<String, Object>();
			// 질문번호와 그에 대한 답 mapping
			choicemap.put("q_num", i+1);
			choicemap.put("cho_num", choList.get(i));
		
			choiceList.add(choicemap);
		}
		
		map.put("choiceList", choiceList);
		
		// 로그인 하지 않았을 시에는 아무런 정보를 저장하지 않음
		if(id != null) {
			
			// dn_s_part에 정보 저장
			surveyDao.insertPart(map);
			
			// dn_s_sel에 정보 저장
			MemberDataBean memberDto = memberDao.getMember(id);
			map.put("member",memberDto);
			surveyDao.insertSel(map);
			
			// 설문 참여 포인트 획득
			surveyDao.updatePoint(map);
			
			
		}
		
		request.setAttribute("point", point);
		request.setAttribute("choiceList", choiceList);
		
		return new ModelAndView("/survey/uploadResult");
	}

}
