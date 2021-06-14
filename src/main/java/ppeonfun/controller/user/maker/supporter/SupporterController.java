package ppeonfun.controller.user.maker.supporter;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ppeonfun.dto.Payback;
import ppeonfun.dto.Project;
import ppeonfun.dto.Supporter;
import ppeonfun.service.user.maker.supporter.SupporterService;
import ppeonfun.util.Paging;

@Controller("user.maker.SupporterController")
@RequestMapping("/user/maker/supporter")
public class SupporterController {
	private static final Logger logger = LoggerFactory.getLogger(SupporterController.class);
	@Autowired private SupporterService supporterService;
	
	@RequestMapping(value="list")
	public void list(Paging inData, Project project, Model model) {
		logger.info("/user/maker/list/supporter 실행");
		Paging paging = supporterService.getPaging(inData,project);
		List<HashMap<String, Object>> list = supporterService.selectAllSupportor(paging,project);
		
		for(int i=0; i<list.size(); i++) {
			for(String e : list.get(i).keySet()) {
				logger.info("key: {} value: {}", e, list.get(i).get(e));
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	@RequestMapping(value="view")
	public void view(Supporter supporter, Model model) {
		logger.info("/user/maker/view/supporter 실행");
		
		HashMap<String, Object> view = supporterService.viewSupporter(supporter);
		logger.info("supporter {}", view);
		
		int pNo = Integer.valueOf(String.valueOf(view.get("P_NO")));
		
		String name = supporterService.viewByName(pNo);
		Project project = supporterService.viewProject(pNo);
		
		logger.info("name {}", name);
		logger.info("project {}", project);
		
		
		model.addAttribute("supporter", view);
		model.addAttribute("project", project);
		model.addAttribute("name", name);
	}
	
	@RequestMapping(value="remove")
	public String remove(Supporter suppoerter, Model model) {
		logger.info("/user/maker/remove/supporter 실행");
		logger.info("supporter {}", suppoerter);
		suppoerter = supporterService.viewSupporterDto(suppoerter);
		
		//서포터 삭제 
		supporterService.removeSupporter(suppoerter);
		//환불 테이블 저장
		Payback payback=supporterService.inputPayback(suppoerter);
		
		return "redirect:/user/maker/supporter/list?pNo="+suppoerter.getpNo();
	}
	
	
}
