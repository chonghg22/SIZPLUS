package sizplus.user.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sizplus.common.common.CommandMap;
import sizplus.common.dao.AbstractDAO;
import sizplus.user.member.dao.MemberVO;

@Repository("boardDAO")
public class BoardDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//AbstractDAO를 호출하지 않고 SqlSessionTemplate 직접 사용하여 쿼리 조회
	public List<Map<String, Object>> selectBoardList(CommandMap commandMap) throws Exception{
		return sqlSession.selectList("board.selectBoardList", commandMap);
	}

}
