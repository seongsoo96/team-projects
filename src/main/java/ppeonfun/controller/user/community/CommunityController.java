package ppeonfun.controller.user.community;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ppeonfun.dto.Information;
import ppeonfun.dto.News;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;
import ppeonfun.service.user.community.CommunityService;

@Controller("user.CommunityController")
public class CommunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	@Autowired CommunityService communityService;
	
	
	@RequestMapping(value = "/community")
	public String community(
			Model model, Information info, Supporter supporter, SupporterJoin suJoin, News news) {
		
		//해당 프로젝트의 제목, 카테고리, 목표금액
		info = communityService.projectInfo(info);
		
		//해당 프로젝트의 총 서포터 수 구하기
		int totalCount = communityService.totalCount(supporter);
		
		//프로젝트 남은 일수 구하기
		int remaining_day = communityService.remainDay(suJoin);
		
		//프로젝트의 총 펀딩 액
		int total_amount = communityService.amount(suJoin);
		
		//새소식 개수
		int newsCount = communityService.newsCount(news);
		
		model.addAttribute("info", info);
		model.addAttribute("totalCnt", totalCount);
		model.addAttribute("remainDay", remaining_day);
		model.addAttribute("totalAmount", total_amount);
		model.addAttribute("newsCnt", newsCount);
		
		return "/user/project/community";
	}

}
