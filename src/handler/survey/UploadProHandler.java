package handler.survey;

import java.io.File;
import java.sql.Timestamp;
import java.util.Iterator;
import java.util.TreeMap;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import handler.CommandHandler;
import main.BoardDataBean;
import survey.SurveyDao;
import survey.TwoDataBean;


@Controller
public class UploadProHandler implements CommandHandler {

	@Resource
	SurveyDao surveyDao;
	
	@RequestMapping("/uploadPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		HttpSession session = request.getSession();
		
		
		// 이미지 저장될 경로
		// "C:\Users\Playdata\Desktop\dotnet\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\DotNetEx\save"
		String path = request.getSession().getServletContext().getRealPath("/save"); 

		// 지정된 경로에 파일이 없으면 생성
		File file = new File( path );
		if(!file.exists()) {
			file.mkdir();
		}
		
		// 지정된 파일에 이미지 저장
		MultipartRequest multi = 
				new MultipartRequest(request, path, 1024 * 1024 * 50, "utf-8", new DefaultFileRenamePolicy());

		
		// 질문 모아두는 벡터
		Vector<String> qList = new Vector<>();
		// 사진 2장
		TreeMap<String,String> fileMap = new TreeMap<String,String>();
		// 이미지 경로 모아놓는 iterator
		
		Iterator<String> e = (Iterator<String>) multi.getFileNames();
		
		while (e.hasNext()) {
			String inputname = e.next();
			String originName = multi.getOriginalFileName(inputname);
			String systemName = multi.getFilesystemName(inputname);
//			System.out.println("inputname  : " + inputname);
//			System.out.println("originname : " + originName);
//			System.out.println("systemname : " + systemName);
			
			if (systemName != null) {
				fileMap.put(inputname, systemName);
			}
		}
		
		// dn_board에 정보저장
		BoardDataBean boardDto = new BoardDataBean();
		boardDto.setB_tp_num(1);
		boardDto.setCt_num(1);
		boardDto.setS_tp_num(2);
		boardDto.setSubject(multi.getParameter("subject"));
		boardDto.setWriter( (String)session.getAttribute("memId") );
		boardDto.setThumb_path(fileMap.get("upload11"));
		boardDto.setPoint(Integer.parseInt(multi.getParameter("point")));
		boardDto.setHits(0);
		boardDto.setPartnum(0);
		boardDto.setS_date(new Timestamp( System.currentTimeMillis() ));
		
		int ins_sur_result = surveyDao.insertSurvey(boardDto);
//		System.out.println("ins_sur_result : " + ins_sur_result);
		request.setAttribute("ins_sur_result", ins_sur_result);
		
		// dn_s_two에 정보저장
		

		String q1 = multi.getParameter("question1");
		String q2 = multi.getParameter("question2");
		String q3 = multi.getParameter("question3");
		String q4 = multi.getParameter("question4");
		String q5 = multi.getParameter("question5");
		
		qList.add(q1);
		qList.add(q2);
		qList.add(q3);
		qList.add(q4);
		qList.add(q5);
		
		
		 
		 
		// qAndImg에 질문1 이미지1 이미지2 /  질문2 이미지3 이미지4... 형식으로 집어넣기
		String upload[] = new String[] {"upload1","upload2","upload3","upload4","upload5",
										"upload6","upload7","upload8","upload9","upload10"};
		Vector<String> qAndImg = new Vector<String>();
		int c = 0;
		for(int i = 0 ; i < qList.size(); i++) {
			qAndImg.add(qList.get(i));
			qAndImg.add(fileMap.get(upload[c + i]));
			qAndImg.add(fileMap.get(upload[c + i + 1]));
			c++;
		}
		
//		for(String el : qAndImg) {
//			System.out.println("el : " + el);
//		}
		
		TwoDataBean two = new TwoDataBean();
		System.out.println("s_num : " + boardDto.getS_num());
		two.setS_num(boardDto.getS_num());
		two.setQ1(qAndImg.get(0));
		two.setImgname1(qAndImg.get(1));
		two.setImgname2(qAndImg.get(2));
		two.setQ2(qAndImg.get(3));
		two.setImgname3(qAndImg.get(4));
		two.setImgname4(qAndImg.get(5));
		two.setQ3(qAndImg.get(6));
		two.setImgname5(qAndImg.get(7));
		two.setImgname6(qAndImg.get(8));
		two.setQ4(qAndImg.get(9));
		two.setImgname7(qAndImg.get(10));
		two.setImgname8(qAndImg.get(11));
		two.setQ5(qAndImg.get(12));
		two.setImgname9(qAndImg.get(13));
		two.setImgname10(qAndImg.get(14));
		
		int ins_two_result = surveyDao.insertTwo(two);
		System.out.println("ins_two_result : " + ins_two_result);
		request.setAttribute("ins_two_result", ins_two_result);
		request.setAttribute("two", two);
		

		if (fileMap.size() != 0) {
			//<String;질문>
			request.setAttribute("qList", qList);
			//<upload, filename>
			request.setAttribute("fileMap", fileMap);
		}

		
		return new ModelAndView("/survey/uploadPro");
	}

}
