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
	public List<Map<String, Object>> selectBoardList(Map<String, Object> commandMap) throws Exception {
		return boardDAO.selectBoardList(commandMap);
		
	}
	
	@Override
	public int selectBoardCnt(Map<String, Object> map) throws Exception {
		return boardDAO.selectBoardCnt(map);
		
	}
	
	@Override
	public Map<String, Object> selectBoardView(Map<String, Object> map) throws Exception {
		return boardDAO.selectBoardView(map);
		
	}
	
	@Override
	public int insertBoard(Map<String, Object> map) throws Exception {
		return boardDAO.insertBoard(map);
	}
	
	@Override
	public int updateBoardHitCount(Map<String, Object> map) throws Exception {
		return boardDAO.updateBoardHitCount(map);
	}
	
	@Override
	public int updateBoard(Map<String, Object> map) throws Exception {
		return boardDAO.updateBoard(map);
	}
	
	@Override
	public int deleteBoard(Map<String, Object> map) throws Exception {
		return boardDAO.deleteBoard(map);
	}
	
}
