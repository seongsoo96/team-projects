package ppeonfun.controller.user.maker.open;

import java.util.HashMap;
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
import ppeonfun.service.user.maker.open.OpenService;
import ppeonfun.util.Paging;

@Controller("user.maker.OpenController")
@RequestMapping("/user/maker/open")
public class OpenController {
	private static final Logger logger = LoggerFactory.getLogger(OpenController.class);
	@Autowired private OpenService openService;
	
	@RequestMapping(value="/requirement")
	public void requirement(Project project, Model model) {
		logger.info("/user/maker/open/requirement ");
		
		String name = openService.viewByName(project);
		Requirement requirement = openService.viewRequirement(project);
		RequirementFile requirementFile = openService.viewRequirementFile(requirement);
		project = openService.viewProject(project);
		
		model.addAttribute("requirement", requirement);
		model.addAttribute("requirementFile", requirementFile);
		model.addAttribute("name", name);
		model.addAttribute("project", project);
	}
	@RequestMapping(value="/information")
	public void information(Project project, Model model) {
		logger.info("/user/maker/open/information ");
		
		String name = openService.viewByName(project);
		Information information = openService.viewInformation(project);
		project = openService.viewProject(project);
		
		model.addAttribute("information", information);
		model.addAttribute("name", name);
		model.addAttribute("project", project);
	}
	@RequestMapping(value="/story")
	public void story(Project project, Model model) {
		logger.info("/user/maker/open/story ");
		String name = openService.viewByName(project);
		Story story = openService.viewStory(project);
		List<StoryFile> fileList = openService.viewStoryFile(story);
		
		if(story.getsUrl()!=null && !"".equals(story.getsUrl())) {
			String url = openService.convartUrl(story.getsUrl()); //url 변환
			story.setsUrl(url); //url 변환 값 대입
			logger.info("story url {}",story.getsUrl());
		}
		
		project = openService.viewProject(project);
		model.addAttribute("storyFile", fileList);
		model.addAttribute("story", story);
		model.addAttribute("name", name);
		model.addAttribute("project", project);
	}
	
	@RequestMapping(value="/reward")
	public void reward(Project project, Model model) {
		logger.info("/user/maker/open/reward ");
		String name = openService.viewByName(project);
		List<Reward> rewardList = openService.viewRewardList(project);
		project = openService.viewProject(project);
		
		model.addAttribute("rewardList", rewardList);
		model.addAttribute("name", name);
		model.addAttribute("project", project);
	}
	@RequestMapping(value="/maker")
	public void maker(Project project, Model model) {
		logger.info("/user/maker/open/maker");
		String name = openService.viewByName(project);
		Maker maker = openService.viewMaker(project);
		project = openService.viewProject(project);
		
		model.addAttribute("maker", maker);
		model.addAttribute("name", name);
		model.addAttribute("project", project);
	}
	
	@RequestMapping(value="/alarm")
	public void alarm(Project project, Model model, Paging inData) {
		
		logger.info("/user/maker/alarm 실행");
		Paging paging = openService.getPaging(inData,project);
		List<HashMap<String, Object>> list = openService.selectAllAlarm(paging,project);
		
		for(int i=0; i<list.size(); i++) {
			for(String e : list.get(i).keySet()) {
				logger.info("key: {} value: {}", e, list.get(i).get(e));
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
	}

	
}
