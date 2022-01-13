	package sizplus.user.recipe.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sizplus.common.common.CommandMap;
import sizplus.common.common.CommonUtil;
import sizplus.common.common.PaginationInfo;
import sizplus.user.recipe.service.RecipeService;

@Controller
public class RecipeController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="recipeService")
	private RecipeService recipeService;
	
	//게시판 리스트
	@RequestMapping(value="/recipe/recipe_list.do")
	public String selectUserrecipeList(Map<String, Object> map, ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		map.put("bbsId", "free");
		int page = 1;
		if(commandMap.get("page") != null) {
			page = Integer.parseInt(commandMap.get("page").toString());
		}
		
		int viewCount = 10;
		if(commandMap.get("viewCount") != null) {
			viewCount = Integer.parseInt(commandMap.get("viewCount").toString());
		}
		map.put("page", page);
		map.put("viewCount", viewCount);
		

		int totCnt = recipeService.selectRecipeCnt(map); //게시글 수

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(page);
		paginationInfo.setRecordCountPerPage(viewCount);
		paginationInfo.setPageSize(10);
		paginationInfo.setTotalRecordCount(totCnt);
		
		map.put("firstIndex", paginationInfo.getFirstRecordIndex());
		map.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());

		List<Map<String, Object>> list = recipeService.selectRecipeList(map);
		
		model.addAttribute("commandMap", commandMap); //페이징 정보
		model.addAttribute("paginationInfo", paginationInfo); //페이징 정보
		model.addAttribute("listNo", (totCnt - ((page - 1)* paginationInfo.getRecordCountPerPage()))); //페이지 No 의 시작 값 가상의 넘버링
		model.addAttribute("list", list);
		
    	return "recipe/recipe_list";
    }
	
	@RequestMapping(value="/recipe/recipe_view.do")
	public String selectUserrecipeView(Map<String, Object> map, ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		
		map.put("seq", commandMap.get("seq").toString());
		map.put("bbsId", commandMap.get("bbsId").toString());
		
		int hitCount = recipeService.updateRecipeHitCount(map);
		Map<String, Object> result = recipeService.selectRecipeView(map);
		
		model.addAttribute("commandMap", commandMap); //페이징 정보
		model.addAttribute("result", result);
		
    	return "recipe/recipe_view";
    }
	
	
	//자유게시판 글쓰기 페이지
	@RequestMapping(value="/recipe/recipe_input.do")
    public String insertFreerecipeList(ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		
		model.addAttribute("commandMap", commandMap); //페이징 정보

		return "recipe/recipe_input";
    
    }
	
	//자유게시판 글등록 처리
	@RequestMapping(value="/recipe/recipe_input_proc.do")
    public String insertFreerecipeProcList(Map<String, Object> map, ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		
		map.put("bbsId", commandMap.get("bbsId").toString());
		map.put("inputNm", commandMap.get("input_nm").toString());
		map.put("password", CommonUtil.hexSha256(commandMap.get("password").toString()));
		map.put("title", commandMap.get("title").toString());
		map.put("contents", commandMap.get("contents").toString());
		
		int insertResult = recipeService.insertRecipe(map);
		if(insertResult == 1) {
			CommonUtil.NotificationMessage(model, "성공", "등록되었습니다.", "location.href='/recipe/recipe_list.do?bbsId='"+commandMap.get("bbsId").toString());
		}
		
		return "redirect:/recipe/recipe_list.do";
    
    }
	
	//자유게시판 삭제 기능
	@RequestMapping(value="/recipe/recipe_delete_proc.do")
    public String deleterecipeProc(Map<String, Object> map, ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		
		map.put("seq", commandMap.get("seq").toString());
		
		int deleteResult = recipeService.deleteRecipe(map);
		
		if(deleteResult == 1) {
			CommonUtil.NotificationMessage(model, "성공", "삭제되었습니다.", "location.href='/recipe/recipe_list.do?bbsId='"+commandMap.get("bbsId").toString());
		}
		
		return "redirect:/recipe/recipe_list.do";
    
    }
	
}
