package sizplus.user.board.dao;

import java.sql.SQLException;
import java.util.HashMap;
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
	
	
	//게시글 목록
	public List<Map<String, Object>> selectBoardList(HashMap<String, Object> commandMap) throws Exception{
		return sqlSession.selectList("board.selectBoardList", commandMap);
	}
	
	//게시글 상세보기
	public Map<String, Object> selectBoardView(Map<String, Object> map) throws Exception{
		return sqlSession.selectOne("board.selectBoardView", map);
	}
	
	
	//게시글 갯수
	public int selectBoardCnt(HashMap<String, Object> commandMap) throws Exception{
		return sqlSession.selectOne("board.selectBoardCnt", commandMap);
	}
	
	//게시글 등록
	public int insertBoard(Map<String, Object> map) throws SQLException{
		return sqlSession.insert("board.insertBoard", map);
	}
	
	//게시글에 대한 댓글 등록
	public int insertComment(Map<String, Object> map) throws Exception{
		return sqlSession.insert("board.insertComment", map);
	}
	
	//게시글 조회수 증가
	public int updateBoardHitCount(Map<String, Object> map) throws Exception{
		return sqlSession.update("board.updateBoardHitCount", map);
	}
	
	//게시글 좋아요 갯수 증가
	public int updateBoardGoodCount(Map<String, Object> map) throws Exception{
		return sqlSession.update("board.updateBoardGoodCount", map);
	}
	
	//게시글 싫어요 갯수 증가
	public int updateBoardBadCount(Map<String, Object> map) throws Exception{
		return sqlSession.update("board.updateBoardBadCount", map);
	}
	
	//게시글 수정
	public int updateBoard(Map<String, Object> map) throws SQLException{
		return sqlSession.update("board.updateBoard", map);
	}
	
	//게시글 삭제
	public int deleteBoard(Map<String, Object> map) throws Exception{
		return sqlSession.delete("board.deleteBoard", map);
	}
	
	//해당 게시글의 관련된 댓글의 마지막 comment_no 값 
	public String selectCommentNumCheck(Map<String, Object> map) throws Exception{
		return sqlSession.selectOne("board.selectCommentNumCheck", map);
	}
	
	//게시글 목록
	public List<Map<String, Object>> selectBoardCommentList(HashMap<String, Object> commandMap) throws Exception{
		return sqlSession.selectList("board.selectBoardCommentList", commandMap);
	}
	
	//선택된 게시글 삭제
	public int deleteBoardChk(HashMap<String, Object> map) throws Exception{
		return sqlSession.delete("board.deleteBoardChk", map);
	}
	
	
	
}
