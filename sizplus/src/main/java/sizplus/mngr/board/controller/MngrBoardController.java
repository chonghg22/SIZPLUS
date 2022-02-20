package sizplus.mngr.board.controller;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.set.SynchronizedSet;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value="/mngr/board/{bbsId}_list.do")
    public String mngrNoticeList(@PathVariable String bbsId, ModelMap model, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception{
		if(session.getAttribute("managerSession") == null) {
			return CommonUtil.NotificationMessage(model, "오류", "로그인 후 이용 가능합니다.", "location.href='/mngr/main/login.do'");
		}
		HashMap<String, Object> commandMap = CommonUtil.convertMap(request);
		commandMap.put("bbsId", bbsId);
		commandMap.put("mngType", "Y");
		List<Map<String, Object>> list = boardService.selectBoardList(commandMap);
		
		model.addAttribute("commandMap", commandMap);
		model.addAttribute("list", list);
		
    	return "mngr/board/board_list";
    }
	
	@RequestMapping(value="/mngr/board/{bbsId}_view.do")
    public String mngrNoticeView(@PathVariable String bbsId, ModelMap model, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception{
		if(session.getAttribute("managerSession") == null) {
			return CommonUtil.NotificationMessage(model, "오류", "로그인 후 이용 가능합니다.", "location.href='/mngr/main/login.do'");
		}
		HashMap<String, Object> commandMap = CommonUtil.convertMap(request);
		commandMap.put("bbsId", bbsId);
		Map<String, Object> result = boardService.selectBoardView(commandMap);
		commandMap.put("fileId", result.get("file_id").toString());
		List<Map<String, Object>> fileList = fileService.selectFileList(commandMap);
		
		model.addAttribute("fileList", fileList);
		model.addAttribute("commandMap", commandMap);
		model.addAttribute("result", result);
		
    	return "mngr/board/board_view";
    }
	
	//글쓰기 페이지
	@RequestMapping(value="/mngr/board/{bbsId}_input.do")
    public String insertFreeBoardList(@PathVariable String bbsId, ModelMap model, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception{
		if(session.getAttribute("managerSession") == null) {
			return CommonUtil.NotificationMessage(model, "오류", "로그인 후 이용 가능합니다.", "location.href='/mngr/main/login.do'");
		}
		HashMap<String, Object> commandMap = CommonUtil.convertMap(request);
		commandMap.put("bbsId", bbsId);
		model.addAttribute("commandMap", commandMap); //페이징 정보
		
		return "mngr/board/board_input";
    }
	
	//자유게시판 글등록 처리
	@RequestMapping(value="/mngr/board/{bbsId}_input_proc.do")
    public String insertMngrBoardProc(@PathVariable String bbsId, ModelMap model, HttpServletResponse response,
    		MultipartHttpServletRequest multiRequest, HttpServletRequest request, HttpSession session) throws IOException, SQLException, RuntimeException, NoSuchAlgorithmException {
		HashMap<String, Object> commandMap = CommonUtil.convertMap(request);
		
		String file_id = "";
		//관리자가 등록한 파일이 있을 경우
		if(multiRequest.getFileMap().get("bbsFile").getSize() > 0) {
			/* 파일 아이디는 시 분 초 랜덤숫자까지 섞여서 아이디를 생성*/
			file_id = UUID.randomUUID().toString();
		}
		commandMap.put("fileId", file_id);
		commandMap.put("inputId", session.getAttribute("mngId"));
		commandMap.put("inputNm", session.getAttribute("mngName"));
		commandMap.put("password", null);
		
		int insertResult = boardService.insertBoard(commandMap);
		if(multiRequest.getFileMap().get("bbsFile").getSize() > 0) {
			Map<String, Object> fileMap = new HashMap<String, Object>();
			if(insertResult ==1) {
				List<MultipartFile> fileList = multiRequest.getFiles("bbsFile");
		        String path = "C:/image/notice/";
		        int fileNum = 0; 
		        for (MultipartFile mf : fileList) {
		            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
		            String randomId = UUID.randomUUID().toString();
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
		                e.printStackTrace();
		            } catch (IOException e) {
		                e.printStackTrace();
		            }
		        }
			}
		}
		if(insertResult == 1) {
			return CommonUtil.NotificationMessage(model, "성공", "등록 되었습니다.", "location.href='/mngr/board/"+bbsId+"_list.do';");
		}
		
		return "redirect:/mngr/board/board_list.do";
    
    }
	
	//글쓰기 페이지
	@RequestMapping(value="/mngr/board/{bbsId}_edit.do")
    public String updateFreeBoardList(@PathVariable String bbsId, ModelMap model, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception{
		if(session.getAttribute("managerSession") == null) {
			return CommonUtil.NotificationMessage(model, "오류", "로그인 후 이용 가능합니다.", "location.href='/mngr/main/login.do'");
		}
		
		HashMap<String, Object> commandMap = CommonUtil.convertMap(request);
		commandMap.put("bbsId", bbsId);
		Map<String, Object> result = boardService.selectBoardView(commandMap);
		commandMap.put("fileId", result.get("file_id").toString());
		List<Map<String, Object>> fileList = fileService.selectFileList(commandMap);
		
		model.addAttribute("fileList", fileList);
		model.addAttribute("result", result);
		model.addAttribute("commandMap", commandMap); //페이징 정보
		
		return "mngr/board/board_edit";
    }
	
	//자유게시판 글등록 처리
	@RequestMapping(value="/mngr/board/{bbsId}_edit_proc.do")
    public String updateMngrBoardProc(@PathVariable String bbsId, ModelMap model, HttpServletResponse response,
    		MultipartHttpServletRequest multiRequest, HttpServletRequest request, HttpSession session) throws IOException, SQLException, RuntimeException, NoSuchAlgorithmException {
		HashMap<String, Object> commandMap = CommonUtil.convertMap(request);
		
		String file_id = "";
		commandMap.put("bbsId", bbsId);
		//관리자가 등록한 파일이 있을 경우
		if(multiRequest.getFileMap().get("bbsFile").getSize() > 0) {
			/* 파일 아이디는 시 분 초 랜덤숫자까지 섞여서 아이디를 생성*/
			file_id = UUID.randomUUID().toString();
			commandMap.put("updateFile", "Y");
		}
		commandMap.put("fileId", file_id);
		commandMap.put("editId", session.getAttribute("mngId"));
		commandMap.put("password", null);
		
		int insertResult = boardService.updateBoard(commandMap);
		if(multiRequest.getFileMap().get("bbsFile").getSize() > 0) {
			Map<String, Object> fileMap = new HashMap<String, Object>();
			if(insertResult ==1) {
				List<MultipartFile> fileList = multiRequest.getFiles("bbsFile");
		        String path = "C:/image/notice/";
		        int fileNum = 0; 
		        for (MultipartFile mf : fileList) {
		            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
		            String randomId = UUID.randomUUID().toString();
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
		                e.printStackTrace();
		            } catch (IOException e) {
		                e.printStackTrace();
		            }
		        }
			}
		}
		if(insertResult == 1) {
			return CommonUtil.NotificationMessage(model, "성공", "수정 되었습니다.", "location.href='/mngr/board/"+bbsId+"_list.do';");
		}
		
		return "redirect:/mngr/board/board_list.do";
    
    }
	
	@RequestMapping(value = "/mngr/board/{bbsId}_delete_chkProc.do")
	public String mngrBoardDeleteChkProc(@PathVariable String bbsId, @RequestParam(value="chkSeq") String[] arr, ModelMap model, HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		HashMap<String, Object> commandMap = CommonUtil.convertMap(request);
		commandMap.put("bbsId", bbsId);
		for(int i=0; i<arr.length; i++) {
			commandMap.put("seq", arr[i]);
		}
		commandMap.put("chkSeq", arr);
		
		int result = boardService.deleteBoardChk(commandMap);
		
		return CommonUtil.NotificationMessage(model, "성공", "삭제 되었습니다.", "location.href='/mngr/board/"+bbsId+"_list.do';");
	}
	
	@RequestMapping(value = "/mngr/board/{bbsId}_delete_proc.do")
	public String mngrBoardDeleteProc(@PathVariable String bbsId, ModelMap model, HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		HashMap<String, Object> commandMap = CommonUtil.convertMap(request);
		commandMap.put("bbsId", bbsId);
		
		int result = boardService.deleteBoard(commandMap);
		
		return CommonUtil.NotificationMessage(model, "성공", "삭제 되었습니다.", "location.href='/mngr/board/"+bbsId+"_list.do';");
	}
	
	
}
