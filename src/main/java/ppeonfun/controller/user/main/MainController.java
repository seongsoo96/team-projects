package ppeonfun.controller.user.main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ppeonfun.dto.Information;
import ppeonfun.service.user.main.MainService;
import ppeonfun.util.Paging;

/**
 * Handles requests for the application home page.
 */
@Controller("user.MainController")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired private MainService mainService;
	
	@RequestMapping(value ="/")
	public String main() {
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home(Paging inData, Model model) {
		Paging paging=mainService.getPaging(inData);
		//최신 데이터 개수
		List<Information> list = mainService.selectAllLatery(paging);
		//좋아요 개수
		List<Information> list2 = mainService.selectFavorite();
		
		for(int i=0; i<list.size(); i++) {
			logger.info(list.get(i).toString());
		}
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("paging", paging);
		return "/user/main";
	}
	
	@RequestMapping(value = "/main/ajax", method = RequestMethod.GET)
	public String ajax(Paging inData, Model model) {
		Paging paging=mainService.getPaging(inData);
		//최신 데이터 개수
		List<Information> list = mainService.selectAllLatery(paging);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		return "jsonView";
	}
	
}
