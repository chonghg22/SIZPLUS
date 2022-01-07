package sizplus.user.member.service;

import java.util.List;
import java.util.Map;

import sizplus.common.common.CommandMap;
import sizplus.user.member.dao.MemberVO;

public interface MemberService {

	int insertMemberProc(Map<String, Object> map) throws Exception;
	
	int updateMemberProc(Map<String, Object> map) throws Exception;
	
	MemberVO selectUserLoginView(MemberVO memberVO) throws Exception;
	
	
}
