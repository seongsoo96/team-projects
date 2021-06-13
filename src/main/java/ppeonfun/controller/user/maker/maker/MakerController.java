package ppeonfun.controller.user.maker.maker;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dto.Maker;
import ppeonfun.dto.Project;
import ppeonfun.service.user.maker.maker.MakerService;

@Controller("user.maker.MakerController")
@RequestMapping("/user/maker/maker")
public class MakerController {

	private static final Logger logger = LoggerFactory.getLogger(MakerController.class);
	
	@Autowired private MakerService makerService;
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String view(Project project, Model model) {
		logger.info("/user/maker/maker/view");
		project = makerService.projectState(project);
		
		if(project!=null && "N".equals(project.getpState())) {//프로젝트가 승인이 안 되었을때
			
		}else if(project!=null && "W".equals(project.getpState())) { //프로젝트가 승인 대기중일때
			boolean isProject = makerService.makerState(project);
			if(isProject) {
				return "redirect:/user/maker/maker/modify?pNo="+project.getpNo();
			}else {
				return "redirect:/user/maker/maker/write?pNo="+project.getpNo();
			}	
		}
		String name = makerService.selectByName(project);
		Maker maker = makerService.viewMaker(project);
		
		model.addAttribute("maker", maker);
		model.addAttribute("name", name);
		model.addAttribute("project", project);
		return null;
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void writeForm(Project project, Model model) {
		logger.info("/user/maker/maker/write [GET]");
		String name = makerService.selectByName(project);
		
		model.addAttribute("project", project);
		model.addAttribute("name", name);
		
	}
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(Maker maker, MultipartFile file) {
		logger.info("/user/maker/maker/write [POST]");
		logger.info("maker {}", maker);
		logger.info("file {}", file);
		
		makerService.inputMaker(maker,file);
		return "redirect:/user/maker/project/view?pNo="+maker.getpNo();
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyForm(Project project, Model model ) {
		logger.info("/user/maker/maker/modify [GET]");
		
		String name = makerService.selectByName(project);
		Maker maker = makerService.viewMaker(project);
		
		model.addAttribute("maker", maker);
		model.addAttribute("name", name);
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(Maker maker, MultipartFile file, String storedName){
		logger.info("/user/maker/maker/modify [POST]");
		logger.info("maker {}", maker);
		logger.info("file {}", file);
		
		maker = makerService.getMaker(maker);
		logger.info("result {}", maker);
		
		logger.info("storedName {}", storedName);
		makerService.removeFile(storedName); //파일 정보 및 파일 삭제
		makerService.modifyMakerFile(maker,file); // 파일 정보 및 파일 수정
		
		return "redirect:/user/maker/project/view?pNo="+maker.getpNo();
	}
}
