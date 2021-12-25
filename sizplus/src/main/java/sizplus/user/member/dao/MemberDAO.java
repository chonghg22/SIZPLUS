package sizplus.user.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import sizplus.common.dao.AbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO{

	public int insertMemberProc(Map<String, Object> map) throws Exception{
		return insert("member.insertMemberProc", map);
	}

}
