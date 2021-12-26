package sizplus.user.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import sizplus.common.common.CommandMap;
import sizplus.user.member.service.MemberService;

@Controller
public class MemberController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@RequestMapping(value="/member/member_input_proc.do")
    public String insertMemberProc(ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		//login.jsp에서 보낸 값들이 commandMap으로 들어옴
		Map<String, Object> map = new  HashMap<String, Object>();
		//commandMap에 들어가있는 memberId 값을 map에 memberId 라는 변수로 값 넣어주기
		map.put("memberId", commandMap.get("memberId"));
		map.put("memberPw", commandMap.get("memberPw"));
		int result = memberService.insertMemberProc(map);
		//실행 완료 후 login.do 메소드로 이동
    	return "redirect:/login.do";
    	//추가 개발사항
    	//1.비밀번호 암호화 
    	//2.추가로 넣을 데이터 설계 (이메일,연락처,닉네임 등등)
    	//3.Map으로 값을 넣는게 아닌 VO로 변경
    	//4.아이디 중복 체크
    	//5.로그인 기능 만들기
    }
	
}
