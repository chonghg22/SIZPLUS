package sizplus.user.file.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sizplus.common.common.CommandMap;

public interface FileService {

	List<Map<String, Object>> selectFileList(HashMap<String, Object> commandMap) throws Exception;
	
	int insertFile(Map<String, Object> map) throws SQLException;
	
}
