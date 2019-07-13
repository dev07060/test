package handler.survey;

import java.sql.Timestamp;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import main.BoardDataBean;
import survey.SurveyDao;

@Controller
public class EightProHandler implements CommandHandler {

	@Resource
	private SurveyDao surveyDao;
	
	@RequestMapping("/eightPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		Enumeration<String> e = request.getParameterNames();
		// 그 외 설문 정보를 받는 map
		Map<String, Object> info = new HashMap<String, Object>();
		// 질문내용만 받는 map
		Map<String, Object> qmap = new HashMap<String, Object>();
		
		while(e.hasMoreElements()) {
			String name = e.nextElement();
//			System.out.println("e.nextElement : " + name);
			if(name.startsWith("Q")) {
				qmap.put(name, request.getParameter(name));
			} else {
				info.put(name, request.getParameter(name));
			}
		}

		BoardDataBean boardDto = new BoardDataBean();
		boardDto.setB_tp_num(1);
		boardDto.setCt_num(1);
		boardDto.setS_tp_num(Integer.parseInt((String)info.get("s_tp_num")));
		boardDto.setSubject((String)info.get("subject"));
		boardDto.setWriter(/*(String)session.getAttribute("memId")*/"aaa" );
//		boardDto.setThumb_path(fileMap.get("upload11"));
		boardDto.setPoint(Integer.parseInt((String)info.get("point")));
		boardDto.setHits(0);
		boardDto.setPartnum(0);
		boardDto.setS_date(new Timestamp( System.currentTimeMillis() ));
		
		int result = surveyDao.insertSurvey(boardDto);
		
		System.out.println("insert결과 : " + result);
		System.out.println("info : " + info);
		System.out.println("qmap : " + qmap);
		
		
		
		request.setAttribute("info", info);
		
		return new ModelAndView("/survey/eightPro");
	}

}
