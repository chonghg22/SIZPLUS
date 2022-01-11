package sizplus.user.board.controller;

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
import sizplus.user.board.service.BoardService;

@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	//회원가입 처리
	@RequestMapping(value="/board/board_list.do")
    public String selectBoardList(ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		//login.jsp에서 보낸 값들이 commandMap으로 들어옴
		
		List<Map<String, Object>> list = boardService.selectBoardList(commandMap);
		model.addAttribute("list", list);
		//실행 완료 후 login.do 메소드로 이동
    	return "board/board_list";
    	//추가 개발사항
    	//2.추가로 넣을 데이터 설계 (이메일,연락처,닉네임 등등)
    	//4.아이디 중복 체크
    }
	
	
	//자유게시판 글쓰기 페이지
	@RequestMapping(value="/board/board_input.do")
    public String insertFreeBoardList(ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		
		//실행 완료 후 input.do 메소드로 이동
    	return "board/board_input";
    
    }
	
	//자유게시판 글쓰기 페이지
	@RequestMapping(value="/board/board_input_proc.do")
    public String insertFreeBoardProcList(Map<String, Object> map, ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		
		//jsp에서 작성한 input 태그의 name값을 CommandMap으로 가져옴 
		commandMap.get("nick_name").toString();
		commandMap.get("password").toString();
		commandMap.get("title").toString();
		commandMap.get("contents").toString();
		System.out.println("이게뭐고");
		map.put("nickName", commandMap.get("nick_name").toString());
		map.put("password", commandMap.get("password").toString());
		map.put("title", commandMap.get("title").toString());
		map.put("contents", commandMap.get("contents").toString());
		
		int insertResult = boardService.insertFreeBoard(map);
		
		
		//실행 완료 후 input.do 메소드로 이동
		return "redirect:/board/board_list.do";
    
    }
	
	
	
	
	//모두의 꿀팁
		@RequestMapping(value="/board/userTip_list.do")
	    public String selectUserTipList(Map<String, Object> map, ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
			//login.jsp에서 보낸 값들이 commandMap으로 들어옴
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
			

			int totCnt = boardService.selectUserTipCnt(commandMap); //게시글 수

			/** paging setting */
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(page);
			paginationInfo.setRecordCountPerPage(viewCount);
			paginationInfo.setPageSize(10);
			paginationInfo.setTotalRecordCount(totCnt);
			
			map.put("firstIndex", paginationInfo.getFirstRecordIndex());
			map.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());

			List<Map<String, Object>> list = boardService.selectUserTipList(map);
			
			model.addAttribute("commandMap", commandMap); //페이징 정보
			model.addAttribute("paginationInfo", paginationInfo); //페이징 정보
			model.addAttribute("listNo", (totCnt - ((page - 1)* paginationInfo.getRecordCountPerPage()))); //페이지 No 의 시작 값 가상의 넘버링
			model.addAttribute("list", list);
			//실행 완료 후 login.do 메소드로 이동
	    	return "board/userTip_list";
	    	//추가 개발사항
	    	//2.추가로 넣을 데이터 설계 (이메일,연락처,닉네임 등등)
	    	//4.아이디 중복 체크
	    }
	
	
}
