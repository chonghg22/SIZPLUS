package sizplus.user.recipe.service;

import java.util.List;
import java.util.Map;

import sizplus.common.common.CommandMap;

public interface RecipeService {

	List<Map<String, Object>> selectRecipeList(Map<String, Object> commandMap) throws Exception;
	
	int selectRecipeCnt(Map<String, Object> map) throws Exception;
	
	int insertRecipe(Map<String, Object> map) throws Exception;
	
	int deleteRecipe(Map<String, Object> map) throws Exception;
	
	int updateRecipeHitCount(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectRecipeView(Map<String, Object> map) throws Exception;

}
