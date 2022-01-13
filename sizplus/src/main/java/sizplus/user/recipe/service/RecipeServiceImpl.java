package sizplus.user.recipe.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sizplus.common.common.CommandMap;
import sizplus.user.board.dao.BoardDAO;
import sizplus.user.recipe.dao.RecipeDAO;

@Service("recipeService")
public class RecipeServiceImpl implements RecipeService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="recipeDAO")
	private RecipeDAO recipeDAO;
	
	@Override
	public List<Map<String, Object>> selectRecipeList(Map<String, Object> commandMap) throws Exception {
		return recipeDAO.selectRecipeList(commandMap);
		
	}
	
	@Override
	public int selectRecipeCnt(Map<String, Object> map) throws Exception {
		return recipeDAO.selectRecipeCnt(map);
		
	}
	
	@Override
	public Map<String, Object> selectRecipeView(Map<String, Object> map) throws Exception {
		return recipeDAO.selectRecipeView(map);
		
	}
	
	@Override
	public int insertRecipe(Map<String, Object> map) throws Exception {
		return recipeDAO.insertRecipe(map);
	}
	
	@Override
	public int updateRecipeHitCount(Map<String, Object> map) throws Exception {
		return recipeDAO.updateRecipeHitCount(map);
	}
	
	@Override
	public int deleteRecipe(Map<String, Object> map) throws Exception {
		return recipeDAO.deleteRecipe(map);
	}
	
}
