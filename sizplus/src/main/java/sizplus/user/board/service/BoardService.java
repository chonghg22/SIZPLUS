package sizplus.user.board.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sizplus.common.common.CommandMap;

public interface BoardService {

	List<Map<String, Object>> selectBoardList(HashMap<String, Object> commandMap) throws Exception;
	
	int selectBoardCnt(HashMap<String, Object> map) throws Exception;
	
	int insertBoard(Map<String, Object> map) throws SQLException;
	
	int insertComment(Map<String, Object> map) throws Exception;
	
	int deleteBoard(Map<String, Object> map) throws Exception;
	
	int updateBoardHitCount(Map<String, Object> map) throws Exception;
	
	int updateBoardGoodCount(Map<String, Object> map) throws Exception;
	
	int updateBoardBadCount(Map<String, Object> map) throws Exception;
	
	int updateBoard(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectBoardView(Map<String, Object> map) throws Exception;
	
	String selectCommentNumCheck(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectBoardCommentList(HashMap<String, Object> commandMap) throws Exception;
	
	int deleteBoardChk(HashMap<String, Object> map) throws Exception;
	
}
