package survey;

import java.util.List;
import java.util.Map;

import dncommons.SqlMapClient;
import main.BoardDataBean;

public class SurveyDBBean implements SurveyDao{
	//검색용
	@Override
	public List<SurveyDataBean> getSearchSursSub(String search) {
		return SqlMapClient.getSession().selectList("Survey.getSearchSursSub", search);
	}
	
	//정렬 용
	@Override
	public List<SurveyDataBean> getSurs() {
		return SqlMapClient.getSession().selectList("Survey.getSurveys");
	}
	@Override
	public List<SurveyDataBean> getSursView() {
		
		return SqlMapClient.getSession().selectList("Survey.getSursView");
	}
	@Override
	public List<SurveyDataBean> getSursHit() {
		
		return SqlMapClient.getSession().selectList("Survey.getSursHit");
	}
	@Override
	public List<SurveyDataBean> getSursPoint() {
		
		return SqlMapClient.getSession().selectList("Survey.getSursPoint");
	}
	
	//오늘의 
	@Override
	public List<SurveyDataBean> getTodaySurs() {
		return SqlMapClient.getSession().selectList("Survey.getTodaySurs");
	}
	
	@Override
	public int getCountAll() {
		return SqlMapClient.getSession().selectOne("Survey.getCountAll");
	}
	
	@Override
	public int insertTwo(TwoDataBean two) {
		return SqlMapClient.getSession().insert("Survey.insertTwo", two);
	}
	
	@Override
	public int insertSurvey(BoardDataBean boardDto) {
		return SqlMapClient.getSession().insert("Survey.insertSurvey", boardDto);
	}
	
	@Override
	public List<BoardDataBean> getSurveys() {
		return SqlMapClient.getSession().selectList("Survey.getSurveys");
	}
	
	@Override
	public TwoDataBean getTwo(String s_num) {
		return SqlMapClient.getSession().selectOne("Survey.getTwo", s_num);
	}
	
	@Override
	public int addHits(String s_num) {
		return SqlMapClient.getSession().update("Survey.addHits", s_num);
	}
	
	@Override
	public int insertPart(Map<String, Object> map) {
		return SqlMapClient.getSession().insert("Survey.insertPart", map);
	}
	
	@Override
	public int insertSel(Map<String, Object> map) {
		return SqlMapClient.getSession().insert("Survey.insertSel", map);
	}
	
	@Override
	public BoardDataBean getSurvey(String s_num) {
		return SqlMapClient.getSession().selectOne("Survey.getSurvey", s_num);
	}
	
	@Override
	public int updatePoint(Map<String, Object> map) {
		return SqlMapClient.getSession().update("Survey.updatePoint", map);
	}
	
	@Override
	public int addPart(String s_num) {
		return SqlMapClient.getSession().update("Survey.addPart", s_num);
	}
	
	@Override
	public int getPartPoint(Map<String, Object> map) {
		return SqlMapClient.getSession().update("Survey.getPartPoint", map);
	}
	
	@Override
	public int getMyPoint(String id) {
		return SqlMapClient.getSession().update("Survey.getMyPoint", id);
	}
	
	@Override
	public int checkWriter(String id) {
		return SqlMapClient.getSession().selectOne("Survey.checkWriter", id);
	}
	
	@Override
	public int checkPart(String id) {
		return SqlMapClient.getSession().selectOne("Survey.checkPart", id);
	}
	
	@Override
	public List<String> getPartS_num(String id) {
		return SqlMapClient.getSession().selectList("Survey.getPartS_num", id);
	}
}
