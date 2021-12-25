//package sizplus.user.board.controller;
//
//import java.util.Iterator;
//import java.util.List;
//import java.util.Map;
//import java.util.Map.Entry;
//
//import javax.annotation.Resource;
//
//import org.apache.log4j.Logger;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import sizplus.common.common.CommandMap;
//import sizplus.sample.service.SampleService;
//import sizplus.user.board.service.BoardService;
//
//@Controller
//public class BoardController {
//	Logger log = Logger.getLogger(this.getClass());
//	
//	@Resource(name="boardService")
//	private BoardService boardService;
//	
//	@RequestMapping(value="/sample/openSampleBoardList.do")
//    public ModelAndView openSampleBoardList(CommandMap commandMap) throws Exception{
//    	ModelAndView mv = new ModelAndView("/sample/boardList");
//    	
//    	List<Map<String,Object>> list = boardService.selectBoardList(commandMap.getMap());
//    	
//    	mv.addObject("list", list);
//    	
//    	return mv;
//    }
//	
//	@RequestMapping(value="/sample/testMapArgumentResolver.do")
//	public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception{
//		ModelAndView mv = new ModelAndView("");
//		
//		if(commandMap.isEmpty() == false){
//			Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
//			Entry<String,Object> entry = null;
//			while(iterator.hasNext()){
//				entry = iterator.next();
//				log.debug("key : "+entry.getKey()+",\tvalue : "+entry.getValue());
//			}
//		}
//		return mv;
//	}
//}
