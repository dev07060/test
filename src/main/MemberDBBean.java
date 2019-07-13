package main;


import dncommons.SqlMapClient;
import main.MemberDataBean;

public class MemberDBBean implements MemberDao{
	
	@Override
	public int check(String id, String passwd) {
		int result = checkId(id);

		if (result == 1) { // 아이디 있다.
			MemberDataBean memberDto = getMember(id);
			System.out.println(memberDto.getId());
			if (!passwd.equals(memberDto.getPasswd())) {
				result = -1;
			}
		}
		return result;
	}
	
	@Override
	public int checkId(String id) {
		
		return SqlMapClient.getSession().selectOne("Main.checkId", id);
	}
	@Override
	public MemberDataBean getMember(String id) {
		return SqlMapClient.getSession().selectOne("Main.getMember",id);
	}
	@Override
	public int insertMember(MemberDataBean memberDto) {
		return SqlMapClient.getSession().insert("Main.insertMember", memberDto);
	}
	@Override
	public int updateMember(MemberDataBean memberDto) {
		return SqlMapClient.getSession().update("Main.updateMember", memberDto);
	}
}
