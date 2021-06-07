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
			boolean isProject = rewardService.rewardState(project);
			if(isProject) {
				return "redirect:/admin/reward/modify?pNo="+project.getpNo();
			}else {
				return "redirect:/admin/reward/write?pNo="+project.getpNo();
			}	
		}
		String name = rewardService.selectByName(project);
		List<Reward> rewardList = rewardService.viewRewardList(project);

		model.addAttribute("reward", rewardList);
		model.addAttribute("name", name);
		
		return null;
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void writeForm(Project project, Model model) {
		logger.info("/admin/reward/write [GET]");
		String name = rewardService.selectByName(project);
		
		model.addAttribute("project", project);
		model.addAttribute("name", name);
		
	}
//	@RequestMapping(value="/write", method=RequestMethod.POST)
//	public String write(Reward reward, MultipartFile file) {
//		logger.info("/admin/reward/write [POST]");
//		logger.info("reward {}", reward);
//		logger.info("file {}", file);
//		
//		rewardService.inputRewardFile(reward,file);
//		
//		return "redirect:/admin/project/view?pNo="+reward.getpNo();
//	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyForm(Project project, Model model ) {
		logger.info("/admin/reward/modify [GET]");
		
		String name = rewardService.selectByName(project);
		List<Reward> rewardList = rewardService.viewRewardList(project);
		
		
		model.addAttribute("rewardList", rewardList);
		model.addAttribute("name", name);
	}
	
//	@RequestMapping(value="/modify", method=RequestMethod.POST)
//	public String modify(Reward reward, MultipartFile file, String storedName){
//		logger.info("/admin/reward/modify [POST]");
//		logger.info("reward {}", reward);
//		logger.info("file {}", file);
//		
//		reward = rewardService.getReward(reward);
//		logger.info("result {}", reward);
//		
//		logger.info("storedName {}", storedName);
//		rewardService.removeFile(storedName, reward); //파일 정보 및 파일 삭제
//		rewardService.modifyRewardFile(reward,file); // 파일 정보 및 파일 수정
//		
//		return "redirect:/admin/project/view?pNo="+reward.getpNo();
//	}
	
}
