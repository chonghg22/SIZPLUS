package sizplus.user.board.service;

import java.util.List;
import java.util.Map;

import sizplus.common.common.CommandMap;

public interface BoardService {

	List<Map<String, Object>> selectBoardList(Map<String, Object> commandMap) throws Exception;
	
	int selectBoardCnt(Map<String, Object> map) throws Exception;
	
	int insertBoard(Map<String, Object> map) throws Exception;
	
	int deleteBoard(Map<String, Object> map) throws Exception;
	
	int updateBoardHitCount(Map<String, Object> map) throws Exception;
	
	int updateBoard(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectBoardView(Map<String, Object> map) throws Exception;

}
