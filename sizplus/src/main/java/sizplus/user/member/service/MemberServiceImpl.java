package sizplus.user.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sizplus.common.common.CommandMap;
import sizplus.user.member.dao.MemberDAO;
import sizplus.user.member.dao.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	@Override
	public int insertMemberProc(Map<String, Object> map) throws Exception {
		return memberDAO.insertMemberProc(map);
		
	}
	
	@Override
	public MemberVO selectUserLoginView(MemberVO memberVO) throws Exception {
		return memberDAO.selectUserLoginView(memberVO);
		
	}

}
