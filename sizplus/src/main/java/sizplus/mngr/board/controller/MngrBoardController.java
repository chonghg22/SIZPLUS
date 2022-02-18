package sizplus.mngr.board.controller;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.set.SynchronizedSet;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import sizplus.common.common.CommandMap;
import sizplus.common.common.CommonUtil;
import sizplus.mngr.manager.service.ManagerService;
import sizplus.user.board.service.BoardService;
import sizplus.user.file.service.FileService;

@Controller
public class MngrBoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="managerService")
	private ManagerService managerService;
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@Resource(name="fileService")
	private FileService fileService;
	
	@RequestMapping(value="/mngr/board/notice_list.do")
    public String mngrNoticeList(ModelMap model, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception{
		if(session.getAttribute("managerSession") == null) {
			return CommonUtil.NotificationMessage(model, "오류", "로그인 후 이용 가능합니다.", "location.href='/mngr/main/login.do'");
		}
		HashMap<String, Object> commandMap = CommonUtil.convertMap(request);
		commandMap.put("bbsId", "notice");
		commandMap.put("mngType", "Y");
		List<Map<String, Object>> list = boardService.selectBoardList(commandMap);
		
		model.addAttribute("commandMap", commandMap);
		model.addAttribute("list", list);
		
    	return "mngr/board/notice_list";
    }
	
	@RequestMapping(value="/mngr/board/notice_view.do")
    public String mngrNoticeView(ModelMap model, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception{
		if(session.getAttribute("managerSession") == null) {
			return CommonUtil.NotificationMessage(model, "오류", "로그인 후 이용 가능합니다.", "location.href='/mngr/main/login.do'");
		}
		HashMap<String, Object> commandMap = CommonUtil.convertMap(request);
		Map<String, Object> result = boardService.selectBoardView(commandMap);
		commandMap.put("fileId", result.get("file_id").toString());
		List<Map<String, Object>> fileList = fileService.selectFileList(commandMap);
		
		model.addAttribute("commandMap", commandMap);
		model.addAttribute("fileList", fileList);
		model.addAttribute("result", result);
		
    	return "mngr/board/notice_view";
    }
	
	//글쓰기 페이지
	@RequestMapping(value="/mngr/board/notice_input.do")
    public String insertFreeBoardList(ModelMap model, HttpSession session, HttpServletResponse response, HttpServletRequest request, CommandMap commandMap) throws Exception{
		if(session.getAttribute("managerSession") == null) {
			return CommonUtil.NotificationMessage(model, "오류", "로그인 후 이용 가능합니다.", "location.href='/mngr/main/login.do'");
		}
		model.addAttribute("commandMap", commandMap); //페이징 정보
		
		return "mngr/board/notice_input";
    }
	
	//자유게시판 글등록 처리
	@RequestMapping(value="/mngr/board/notice_input_proc.do")
    public String insertMngrBoardProc(ModelMap model, HttpServletResponse response,
    		MultipartHttpServletRequest multiRequest, HttpServletRequest request, HttpSession session) throws IOException, SQLException, RuntimeException, NoSuchAlgorithmException {
		HashMap<String, Object> commandMap = CommonUtil.convertMap(request);
		
		String type_etc = ""; 
		if (commandMap.get("typeEtc") !=null) {
			type_etc = commandMap.get("typeEtc").toString();
		}
		String file_id = "";
		if(multiRequest !=null) {
			/* 파일 아이디는 시 분 초 랜덤숫자까지 섞여서 아이디를 생성*/
			file_id = CommonUtil.idMake("");
		}
		commandMap.put("typeEtc", type_etc);
		commandMap.put("fileId", file_id);
		commandMap.put("inputId", session.getAttribute("mngId"));
		commandMap.put("inputNm", session.getAttribute("mngName"));
		commandMap.put("password", null);
		
		int insertResult = boardService.insertBoard(commandMap);
		Map<String, Object> fileMap = new HashMap<String, Object>();
		if(insertResult ==1) {
			List<MultipartFile> fileList = multiRequest.getFiles("noticeFile");
	        String src = multiRequest.getParameter("src");
	        System.out.println("src value : " + src);
	        String path = "C:/image/notice/";
	        int fileNum = 0; 
	        for (MultipartFile mf : fileList) {
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	            long fileSize = mf.getSize(); // 파일 사이즈

	            System.out.println("originFileName : " + originFileName);
	            System.out.println("fileSize : " + fileSize);
	            String randomId = CommonUtil.idMake("");
	            String safeFile = path + randomId + originFileName;
	            fileNum = fileNum+1;
	            fileMap.put("fileId", file_id);
	            fileMap.put("fileNum", fileNum);
	            fileMap.put("fileName", randomId + originFileName);
	            fileMap.put("fileOrgName", originFileName);
	            fileMap.put("filePath", path);
	            try {
	                mf.transferTo(new File(safeFile));
	                int result = fileService.insertFile(fileMap);
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
//			CommonUtil.requestupload2(multiRequest);
//					int file = fileService.insertFile(paramMap);
//					file_seq++;
		}
		if(insertResult == 1) {
			return CommonUtil.NotificationMessage(model, "성공", "등록 되었습니다.", "location.href='/mngr/board/notice_list.do';");
		}
		
		return "redirect:/mngr/board/notice_list.do";
    
    }
	
	//글쓰기 페이지
	@RequestMapping(value="/mngr/board/notice_edit.do")
    public String updateFreeBoardList(ModelMap model, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception{
		if(session.getAttribute("managerSession") == null) {
			return CommonUtil.NotificationMessage(model, "오류", "로그인 후 이용 가능합니다.", "location.href='/mngr/main/login.do'");
		}
		
		HashMap<String, Object> commandMap = CommonUtil.convertMap(request);
		Map<String, Object> result = boardService.selectBoardView(commandMap);
		
		model.addAttribute("result", result);
		model.addAttribute("commandMap", commandMap); //페이징 정보
		
		return "mngr/board/notice_edit";
    }
	
	@RequestMapping(value = "/mngr/board/notice_delete_chkProc.do")
	public String mngrBoardDeleteChkProc(@RequestParam(value="chkSeq") String[] arr, ModelMap model, HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		HashMap<String, Object> commandMap = CommonUtil.convertMap(request);
		for(int i=0; i<arr.length; i++) {
			commandMap.put("seq", arr[i]);
		}
		commandMap.put("chkSeq", arr);
		
		int result = boardService.deleteBoardChk(commandMap);
		
		return CommonUtil.NotificationMessage(model, "성공", "삭제 되었습니다.", "location.href='/mngr/board/notice_list.do';");
	}
	
	
}
