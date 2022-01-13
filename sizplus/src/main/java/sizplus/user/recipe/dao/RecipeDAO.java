package sizplus.user.recipe.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sizplus.common.common.CommandMap;
import sizplus.common.dao.AbstractDAO;
import sizplus.user.member.dao.MemberVO;

@Repository("recipeDAO")
public class RecipeDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//AbstractDAO를 호출하지 않고 SqlSessionTemplate 직접 사용하여 쿼리 조회
	public List<Map<String, Object>> selectRecipeList(Map<String, Object> commandMap) throws Exception{
		return sqlSession.selectList("recipe.selectRecipeList", commandMap);
	}
	
	//AbstractDAO를 호출하지 않고 SqlSessionTemplate 직접 사용하여 쿼리 조회
	public Map<String, Object> selectRecipeView(Map<String, Object> map) throws Exception{
		return sqlSession.selectOne("recipe.selectRecipeView", map);
	}
	
	
	//AbstractDAO를 호출하지 않고 SqlSessionTemplate 직접 사용하여 쿼리 조회
	public int selectRecipeCnt(Map<String, Object> map) throws Exception{
		return sqlSession.selectOne("recipe.selectRecipeCnt", map);
	}
	
	
	public int insertRecipe(Map<String, Object> map) throws Exception{
		return sqlSession.insert("recipe.insertRecipe", map);
	}
	
	public int updateRecipeHitCount(Map<String, Object> map) throws Exception{
		return sqlSession.update("recipe.updateRecipeHitCount", map);
	}
	
	public int deleteRecipe(Map<String, Object> map) throws Exception{
		return sqlSession.delete("recipe.deleteRecipe", map);
	}

}
