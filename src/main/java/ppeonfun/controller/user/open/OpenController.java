package ppeonfun.controller.user.open;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ppeonfun.controller.user.project.ProjectController;
import ppeonfun.dto.Information;
import ppeonfun.dto.Project;
import ppeonfun.service.user.open.OpenService;
import ppeonfun.util.Paging;

@Controller("user.OpenController")
@RequestMapping("/user/open")
public class OpenController {
private Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired private OpenService openService;
	
	@RequestMapping(value="/list")
	public void list(Paging inData, Model model) {
		logger.info("/user/open/list 실행");
		logger.info("inData {}", inData);
		Paging paging = openService.getPaging(inData);
		List<Information> list = openService.selectAllProject(paging);

		model.addAttribute("category",inData.getCategory());
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	
	@RequestMapping(value="/view")
	public void view(Project project, Model model, HttpSession session) {
		logger.info("/user/open/view 실행");
		Information info=openService.viewInformation(project);
		boolean check =false;
		if(session.getAttribute("mNo")!=null && !"".equals(session.getAttribute("name"))){
			check = openService.checkAlarm(project,(int)session.getAttribute("mNo"));
		}

		model.addAttribute("info", info);
		model.addAttribute("check", check);
	}
	
	@RequestMapping(value="/alarm")
	public String alarm(Project project, Model model, HttpSession session) {
		logger.info("/user/open/alarm 실행");
	
		boolean check = openService.checkAlarm(project,(int)session.getAttribute("mNo"));
		int mNo = (int)session.getAttribute("mNo");
		if(check) { //알림 신청
			openService.inputArarm(project,mNo);
		}else {// 알림 취소
			openService.removeArarm(project,mNo);
		}
		
		return "redirect:/user/open/view?pNo="+project.getpNo();
	}
	
	
	
}
