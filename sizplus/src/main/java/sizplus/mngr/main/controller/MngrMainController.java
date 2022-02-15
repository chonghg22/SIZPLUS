package sizplus.mngr.main.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import sizplus.common.common.CommandMap;
import sizplus.common.common.CommonUtil;
import sizplus.mngr.manager.dao.ManagerVO;
import sizplus.mngr.manager.service.ManagerService;

@Controller
public class MngrMainController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="managerService")
	private ManagerService managerService;
	
	@RequestMapping(value="/mngr/main/index.do")
    public String mngrIndex(ModelMap model, CommandMap commandMap, HttpSession session) throws Exception{
		if(session.getAttribute("managerSession") == null) {
			return CommonUtil.NotificationMessage(model, "오류", "로그인 후 이용 가능합니다.", "location.href='/mngr/main/login.do'");
		}
		
    	return "mngr/main/index";
    }
	
	@RequestMapping(value="/mngr/main/login.do")
    public String loginView(ModelMap model,CommandMap commandMap, HttpSession session) throws Exception{
		if(session.getAttribute("managerSession") != null) {
			return CommonUtil.NotificationMessage(model, "오류", "이미 로그인 되었습니다.", "location.href='/mngr/main/index.do'");
		}
    	return "mngr/main/login";
    }
	
	
	@RequestMapping(value="/mngr/main/login_proc.do")
    public String loginProc(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session, CommandMap commandMap) throws Exception {

		ManagerVO managerVO = new ManagerVO();
		//아이디를 입력하지 않고 로그인 버튼을 누를경우 alert창 호출
		if("".equals(commandMap.get("mng_id").toString())) {
			return CommonUtil.NotificationMessage(model, "오류", "아이디가 입력되지 않았습니다.", "history.back();");
		}
		//비밀번호를 입력하지 않고 로그인 버튼을 누를경우 alert창 호출
		if("".equals(commandMap.get("mng_pass").toString())) {
			return CommonUtil.NotificationMessage(model, "오류", "비밀번호가 입력되지 않았습니다.", "history.back();");
		}
		//이용자가 입력한 Id,Pw를 memberVO 변수에 넣음
		managerVO.setMngId(commandMap.get("mng_id").toString());
		//이용자가 입력한 비밀번호를 memberVO 변수에 넣을때 암호화 해서 넣음
		managerVO.setMngPass(CommonUtil.hexSha256(commandMap.get("mng_pass").toString()));
		ManagerVO result = managerService.selectManagerLoginView(managerVO);
		if(result == null) {
			return CommonUtil.NotificationMessage(model, "오류", "로그인 정보를 확인 해 주세요.", "history.back();");
		}
		//로그인에 성공 할 경우 session에 로그인 한 유저의 정보를 저장
		if(result != null) {
			session.setAttribute("managerSession", managerVO);
			session.setAttribute("mngSeq", result.getMngSeq());
			session.setAttribute("mngId", result.getMngId());
			session.setAttribute("mngName", result.getMngName());
		}
		return "redirect:/mngr/main/index.do";
    }
	
	@RequestMapping(value="/mngr/main/logout_proc.do")
    public String logoutProc(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session, CommandMap commandMap) throws Exception {
		RequestContextHolder.getRequestAttributes().removeAttribute("managerSession", RequestAttributes.SCOPE_SESSION);
		session.invalidate();
		return "redirect:/mngr/main/login.do";
    }
	
	
}
