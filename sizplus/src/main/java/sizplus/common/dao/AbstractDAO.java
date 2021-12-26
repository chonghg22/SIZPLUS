package sizplus.common.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import sizplus.common.common.CommandMap;

public class AbstractDAO {
	protected Log log = LogFactory.getLog(AbstractDAO.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	protected void printQueryId(String queryId) {
		if(log.isDebugEnabled()){
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}
	
	public int insert(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}
	
	public int update(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.update(queryId, params);
	}
	
	public int delete(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.delete(queryId, params);
	}
	
	public int selectCount(String queryId){
		printQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}
	
	public Object selectView(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId){
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}
}
