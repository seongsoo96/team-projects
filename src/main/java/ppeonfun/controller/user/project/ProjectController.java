package ppeonfun.controller.user.project;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ppeonfun.dto.Information;
import ppeonfun.dto.Maker;
import ppeonfun.dto.Project;
import ppeonfun.dto.Requirement;
import ppeonfun.dto.RequirementFile;
import ppeonfun.dto.Reward;
import ppeonfun.dto.Story;
import ppeonfun.dto.StoryFile;
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
		logger.info("inData {}", inData);
		Paging paging = projectService.getPaging(inData);
		List<Information> list = projectService.selectAllProject(paging);

		model.addAttribute("category",inData.getCategory());
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	
	@RequestMapping(value="/story/requirement")
	public void requirement(Project project, Model model) {
		logger.info("/user/project/requirement ");
		
		String name = projectService.viewByName(project);
		Requirement requirement = projectService.viewRequirement(project);
		RequirementFile requirementFile = projectService.viewRequirementFile(requirement);
		project = projectService.viewProject(project);
		
		model.addAttribute("requirement", requirement);
		model.addAttribute("requirementFile", requirementFile);
		model.addAttribute("name", name);
		model.addAttribute("info", project);
	}
	@RequestMapping(value="/story/information")
	public void information(Project project, Model model) {
		logger.info("/user/project/information ");
		
		String name = projectService.viewByName(project);
		Information information = projectService.viewInformation(project);
		project = projectService.viewProject(project);
		
		model.addAttribute("information", information);
		model.addAttribute("name", name);
		model.addAttribute("info", project);
	}
	@RequestMapping(value="/story/story")
	public void story(Project project, Model model) {
		logger.info("/user/project/story ");
		String name = projectService.viewByName(project);
		Story story = projectService.viewStory(project);
		List<StoryFile> fileList = projectService.viewStoryFile(story);
		
		if(story.getsUrl()!=null && !"".equals(story.getsUrl())) {
			String url = projectService.convartUrl(story.getsUrl()); //url 변환
			story.setsUrl(url); //url 변환 값 대입
			logger.info("story url {}",story.getsUrl());
		}
		
		project = projectService.viewProject(project);
		model.addAttribute("storyFile", fileList);
		model.addAttribute("story", story);
		model.addAttribute("name", name);
		model.addAttribute("info", project);
	}
	
	@RequestMapping(value="/story/reward")
	public void reward(Project project, Model model) {
		logger.info("/user/project/reward ");
		String name = projectService.viewByName(project);
		List<Reward> rewardList = projectService.viewRewardList(project);
		project = projectService.viewProject(project);
		
		model.addAttribute("rewardList", rewardList);
		model.addAttribute("name", name);
		model.addAttribute("info", project);
	}
	@RequestMapping(value="/story/maker")
	public void maker(Project project, Model model) {
		logger.info("/user/project/maker");
		String name = projectService.viewByName(project);
		Maker maker = projectService.viewMaker(project);
		project = projectService.viewProject(project);
		
		model.addAttribute("maker", maker);
		model.addAttribute("name", name);
		model.addAttribute("info", project);
	}
}
