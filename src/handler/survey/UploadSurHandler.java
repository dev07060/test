package handler.survey;

import handler.CommandHandler;
import main.BoardDataBean;
import survey.SurveyDao;
import survey.TwoDataBean;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dncommons.SqlMapClient;

@Controller
public class UploadSurHandler implements CommandHandler {

	@Resource
	private SurveyDao surveyDao;
	
	@RequestMapping("/uploadSur")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String s_num = request.getParameter("s_num");
		
		//경로 확인 정확히 해라!!
//		"C:\\ExpertJava\\Java2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BoardEx\\save"
		String path = request.getSession().getServletContext().getRealPath("/save"); 

		// 조회수 증가
		int result = 0;
		result = surveyDao.addHits(s_num);
		
		// 설문 정보 넘기기
		TwoDataBean two = surveyDao.getTwo(s_num);
		BoardDataBean boardDto = surveyDao.getSurvey(s_num);
		request.setAttribute("boardDto", boardDto);
		request.setAttribute("two", two);
		
		// 설문 질문 넘기기
		List<String> qList = new ArrayList<String>();
		qList.add(two.getQ1());
		qList.add(two.getQ2());
		qList.add(two.getQ3());
		qList.add(two.getQ4());
		qList.add(two.getQ5());
		
		// 설문 이미지 경로 넘기기
		List<String> iList = new ArrayList<String>();
		iList.add(two.getImgname1());
		iList.add(two.getImgname2());
		iList.add(two.getImgname3());
		iList.add(two.getImgname4());
		iList.add(two.getImgname5());
		iList.add(two.getImgname6());
		iList.add(two.getImgname7());
		iList.add(two.getImgname8());
		iList.add(two.getImgname9());
		iList.add(two.getImgname10());
		
		request.setAttribute("qList", qList);
		request.setAttribute("iList", iList);
		
		
		return new ModelAndView("/survey/uploadSur");
	}

}

