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
	public List<Map<String, Object>> selectBoardList(Map<String, Object> commandMap) throws Exception{
		return sqlSession.selectList("board.selectBoardList", commandMap);
	}
	
	//AbstractDAO를 호출하지 않고 SqlSessionTemplate 직접 사용하여 쿼리 조회
	public Map<String, Object> selectBoardView(Map<String, Object> map) throws Exception{
		return sqlSession.selectOne("board.selectBoardView", map);
	}
	
	
	//AbstractDAO를 호출하지 않고 SqlSessionTemplate 직접 사용하여 쿼리 조회
	public int selectBoardCnt(Map<String, Object> map) throws Exception{
		return sqlSession.selectOne("board.selectBoardCnt", map);
	}
	
	
	public int insertBoard(Map<String, Object> map) throws Exception{
		return sqlSession.insert("board.insertBoard", map);
	}
	
	public int updateBoardHitCount(Map<String, Object> map) throws Exception{
		return sqlSession.update("board.updateBoardHitCount", map);
	}
	
	public int updateBoard(Map<String, Object> map) throws Exception{
		return sqlSession.update("board.updateBoard", map);
	}
	
	public int deleteBoard(Map<String, Object> map) throws Exception{
		return sqlSession.delete("board.deleteBoard", map);
	}

}
