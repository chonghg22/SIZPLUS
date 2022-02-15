package sizplus.mngr.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sizplus.mngr.main.dao.MngrMainDAO;
import sizplus.user.main.dao.MainDAO;

@Service("mngrMainService")
public class MngrMainServiceImpl implements MngrMainService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mngrMainDAO")
	private MngrMainDAO mngrMainDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return mngrMainDAO.selectBoardList(map);
		
	}

}
