package sizplus.mngr.manager.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sizplus.common.common.CommandMap;
import sizplus.mngr.manager.dao.ManagerDAO;
import sizplus.mngr.manager.dao.ManagerVO;
import sizplus.user.member.dao.MemberDAO;
import sizplus.user.member.dao.MemberVO;

@Service("managerService")
public class ManagerServiceImpl implements ManagerService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="managerDAO")
	private ManagerDAO managerDAO;
	
//	@Override
//	public int insertMemberProc(Map<String, Object> map) throws Exception {
//		return memberDAO.insertMemberProc(map);
//		
//	}
//	
//	//여기에 메소드 적고  Service 에 안적으면 오류남 
//	@Override
//	public int updateMemberProc(Map<String, Object> map) throws Exception {
//		return memberDAO.updateMemberProc(map);
//	}
	
	
	@Override
	public ManagerVO selectManagerLoginView(ManagerVO managerVO) throws Exception {
		return managerDAO.selectManagerLoginView(managerVO);
		
	}

}
