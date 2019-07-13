package main;


public interface MemberDao {
	public int checkId(String id);
	public int check(String id, String passwd);
	public MemberDataBean getMember(String id);
	public int insertMember(MemberDataBean memberDto);
	public int updateMember( MemberDataBean memberDto );
}
