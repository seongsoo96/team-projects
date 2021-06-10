package ppeonfun.controller.admin.information;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dto.Information;
import ppeonfun.dto.Project;
import ppeonfun.service.admin.information.InformationService;

@Controller("admin.InformationController")
@RequestMapping("/admin/information")
public class InformationController {
	private static final Logger logger = LoggerFactory.getLogger(InformationController.class);
	
	@Autowired private InformationService informationService;
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String view(Project project, Model model) {
		logger.info("/admin/information/view");
		project = informationService.projectState(project);
		
		if(project!=null && "N".equals(project.getpState())) {//프로젝트가 승인이 안 되었을때
			
		}else if(project!=null && "W".equals(project.getpState())) { //프로젝트가 승인 대기중일때
			boolean isProject = informationService.informationState(project);
			if(isProject) {
				return "redirect:/admin/information/modify?pNo="+project.getpNo();
			}else {
				return "redirect:/admin/information/write?pNo="+project.getpNo();
			}	
		}
		String name = informationService.selectByName(project);
		Information information = informationService.viewInformation(project);
		project = informationService.viewProject(project);
		model.addAttribute("information", information);
		model.addAttribute("name", name);
		model.addAttribute("project", project);
		return null;
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void writeForm(Project project, Model model) {
		logger.info("/admin/information/write [GET]");
		String name = informationService.selectByName(project);
		
		model.addAttribute("project", project);
		model.addAttribute("name", name);
		
	}
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(Information information, MultipartFile file, @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate) {
		logger.info("/admin/information/write [POST]");
		
		information.setiEndDate(endDate); //날짜 삽입
		logger.info("information {}", information);
		logger.info("file {}", file);
		
		informationService.inputInformationFile(information,file);
		
		return "redirect:/admin/project/view?pNo="+information.getpNo();
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyForm(Project project, Model model ) {
		logger.info("/admin/information/modify [GET]");
		
		String name = informationService.selectByName(project);
		Information information = informationService.viewInformation(project);
		
		
		model.addAttribute("information", information);
		model.addAttribute("name", name);
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(Information information, MultipartFile file, String storedName,  @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate){
		logger.info("/admin/information/modify [POST]");
		logger.info("information {}", information);
		logger.info("file {}", file);
		
		information = informationService.getInformation(information);
		information.setiEndDate(endDate); //날짜 삽입
		logger.info("result {}", information);
		
		logger.info("storedName {}", storedName);
		informationService.removeFile(storedName); //파일 정보 및 파일 삭제
		informationService.modifyInformationFile(information,file); // 파일 정보 및 파일 수정
		
		return "redirect:/admin/project/view?pNo="+information.getpNo();
	}
	
}
