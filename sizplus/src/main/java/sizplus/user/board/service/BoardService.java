package sizplus.user.board.service;

import java.util.List;
import java.util.Map;

import sizplus.common.common.CommandMap;

public interface BoardService {

	List<Map<String, Object>> selectBoardList(CommandMap commandMap) throws Exception;
	
	List<Map<String, Object>> selectUserTipList(Map<String, Object> commandMap) throws Exception;
	
	int selectUserTipCnt(CommandMap commandMap) throws Exception;

}
