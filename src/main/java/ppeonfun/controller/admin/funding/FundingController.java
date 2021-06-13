package ppeonfun.controller.admin.funding;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ppeonfun.dto.Project;
import ppeonfun.service.admin.funding.FundingService;
import ppeonfun.service.admin.project.ProjectService;

@Controller("admin.FundingController")
@RequestMapping("/admin/funding")
public class FundingController {
	private static final Logger logger = LoggerFactory.getLogger(FundingController.class);
	@Autowired private FundingService fundingService;
	@Autowired private ProjectService projectService;
	
	@RequestMapping(value="/view")
	public void view(Model model, Project project) {
		int sum=0;
		//통계값 가져오기
		logger.info("/admin/funding/view 실행");
		List<HashMap<String, Object>> mapChart =  fundingService.viewState(project);
		//추가 후원 금액 불러오기
		String suAddMoney = fundingService.getSuAddMoney(project);
		
		if(suAddMoney!=null && !"".equals(suAddMoney)) {
			sum = Integer.parseInt(suAddMoney);
		}
		
		for(int i=0; i<mapChart.size(); i++) {
			for(String s: mapChart.get(i).keySet())
			logger.info("mapChart key: {} value: {}",s, mapChart.get(i).get(s));
		}
		String name=  projectService.selectByName(project);
		project = projectService.selectProject(project);
		
		model.addAttribute("name", name);
		model.addAttribute("project", project);
		model.addAttribute("mapChart", mapChart);
		model.addAttribute("suAddMoney",sum);
	}
	
	
}
