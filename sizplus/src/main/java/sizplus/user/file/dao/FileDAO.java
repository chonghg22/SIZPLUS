package sizplus.user.file.dao;

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

@Repository("fileDAO")
public class FileDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//게시글 목록
	public List<Map<String, Object>> selectFileList(HashMap<String, Object> commandMap) throws Exception{
		return sqlSession.selectList("file.selectFileList", commandMap);
	}
	
	//게시글에 대한 댓글 등록
	public int insertFile(Map<String, Object> map) throws SQLException{
		return sqlSession.insert("file.insertFile", map);
	}
	
}
