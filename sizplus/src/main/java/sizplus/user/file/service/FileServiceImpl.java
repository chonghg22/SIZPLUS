package sizplus.user.file.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sizplus.common.common.CommandMap;
import sizplus.user.board.dao.BoardDAO;
import sizplus.user.file.dao.FileDAO;

@Service("fileService")
public class FileServiceImpl implements FileService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileDAO")
	private FileDAO fileDAO;
	
	@Override
	public List<Map<String, Object>> selectFileList(HashMap<String, Object> commandMap) throws Exception {
		return fileDAO.selectFileList(commandMap);
		
	}
	
	@Override
	public int insertFile(Map<String, Object> map) throws SQLException {
		return fileDAO.insertFile(map);
	}
	
}
