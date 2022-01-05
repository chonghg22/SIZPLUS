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
}
