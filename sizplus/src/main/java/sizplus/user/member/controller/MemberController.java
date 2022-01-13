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
	
	//회원가입 페이지 호출
	@RequestMapping(value="/member/mypage.do")
    public String seelctMyPageView(ModelMap model, HttpServletRequest request) throws Exception{

		return "member/mypage";
    }
	
	
	
	//회원가입 처리
	@RequestMapping(value="/member/member_input_proc.do")
    public String insertMemberProc(ModelMap model, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		//login.jsp에서 보낸 값들이 commandMap으로 들어옴
		Map<String, Object> map = new  HashMap<String, Object>();
		//jsp에서 자바스크립트로 무조건 입력하게 해놔서 별도로 if 구문 사용하지 않음
		//이용자가 입력한 아이디 값은 commandMap을 통해서 값을 가져오고 그걸 다시 map에 memberId라는 변수에 담음
		map.put("memberId", commandMap.get("member_id").toString());
		//이용자가 입력한 비밀번호값은 암호화 처리 하여 memberPw라는 변수에 담음
		map.put("memberPw", CommonUtil.hexSha256(commandMap.get("member_pw").toString()));
		
		map.put("memberPwc", commandMap.get("member_pwc").toString());
		map.put("memberNickname", commandMap.get("member_nickname").toString());
		map.put("memberPhoneNum", commandMap.get("member_phone_num").toString());
		map.put("memberBirth", commandMap.get("member_birth").toString());
		
		
		//jsp에서 member_gender 값이 null 이면 에러가 떠서  member_gender가 null일경우 대체 값을 입력
		if(commandMap.get("member_gender") == null) {
			//대신 들어가는 값
			map.put("memberGender", "대신 들어감");
		//그게 아니고 memberGender 값이 null 아닐경우 jsp에서 보내주는 값을 저장
		}else {
			map.put("memberGender", commandMap.get("member_gender").toString());
		}
		if(commandMap.get("member_way") == null) {
			map.put("memberWay", "대신 들어감");
		}else {
			//사용자가 입력한 값을 넣어줌
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
