package sizplus.user.file.controller;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import sizplus.common.common.CommonUtil;

@Controller
public class FileController {

	/** MngrMenuService */
//	@Resource(name = "mngrMenuService")
//	private MngrMenuService mngrMenuService;

//	@Autowired
//	private HttpSession session;


    /**
     * 파일명과 코드로 직접 이미지를 출력함
     * f=암호화된 파일명 c=파일 인덱스
     * @param request
     * @param response
     * @throws IOException, SQLException, RuntimeException
     */
    @RequestMapping(value="/file/download.do")
    public void download(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException{
    	HashMap<String, Object> commandMap = CommonUtil.convertMap(request);
    	try {
			
			//CommonUtil.filDown(request, response,"파일경로입력","파일이름이력","다운받았을때출력되는파일이름입력"); //파일다운로드
    		CommonUtil.filDown(request, response,commandMap.get("filePath").toString(),commandMap.get("fileName").toString(),commandMap.get("fileOrgName").toString());

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일다운 에러발생::"+e.toString());
		}
    	
    }
}
