package ppeonfun.controller.admin.story;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ppeonfun.dto.Project;
import ppeonfun.dto.Story;
import ppeonfun.dto.StoryFile;
import ppeonfun.service.admin.story.StoryService;

@Controller("admin.StoryController")
@RequestMapping("/admin/story")
public class StoryController {
	private static final Logger logger = LoggerFactory.getLogger(StoryController.class);
	@Autowired private StoryService storyService;
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String view(Project project, Model model) {
		logger.info("/admin/story/view");
		project = storyService.projectState(project);
		
		if(project!=null && "N".equals(project.getpState())) {//프로젝트가 승인이 안 되었을때
			
		}else if(project!=null && "W".equals(project.getpState())) { //프로젝트가 승인 대기중일때
			boolean isProject = storyService.storyState(project);
			if(isProject) {
				return "redirect:/admin/story/modify?pNo="+project.getpNo();
			}else {
				return "redirect:/admin/story/write?pNo="+project.getpNo();
			}	
		}
		String name = storyService.selectByName(project);
		Story story = storyService.viewStory(project);
		List<StoryFile> fileList = storyService.viewStoryFile(story);
		
		if(story.getsUrl()!=null && !"".equals(story.getsUrl())) {
			String url = storyService.convartUrl(story.getsUrl()); //url 변환
			story.setsUrl(url); //url 변환 값 대입
			logger.info("story url {}",story.getsUrl());
		}
		
		model.addAttribute("storyFile", fileList);
		model.addAttribute("story", story);
		model.addAttribute("name", name);
		return null;
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void writeForm(Project project, Model model) {
		logger.info("/admin/story/write [GET]");
		String name = storyService.selectByName(project);
		
		model.addAttribute("project", project);
		model.addAttribute("name", name);
		
	}
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(Story story, MultipartHttpServletRequest mtfRequest) {
		logger.info("/admin/story/write [POST]");
		logger.info("story {}", story);
		
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		logger.info("fileList {}", fileList);
		story.setsState("Y");
	
		storyService.inputStoryFile(story,fileList);
		
		return "redirect:/admin/project/view?pNo="+story.getpNo();
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyForm(Project project, Model model ) {
		logger.info("/admin/story/modify [GET]");
		
		String name = storyService.selectByName(project);
		Story story = storyService.viewStory(project);
		List<StoryFile> fileList = storyService.viewStoryFile(story);
		
		logger.info("story {}", story);
		for(int i=0; i<fileList.size(); i++) {
			logger.info("storyfile {}", fileList.get(i));
		}
		if(story.getsUrl()!=null && !"".equals(story.getsUrl())) {
			String url = storyService.convartUrl(story.getsUrl()); //url 변환
			story.setsUrl(url); //url 변환 값 대입
			logger.info("story url {}",story.getsUrl());
		}
		
		
		
		
		model.addAttribute("story", story);
		model.addAttribute("storyFile", fileList);
		model.addAttribute("name", name);
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(Story story,  MultipartHttpServletRequest mtfRequest){
		logger.info("/admin/story/modify [POST]");
		logger.info("story {}", story);
		
		story.setsState("Y");
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		
		List<StoryFile> removeList = storyService.viewStoryFile(story);
		logger.info("result {}", story);
		logger.info("fileList {}", fileList);
		logger.info("removeList {}", removeList);
		
		storyService.removeFile(removeList); //파일 정보 및 파일 삭제
		storyService.modifyStoryFile(story,fileList); // 파일 정보 및 파일 수정
		
		
		
		return "redirect:/admin/project/view?pNo="+story.getpNo();
	}
	
	@RequestMapping(value="/url", method=RequestMethod.POST)
	public String url(String sUrl, Model model) {
		logger.info("url [POST]");
		logger.info("sUrl {}", sUrl);
		
		String url = storyService.convartUrl(sUrl);
		
		model.addAttribute("url", url);
		
		return "jsonView";
	}
}
