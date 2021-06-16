package ppeonfun.controller.user.maker.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ppeonfun.dto.Information;
import ppeonfun.dto.Project;
import ppeonfun.service.user.maker.project.ProjectService;
import ppeonfun.util.Paging;

@Controller("user.maker.ProjectController")
@RequestMapping("/user/maker/project")
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	@Autowired private ProjectService projectService;
	
	
	@RequestMapping(value="/list")
	public void list(Paging inData, Model model, HttpSession session) {
		logger.info("/user/maker/project/list 실행");
		logger.info("inData {}", inData);
		int mNo = 0;
		if(session.getAttribute("mNo")!=null) {
			mNo=(int)session.getAttribute("mNo");
		}
		String type = "list";
		Paging paging = projectService.getPaging(inData,mNo,type);
		List<Information> list = projectService.selectAllProject(paging,mNo,type);
		
		logger.info("paging {}", paging);
		logger.info("mNo {}", mNo);
		for(int i=0; i<list.size(); i++) {
			logger.info("value {}", list.get(i));
		}
		
		
		model.addAttribute("category",inData.getCategory());
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	
	@RequestMapping(value="/open")
	public void open(Paging inData, Model model, HttpSession session) {
		logger.info("/user/maker/project/list 실행");
		logger.info("inData {}", inData);
		int mNo = 0;
		if(session.getAttribute("mNo")!=null) {
			mNo=(int)session.getAttribute("mNo");
		}
		String type = "open";
		Paging paging = projectService.getPaging(inData,mNo,type);
		List<Information> list = projectService.selectAllProject(paging,mNo,type);
		
		logger.info("paging {}", paging);
		logger.info("mNo {}", mNo);
		for(int i=0; i<list.size(); i++) {
			logger.info("value {}", list.get(i));
		}
		
		
		model.addAttribute("category",inData.getCategory());
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	
	@RequestMapping(value="/start")
	public void start(Paging inData, Model model, HttpSession session) {
		logger.info("/user/maker/project/list 실행");
		logger.info("inData {}", inData);
		int mNo = 0;
		if(session.getAttribute("mNo")!=null) {
			mNo=(int)session.getAttribute("mNo");
		}
		String type = "start";
		Paging paging = projectService.getPaging(inData,mNo,type);
		List<Information> list = projectService.selectAllProject(paging,mNo,type);
		
		logger.info("paging {}", paging);
		logger.info("mNo {}", mNo);
		for(int i=0; i<list.size(); i++) {
			logger.info("value {}", list.get(i));
		}
		
		
		model.addAttribute("category",inData.getCategory());
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	
	@RequestMapping(value="/view")
	public void view(Project project, Model model) {
		logger.info("/user/maker/project/view 실행");
		String name=  projectService.selectByName(project);
		project = projectService.selectProject(project);
		logger.info("project: {}", project);
		
		model.addAttribute("project", project);
		model.addAttribute("name", name);
		
	}
	@RequestMapping(value="/write")
	public String write(HttpSession session,Model model) {
		logger.info("/user/maker/project/write 실행");
		Project project = projectService.input((Integer)session.getAttribute("mNo"));
		logger.info("project {}", project);
		model.addAttribute("pNo", project.getpNo());
		
		return "redirect:/user/maker/project/view";
	}
	@RequestMapping(value="/submit")
	public String submit(Model model, Project project) {
		project = projectService.selectProject(project);
		project = projectService.submitProject(project);
		
		return "redirect:/user/maker/project/view?pNo="+project.getpNo();
	}
	
}
