package ppeonfun.controller.admin.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ppeonfun.dto.Project;
import ppeonfun.service.admin.project.ProjectService;
import ppeonfun.util.Paging;

@Controller("admin.ProjectController")
@RequestMapping(value="/admin/project")
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired private ProjectService projectService;
	
	@RequestMapping(value="/list")
	public void list(Paging inData, Model model) {
		logger.info("/admin/project/list 실행");
		Paging paging = projectService.getPaging(inData);
		List<Project> list = projectService.selectAllProject(paging);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
	}
	@RequestMapping(value="/view")
	public void view(Project project, Model model) {
		logger.info("/admin/project/view 실행");
		String name=  projectService.selectByName(project);
		project = projectService.selectProject(project);
		logger.info("project: {}", project);
		
		model.addAttribute("project", project);
		model.addAttribute("name", name);
		
	}
	@RequestMapping(value="/write")
	public String write(HttpSession session,Model model) {
		logger.info("/admin/project/write 실행");
		Project project = projectService.input((Integer)session.getAttribute("mNo"));
		logger.info("project {}", project);
		model.addAttribute("pNo", project.getpNo());
		
		return "redirect:/admin/project/view";
	}
	
	public String submit(Model model, Project project) {
		project = projectService.selectProject(project);
		project = projectService.submitProject(project);
		
		
		model.addAttribute("project", project);
		return "redirect:/admin/project/view";
	}
}
