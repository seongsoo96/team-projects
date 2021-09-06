package ppeonfun.controller.user.reward;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ppeonfun.dto.Project;
import ppeonfun.dto.Reward;
import ppeonfun.service.user.reward.RewardService;

@Controller("user.RewardController")
@RequestMapping("/user/reward")
public class RewardController {
	private Logger logger = LoggerFactory.getLogger(RewardController.class);
	@Autowired private RewardService rewardService;
	
	@RequestMapping(value="/view")
	public void rewardForm(Project project, Model model) {
		logger.info("/user/reward/form");
		List<Reward> list = rewardService.viewReward(project);
		for(int i=0; i<list.size(); i++) {
			logger.info("value {}", list.get(i));
		}
		
		model.addAttribute("list", list);
		model.addAttribute("project", project);
	}
	
}
