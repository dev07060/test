package survey;

import java.util.List;
import java.util.Map;

import main.BoardDataBean;

public interface SurveyDao {
	public List<SurveyDataBean> getSurs();
	public List<SurveyDataBean> getSursView();
	public List<SurveyDataBean> getSursHit();
	public List<SurveyDataBean> getSursPoint();
	public List<SurveyDataBean> getTodaySurs();
	public List<SurveyDataBean> getSearchSursSub(String search);
	
	public int insertTwo(TwoDataBean two);
	public int insertSurvey(BoardDataBean boardDto);
	public List<BoardDataBean> getSurveys();
	public int getCountAll();
	public TwoDataBean getTwo(String s_num);
	public int addHits(String s_num);
	public int insertPart(Map<String, Object> map);
	public int insertSel(Map<String, Object> map);
	public BoardDataBean getSurvey(String s_num);
	public int updatePoint(Map<String, Object> map);
	public int addPart(String s_num);
	public int getPartPoint(Map<String, Object> map);
	public int getMyPoint(String id);
	public int checkWriter(String id);
	public int checkPart(String id);
	public List<String> getPartS_num(String id);
}
