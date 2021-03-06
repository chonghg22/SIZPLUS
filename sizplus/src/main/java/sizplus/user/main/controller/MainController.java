package sizplus.user.main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.apache.log4j.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.jdbc.authentication.Sha256PasswordPlugin;

import sizplus.common.common.CommandMap;
import sizplus.common.common.CommonUtil;
import sizplus.user.board.service.BoardService;
import sizplus.user.main.service.MainService;
import sizplus.user.member.dao.MemberVO;
import sizplus.user.member.service.MemberService;

@Controller
public class MainController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@RequestMapping(value="/index.do")
    public String mainList(Map<String, Object> map, ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		HashMap<String, Object> resultMap = CommonUtil.convertMap(request);
		resultMap.put("firstIndex", 0);
		resultMap.put("recordCountPerPage", 5);
		resultMap.put("openYn", "Y");
		resultMap.put("bbsId", "free");
		List<Map<String, Object>> freeBoardList = boardService.selectBoardList(resultMap);
		resultMap.put("bbsId", "life");
		List<Map<String, Object>> lifeBoardList = boardService.selectBoardList(resultMap);
		resultMap.put("bbsId", "notice");
		List<Map<String, Object>> noticeBoardList = boardService.selectBoardList(resultMap);
		resultMap.put("bbsId", "faq");
		List<Map<String, Object>> faqBoardList = boardService.selectBoardList(resultMap);
		resultMap.put("bbsId", "qna");
		List<Map<String, Object>> qnaBoardList = boardService.selectBoardList(resultMap);
		String search = "";
		search = "요리";
		List<Map<String, Object>> cookSearch = CommonUtil.youtubeSearch(search);
		search = "먹방";
		List<Map<String, Object>> eatSearch = CommonUtil.youtubeSearch(search);
		
		model.addAttribute("cookSearch", cookSearch);
		model.addAttribute("eatSearch", eatSearch);
		model.addAttribute("qnaBoardList", qnaBoardList);
		model.addAttribute("faqBoardList", faqBoardList);
		model.addAttribute("freeBoardList", freeBoardList);
		model.addAttribute("lifeBoardList", lifeBoardList);
		model.addAttribute("noticeBoardList", noticeBoardList);
		
    	return "user/main/main";
    }
	
	@RequestMapping(value="/login.do")
    public String loginView(CommandMap commandMap) throws Exception{
    	
    	return "user/main/login";
    }
	
	@RequestMapping(value="/contact.do")
    public String contactView(CommandMap commandMap) throws Exception{
    	
    	return "user/main/contact";
    }
	
	@RequestMapping(value="/login_proc.do")
    public String loginProc(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session, CommandMap commandMap) throws Exception {
    	//추가 개발사항
		//1.비밀번호 n번 이상 틀릴경우 로그인 못하게 막기
		//2.추후  로그테이블 만들어서 로그인 이력 남기기
		
		//MemberVO 객체 생성
		MemberVO memberVO = new MemberVO();
		//아이디를 입력하지 않고 로그인 버튼을 누를경우 alert창 호출
		if("".equals(commandMap.get("member_id").toString())) {
			HashMap<String, String> message = new HashMap<String, String>();
			message.put("title","오류");
			message.put("msg","아이디가 입력되지 않았습니다.");
			message.put("scriptName","history.back();");
			model.addAttribute("message", message);
			return "comm/message/message";
		}
		//비밀번호를 입력하지 않고 로그인 버튼을 누를경우 alert창 호출
		if("".equals(commandMap.get("member_pw").toString())) {
//			CommonUtil.NotificationMessage(model, "오류", "비밀번호가 입력되지 않았습니다.", "history.back();");
			HashMap<String, String> message = new HashMap<String, String>();
			message.put("title","오류");
			message.put("msg","비밀번호가 입력되지 않았습니다.");
			message.put("scriptName","history.back();");
			model.addAttribute("message", message);
			return "comm/message/message";
		}
		//이용자가 입력한 Id,Pw를 memberVO 변수에 넣음
		memberVO.setMemberId(commandMap.get("member_id").toString());
		//이용자가 입력한 비밀번호를 memberVO 변수에 넣을때 암호화 해서 넣음
		memberVO.setMemberPw(CommonUtil.hexSha256(commandMap.get("member_pw").toString()));
		MemberVO result = memberService.selectUserLoginView(memberVO);
		if(result == null) {
			HashMap<String, String> message = new HashMap<String, String>();
			message.put("title","오류");
			message.put("msg","로그인 정보를 확인 해 주세요.");
			message.put("scriptName","history.back();");
			model.addAttribute("message", message);
			return "comm/message/message";
		}
		//로그인에 성공 할 경우 session에 로그인 한 유저의 정보를 저장
		if(result != null) {
			session.setAttribute("memberSession", memberVO);
			session.setAttribute("memberSeq", result.getMemberSeq());
			session.setAttribute("memberId", result.getMemberId());
			session.setAttribute("memberNickName", result.getMemberNickname());
		}
		return "redirect:/index.do";
    }
	
	@RequestMapping(value="/logout_proc.do")
    public String logoutProc(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session, CommandMap commandMap) throws Exception {
		RequestContextHolder.getRequestAttributes().removeAttribute("memberSession", RequestAttributes.SCOPE_SESSION);
		session.invalidate();
		return "redirect:/index.do";
    }
	
	
}
