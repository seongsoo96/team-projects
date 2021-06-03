package ppeonfun.controller.user.supporter;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ppeonfun.dto.Information;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;
import ppeonfun.service.user.supporter.SupporterService;

@Controller("user.SupporterController")
public class SupporterController {
	
	private static final Logger logger = LoggerFactory.getLogger(SupporterController.class);
	
	@Autowired
	private SupporterService supporterService;
	
	
	@RequestMapping(value = "/supporter")
	public String supporter(
			Information info, Supporter supporter, SupporterJoin suJoin, Model model) {
		
		//해당 프로젝트의 제목, 카테고리
		info = supporterService.projectInfo(info);
		
		//해당 프로젝트의 총 서포터 수 구하기
		int totalCount = supporterService.totalCount(supporter);
//		logger.info("총 서포터 수 {}명", totalCount);
		
		//해당 프로젝트 서포터 리스트
		List<SupporterJoin> list = supporterService.supporterList(suJoin);
//		logger.info("서포터 리스트 {}", list);
		
		//프로젝트 남은 일수 구하기
		int remaining_day = supporterService.remainDay(suJoin);
//		logger.info("남은 날짜 {}", remaining_day);
		
//		int achievement_rate = supporterService.achievementRate
		
		//프로젝트의 총 펀딩 액
		int total_amount = supporterService.amount(suJoin);
//		logger.info("총 펀딩 액 {}", total_amount);
		
		model.addAttribute("totalCnt", totalCount);
		model.addAttribute("list", list);
		model.addAttribute("remainDay", remaining_day);
		model.addAttribute("totalAmount", total_amount);
		model.addAttribute("info", info);
		
		return "/user/project/supporter";
		
	}

}
