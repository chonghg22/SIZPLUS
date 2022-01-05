package sizplus.user.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sizplus.common.common.CommandMap;
import sizplus.common.dao.AbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//AbstractDAO 호출하여 쿼리 조회 방식
	public int insertMemberProc(Map<String, Object> map) throws Exception{
		return insert("member.insertMemberProc", map);
	}
	
	//회원정보 수정
	public int updateMemberProc(Map<String, Object> map) throws Exception{
		//member.updateMemberProc 에서 member 는 Member_SQL.xml에 있는 namespace이고  updateMemberProc는 update id ="updateMemberProc" 이 아이디값임
		return update("member.updateMemberProc", map);
	}
	
	
	//AbstractDAO를 호출하지 않고 SqlSessionTemplate 직접 사용하여 쿼리 조회
	public MemberVO selectUserLoginView(MemberVO memberVO) throws Exception{
		return sqlSession.selectOne("member.selectUserLoginView", memberVO);
	}

}
