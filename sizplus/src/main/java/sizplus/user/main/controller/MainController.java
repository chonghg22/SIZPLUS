package sizplus.user.main.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sizplus.common.common.CommandMap;
import sizplus.user.main.service.MainService;
import sizplus.user.member.dao.MemberVO;
import sizplus.user.member.service.MemberService;

@Controller
public class MainController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@RequestMapping(value="/index.do")
    public String mainList(CommandMap commandMap) throws Exception{
    	
//    	List<Map<String,Object>> list = mainService.selectBoardList(commandMap.getMap());
    	return "main/main";
    }
	
	@RequestMapping(value="/login.do")
    public String loginView(CommandMap commandMap) throws Exception{
    	
//    	List<Map<String,Object>> list = mainService.selectBoardList(commandMap.getMap());
    	return "login/login";
    }
	
	@RequestMapping(value="/login_proc.do")
    public String loginProc(CommandMap commandMap, HttpServletResponse response) throws Exception{
    	//MemberVO 객체 생성
		MemberVO memberVO = new MemberVO();
		Map<String, Object> map = new  HashMap<String, Object>();
		//이용자가 입력한 Id,Pw를 memberVO 변수에 넣음
		memberVO.setMemberId(commandMap.get("memberId").toString());
		memberVO.setMemberPw(commandMap.get("memberPw").toString());
		MemberVO result = memberService.selectUserLoginView(memberVO);
		System.out.println("result::"+result);
		String url = "";
		if(result != null) {
			url = "redirect:/index.do";
		}else{
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
            out.flush();
		}
		return url;
    }
	
	
}
