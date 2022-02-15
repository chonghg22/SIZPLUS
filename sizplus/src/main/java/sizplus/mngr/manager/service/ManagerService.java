package sizplus.mngr.manager.service;

import java.util.List;
import java.util.Map;

import sizplus.common.common.CommandMap;
import sizplus.mngr.manager.dao.ManagerVO;
import sizplus.user.member.dao.MemberVO;

public interface ManagerService {

//	int insertMemberProc(Map<String, Object> map) throws Exception;
//	
//	int updateMemberProc(Map<String, Object> map) throws Exception;
	
	ManagerVO selectManagerLoginView(ManagerVO managerVO) throws Exception;
	
	
}
