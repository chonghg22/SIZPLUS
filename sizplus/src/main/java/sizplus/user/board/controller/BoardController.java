	package sizplus.user.board.controller;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sizplus.common.common.CommandMap;
import sizplus.common.common.CommonUtil;
import sizplus.common.common.PaginationInfo;
import sizplus.user.board.service.BoardService;

@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	//게시판 리스트
	@RequestMapping(value="/board/board_list.do")
	public String selectUserBoardList(ModelMap model, HttpServletRequest request) throws Exception{
		HashMap<String, Object> commandMap = CommonUtil.convertMap(request);
		int page = 1;
		if(commandMap.get("page") != null) {
			page = Integer.parseInt(commandMap.get("page").toString());
		}
		
		int viewCount = 10;
		if(commandMap.get("viewCount") != null) {
			viewCount = Integer.parseInt(commandMap.get("viewCount").toString());
		}
		commandMap.put("page", page);
		commandMap.put("viewCount", viewCount);

		int totCnt = boardService.selectBoardCnt(commandMap); //게시글 수

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(page);
		paginationInfo.setRecordCountPerPage(viewCount);
		paginationInfo.setPageSize(10);
		paginationInfo.setTotalRecordCount(totCnt);
		
		commandMap.put("firstIndex", paginationInfo.getFirstRecordIndex());
		commandMap.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());

		List<Map<String, Object>> list = boardService.selectBoardList(commandMap);
		
		model.addAttribute("commandMap", commandMap); //페이징 정보
		model.addAttribute("paginationInfo", paginationInfo); //페이징 정보
		model.addAttribute("listNo", (totCnt - ((page - 1)* paginationInfo.getRecordCountPerPage()))); //페이지 No 의 시작 값 가상의 넘버링
		model.addAttribute("list", list);
		
    	return "board/board_list";
    }
	
	@RequestMapping(value="/board/board_view.do")
	public String selectUserBoardView(Map<String, Object> map, ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		
		map.put("seq", commandMap.get("seq").toString());
		map.put("bbsId", commandMap.get("bbsId").toString());
		
		int hitCount = boardService.updateBoardHitCount(map);
		Map<String, Object> result = boardService.selectBoardView(map);
		
		model.addAttribute("commandMap", commandMap); //페이징 정보
		model.addAttribute("result", result);
		
    	return "board/board_view";
    }
	
	
	//자유게시판 글쓰기 페이지
	@RequestMapping(value="/board/board_input.do")
    public String insertFreeBoardList(ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		
		model.addAttribute("commandMap", commandMap); //페이징 정보

		return "board/board_input";
    
    }
	
	//자유게시판 글등록 처리
	@RequestMapping(value="/board/board_input_proc.do")
    public String insertFreeBoardProcList(Map<String, Object> map, ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		
		map.put("bbsId", commandMap.get("bbsId").toString());
		map.put("inputNm", commandMap.get("input_nm").toString());
		map.put("password", CommonUtil.hexSha256(commandMap.get("password").toString()));
		map.put("title", commandMap.get("title").toString());
		map.put("contents", commandMap.get("contents").toString());
		
		int insertResult = boardService.insertBoard(map);
		if(insertResult == 1) {
			CommonUtil.NotificationMessage(model, "성공", "등록 되었습니다.", "location.href='/board/board_list.do?bbsId="+commandMap.get("bbsId").toString()+"';");
		}
		
		return "redirect:/board/board_list.do";
    
    }
	
	//자유게시판 글쓰기 페이지
	@RequestMapping(value="/board/board_edit.do")
    public String updateFreeBoardList(Map<String, Object> map,ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		
		map.put("seq", commandMap.get("seq").toString());
		map.put("bbsId", commandMap.get("bbsId").toString());
		
		Map<String, Object> result = boardService.selectBoardView(map);
		
		model.addAttribute("result", result);
		model.addAttribute("commandMap", commandMap);

		return "board/board_edit";
    
    }
	
	//자유게시판 글등록 처리
	@RequestMapping(value="/board/board_edit_proc.do")
    public String updateFreeBoardProc(Map<String, Object> map, ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		
		map.put("seq", commandMap.get("seq").toString());
		map.put("password", CommonUtil.hexSha256(commandMap.get("password").toString()));
		map.put("title", commandMap.get("title").toString());
		map.put("contents", commandMap.get("contents").toString());
		
		int insertResult = boardService.updateBoard(map);
		if(insertResult == 1) {
			CommonUtil.NotificationMessage(model, "성공", "수정되었습니다.", "location.href='/board/board_list.do?bbsId="+commandMap.get("bbsId").toString()+"';");
		}
		
		return "redirect:/board/board_list.do?bbsId="+commandMap.get("bbsId").toString();
    
    }
	
	//자유게시판 삭제 기능
	@RequestMapping(value="/board/board_delete_proc.do")
    public String deleteBoardProc(Map<String, Object> map, ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		
		map.put("seq", commandMap.get("seq").toString());
		
		int deleteResult = boardService.deleteBoard(map);
		
		if(deleteResult == 1) {
			CommonUtil.NotificationMessage(model, "성공", "삭제되었습니다.", "location.href='/board/board_list.do?bbsId='"+commandMap.get("bbsId").toString());
		}
		
		return "redirect:/board/board_list.do";
    }
	
	//추천 카운트 +1
	@RequestMapping(value="/board/boardGoodCnt_update_proc.ajax")
	@ResponseBody
	public void boardGoodCountUpdate(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HashMap<String, Object> commandMap = CommonUtil.convertMap(request);
		String result = "0";
		String message = "알수없는 오류가 발생했습니다. 다시 시도해 주세요.";
		if(commandMap.get("seq") != null){
			int resultCount = boardService.updateBoardGoodCount(commandMap);

//			if(resultCount > 0 ){
//				result = "2";
//				message = "중복된 사업코드 입니다.";
//			}else{
				result = "1";
				message = "추천 완료.";
//			}
		}
		String json = "{\"result\" : "+result+", \"message\" : \""+message+"\"}";
		CommonUtil.printAjax(json, response);
	}
	
	//비추천 카운트 +1
		@RequestMapping(value="/board/boardBadCnt_update_proc.ajax")
		@ResponseBody
		public void boardBadCountUpdate(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception{
			
			HashMap<String, Object> commandMap = CommonUtil.convertMap(request);
			String result = "0";
			String message = "알수없는 오류가 발생했습니다. 다시 시도해 주세요.";
			if(commandMap.get("seq") != null){
				int resultCount = boardService.updateBoardBadCount(commandMap);

//				if(resultCount > 0 ){
//					result = "2";
//					message = "중복된 사업코드 입니다.";
//				}else{
					result = "1";
					message = "비추천 완료.";
//				}
			}
			String json = "{\"result\" : "+result+", \"message\" : \""+message+"\"}";
			CommonUtil.printAjax(json, response);
		}
	
}
