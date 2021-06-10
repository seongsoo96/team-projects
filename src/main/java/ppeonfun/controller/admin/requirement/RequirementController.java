package ppeonfun.controller.admin.requirement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dto.Project;
import ppeonfun.dto.Requirement;
import ppeonfun.dto.RequirementFile;
import ppeonfun.service.admin.requirement.RequirementService;

@Controller("user.RequirementController")
@RequestMapping(value="/admin/requirement")
public class RequirementController {
	private static final Logger logger = LoggerFactory.getLogger(RequirementController.class);
	
	@Autowired private RequirementService requirementService;
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String view(Project project, Model model) {
		logger.info("/admin/requirement/view");
		project = requirementService.projectState(project);
		
		if(project!=null && "N".equals(project.getpState())) {//프로젝트가 승인이 안 되었을때
			
		}else if(project!=null && "W".equals(project.getpState())) { //프로젝트가 승인 대기중일때
			boolean isProject = requirementService.requirementState(project);
			if(isProject) {
				return "redirect:/admin/requirement/modify?pNo="+project.getpNo();
			}else {
				return "redirect:/admin/requirement/write?pNo="+project.getpNo();
			}	
		}
		String name = requirementService.selectByName(project);
		Requirement requirement = requirementService.viewRequirement(project);
		RequirementFile requirementFile = requirementService.viewRequirementFile(requirement);
		project = requirementService.viewProject(project);
		
		model.addAttribute("requirement", requirement);
		model.addAttribute("requirementFile", requirementFile);
		model.addAttribute("name", name);
		model.addAttribute("project", project);
		return null;
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void writeForm(Project project, Model model) {
		logger.info("/admin/requirement/write [GET]");
		String name = requirementService.selectByName(project);
		
		model.addAttribute("project", project);
		model.addAttribute("name", name);
		
	}
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(Requirement requirement, MultipartFile file) {
		logger.info("/admin/requirement/write [POST]");
		logger.info("requirement {}", requirement);
		logger.info("file {}", file);
		
		requirementService.inputRequirementFile(requirement,file);
		
		return "redirect:/admin/project/view?pNo="+requirement.getpNo();
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyForm(Project project, Model model ) {
		logger.info("/admin/requirement/modify [GET]");
		
		String name = requirementService.selectByName(project);
		Requirement requirement = requirementService.viewRequirement(project);
		RequirementFile requirementFile = requirementService.viewRequirementFile(requirement);
		
		
		model.addAttribute("requirement", requirement);
		model.addAttribute("requirementFile", requirementFile);
		model.addAttribute("name", name);
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(Requirement requirement, MultipartFile file, String storedName){
		logger.info("/admin/requirement/modify [POST]");
		logger.info("requirement {}", requirement);
		logger.info("file {}", file);
		
		requirement = requirementService.getRequirement(requirement);
		logger.info("result {}", requirement);
		
		logger.info("storedName {}", storedName);
		requirementService.removeFile(storedName, requirement); //파일 정보 및 파일 삭제
		requirementService.modifyRequirementFile(requirement,file); // 파일 정보 및 파일 수정
		
		return "redirect:/admin/project/view?pNo="+requirement.getpNo();
	}
	
	
}
