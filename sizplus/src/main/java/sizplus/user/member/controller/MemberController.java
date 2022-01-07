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
import sizplus.common.common.CommonUtil;
import sizplus.user.member.service.MemberService;

@Controller
public class MemberController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	//회원가입 페이지 호출
	@RequestMapping(value="/member/member_input.do")
    public String insertMember(ModelMap model, HttpServletRequest request) throws Exception{

		return "member/member_input";
    }
	
	//회원가입 처리
	@RequestMapping(value="/member/member_input_proc.do")
    public String insertMemberProc(ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		//login.jsp에서 보낸 값들이 commandMap으로 들어옴
		Map<String, Object> map = new  HashMap<String, Object>();
		//이용자가 입력한 아이디 값은 commandMap을 통해서 값을 가져오고 그걸 다시 map에 memberId라는 변수에 담음
		map.put("memberId", commandMap.get("member_id").toString());
		//이용자가 입력한 비밀번호값은 암호화 처리 하여 memberPw라는 변수에 담음
		map.put("memberPw", CommonUtil.hexSha256(commandMap.get("member_pw").toString()));
		
		map.put("memberPwc", commandMap.get("member_pwc").toString());
		map.put("memberNickname", commandMap.get("member_nickname").toString());
		map.put("memberPhoneNum", commandMap.get("member_phone_num").toString());
		map.put("memberBirth", commandMap.get("member_birth").toString());
		if(commandMap.get("member_gender") == null) {
			map.put("memberGender", null);
		}else {
			map.put("memberGender", commandMap.get("member_gender").toString());
		}
		if(commandMap.get("member_way") == null) {
			map.put("memberWay", null);
		}else {
			map.put("memberWay", commandMap.get("member_way").toString());
		}
		
		int result = memberService.insertMemberProc(map);

		
		//실행 완료 후 login.do 메소드로 이동
    	return "redirect:/login.do";
    	//추가 개발사항
    	//2.추가로 넣을 데이터 설계 (이메일,연락처,닉네임 등등)
    	//이미지 넣기 
    	//4.아이디 중복 체크
    }
	
}
