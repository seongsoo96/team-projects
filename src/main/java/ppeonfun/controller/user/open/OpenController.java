package ppeonfun.controller.user.open;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ppeonfun.controller.user.project.ProjectController;
import ppeonfun.dto.Information;
import ppeonfun.service.user.open.OpenService;
import ppeonfun.util.Paging;

@Controller("user.OpenController")
@RequestMapping("/user/open")
public class OpenController {
private Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired private OpenService openService;
	
	@RequestMapping(value="/list")
	public void list(Paging inData, Model model) {
		logger.info("/user/project/list 실행");
		logger.info("inData {}", inData);
		Paging paging = openService.getPaging(inData);
		List<Information> list = openService.selectAllProject(paging);
		
		
		
		model.addAttribute("category",inData.getCategory());
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
}
