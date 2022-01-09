package sizplus.user.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sizplus.common.common.CommandMap;
import sizplus.user.board.dao.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(CommandMap commandMap) throws Exception {
		return boardDAO.selectBoardList(commandMap);
		
	}
	
	@Override
	public List<Map<String, Object>> selectUserTipList(Map<String, Object> commandMap) throws Exception {
		return boardDAO.selectUserTipList(commandMap);
		
	}
	
	@Override
	public int selectUserTipCnt(CommandMap commandMap) throws Exception {
		return boardDAO.selectUserTipCnt(commandMap);
		
	}

}
