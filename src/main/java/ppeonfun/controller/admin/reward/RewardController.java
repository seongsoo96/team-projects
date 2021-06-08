package ppeonfun.controller.admin.reward;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ppeonfun.dto.Project;
import ppeonfun.dto.Reward;
import ppeonfun.service.admin.reward.RewardService;


@Controller("admin.RewardController")
@RequestMapping("/admin/reward")
public class RewardController {
	private static final Logger logger = LoggerFactory.getLogger(RewardController.class);
	
	@Autowired private RewardService rewardService;
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String view(Project project, Model model) {
		logger.info("/admin/reward/view");
		project = rewardService.projectState(project);
		
		if(project!=null && "N".equals(project.getpState())) {//프로젝트가 승인이 안 되었을때
			
		}else if(project!=null && "W".equals(project.getpState())) { //프로젝트가 승인 대기중일때
			return "redirect:/admin/reward/write?pNo="+project.getpNo();	
		}
		String name = rewardService.selectByName(project);
		List<Reward> rewardList = rewardService.viewRewardList(project);

		model.addAttribute("rewardList", rewardList);
		model.addAttribute("name", name);
		
		return null;
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void writeForm(Project project, Model model) {
		logger.info("/admin/reward/write [GET]");
		String name = rewardService.selectByName(project);
		
		List<Reward> rewardList = rewardService.viewRewardList(project);
		model.addAttribute("rewardList", rewardList);
		model.addAttribute("project", project);
		model.addAttribute("name", name);
		
	}
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(Reward reward) {
		logger.info("/admin/reward/write [POST]");
		logger.info("reward {}", reward);
		
		rewardService.updateRewardState(reward);
		
		return "redirect:/admin/project/view?pNo="+reward.getpNo();
	}
	
	@RequestMapping(value="/ajax/write", method=RequestMethod.POST)
	public String ajaxWrite(Reward reward, Model model) {
		logger.info("/admin/reward/write [POST]");
		logger.info("reward {}", reward);
		reward.setReState("Y");
		if(reward.getReOptionContext()==null || "".equals(reward.getReOptionContext())) {
			reward.setReOptionContext("없음");
		}
		
		logger.info("reward result{}", reward);
		
		rewardService.inputReward(reward);
		Project project = rewardService.getProject(reward);
		List<Reward> rewardList = rewardService.viewRewardList(project);
		
		model.addAttribute("rewardList", rewardList);
		
		return "/admin/reward/ajaxInput";
	}
	
	@RequestMapping(value="/ajax/delete", method=RequestMethod.POST)
	public String ajaxDelete(Reward reward, Model model) {
		logger.info("/admin/reward/write [POST]");
		logger.info("reward {}", reward);
		reward.setReState("Y");
		if(reward.getReOptionContext()==null || "".equals(reward.getReOptionContext())) {
			reward.setReOptionContext("없음");
		}
		
		logger.info("reward result{}", reward);
		
		rewardService.removeReward(reward);
		Project project = rewardService.getProject(reward);
		List<Reward> rewardList = rewardService.viewRewardList(project);
		
		model.addAttribute("rewardList", rewardList);
		
		return "/admin/reward/ajaxInput";
	}
	
	
	

	
}
