package ppeonfun.controller.user.project;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ppeonfun.dto.Information;
import ppeonfun.service.user.project.ProjectService;
import ppeonfun.util.Paging;

@Controller("user.ProjectController")
@RequestMapping(value="/user/project")
public class ProjectController {
	private Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired private ProjectService projectService;
	
	@RequestMapping(value="/list")
	public void list(Paging inData, Model model) {
		logger.info("/user/project/list 실행");
		Paging paging = projectService.getPaging(inData);
		List<Information> list = projectService.selectAllProject(paging);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
}
