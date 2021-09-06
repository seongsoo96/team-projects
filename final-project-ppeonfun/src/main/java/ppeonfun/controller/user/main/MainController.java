package ppeonfun.controller.user.main;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ppeonfun.dto.Information;
import ppeonfun.service.user.main.MainService;
import ppeonfun.service.user.project.ProjectService;
import ppeonfun.util.Paging;

/**
 * Handles requests for the application home page.
 */
@Controller("user.MainController")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired private MainService mainService;
	@Autowired private ProjectService projectService;
	
	@RequestMapping(value ="/")
	public String main() {
		logger.info("메인 페이지 시작");
		
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
		List<HashMap<String, Object>> amountList = projectService.amountList(list);
		
		
		model.addAttribute("list", amountList);
		model.addAttribute("list2", list2);
		model.addAttribute("paging", paging);
		return "/user/main";
	}
	
	@RequestMapping(value = "/main/ajax", method = RequestMethod.GET)
	public String ajax(Paging inData, Model model) {
		Paging paging=mainService.getPaging(inData);
		//최신 데이터 개수
		List<Information> list = mainService.selectAllLatery(paging);
		List<HashMap<String, Object>> amountList = projectService.amountList(list);
		
		
		model.addAttribute("list", amountList);
		model.addAttribute("paging", paging);
		
		
		logger.info("ajax list {}", amountList);
		logger.info("ajax paging {}", paging);
		
		return "/user/ajax/mainProject";
	}
	
}
