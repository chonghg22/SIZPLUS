package sizplus.user.main.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sizplus.common.common.CommandMap;
import sizplus.user.main.service.MainService;

@Controller
public class MainController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@RequestMapping(value="/index.do")
    public String openSampleBoardList(CommandMap commandMap) throws Exception{
    	
    	List<Map<String,Object>> list = mainService.selectBoardList(commandMap.getMap());
    	System.out.println("메인::"+list);
    	return "main/main";
    }
	
}
