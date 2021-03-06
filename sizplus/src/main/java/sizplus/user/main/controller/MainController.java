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
		search = "??????";
		List<Map<String, Object>> cookSearch = CommonUtil.youtubeSearch(search);
		search = "??????";
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
    	//?????? ????????????
		//1.???????????? n??? ?????? ???????????? ????????? ????????? ??????
		//2.??????  ??????????????? ???????????? ????????? ?????? ?????????
		
		//MemberVO ?????? ??????
		MemberVO memberVO = new MemberVO();
		//???????????? ???????????? ?????? ????????? ????????? ???????????? alert??? ??????
		if("".equals(commandMap.get("member_id").toString())) {
			HashMap<String, String> message = new HashMap<String, String>();
			message.put("title","??????");
			message.put("msg","???????????? ???????????? ???????????????.");
			message.put("scriptName","history.back();");
			model.addAttribute("message", message);
			return "comm/message/message";
		}
		//??????????????? ???????????? ?????? ????????? ????????? ???????????? alert??? ??????
		if("".equals(commandMap.get("member_pw").toString())) {
//			CommonUtil.NotificationMessage(model, "??????", "??????????????? ???????????? ???????????????.", "history.back();");
			HashMap<String, String> message = new HashMap<String, String>();
			message.put("title","??????");
			message.put("msg","??????????????? ???????????? ???????????????.");
			message.put("scriptName","history.back();");
			model.addAttribute("message", message);
			return "comm/message/message";
		}
		//???????????? ????????? Id,Pw??? memberVO ????????? ??????
		memberVO.setMemberId(commandMap.get("member_id").toString());
		//???????????? ????????? ??????????????? memberVO ????????? ????????? ????????? ?????? ??????
		memberVO.setMemberPw(CommonUtil.hexSha256(commandMap.get("member_pw").toString()));
		MemberVO result = memberService.selectUserLoginView(memberVO);
		if(result == null) {
			HashMap<String, String> message = new HashMap<String, String>();
			message.put("title","??????");
			message.put("msg","????????? ????????? ?????? ??? ?????????.");
			message.put("scriptName","history.back();");
			model.addAttribute("message", message);
			return "comm/message/message";
		}
		//???????????? ?????? ??? ?????? session??? ????????? ??? ????????? ????????? ??????
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
