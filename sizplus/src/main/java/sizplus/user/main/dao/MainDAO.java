package sizplus.user.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import sizplus.common.dao.AbstractDAO;

@Repository("mainDAO")
public class MainDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("board.selectBoardList", map);
	}

}
