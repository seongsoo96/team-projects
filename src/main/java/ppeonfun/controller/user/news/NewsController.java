package ppeonfun.controller.user.news;

import java.util.List;

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
import ppeonfun.service.user.news.NewsService;

@Controller("user.NewsController")
public class NewsController {
	
	private static final Logger logger = LoggerFactory.getLogger(NewsController.class);
	
	@Autowired NewsService newsService;
	
	
	@RequestMapping(value = "/news")
	public String news(
			Model model, Information info, Supporter supporter, SupporterJoin suJoin,
			News news) {
		
		//해당 프로젝트의 제목, 카테고리, 목표금액
		info = newsService.projectInfo(info);
		
		//해당 프로젝트의 총 서포터 수 구하기
		int totalCount = newsService.totalCount(supporter);
		
		//프로젝트 남은 일수 구하기
		int remaining_day = newsService.remainDay(suJoin);
		
		//프로젝트의 총 펀딩 액
		int total_amount = newsService.amount(suJoin);
		
		//새소식 개수
		int newsCount = newsService.newsCount(news);
		
		model.addAttribute("info", info);
		model.addAttribute("totalCnt", totalCount);
		model.addAttribute("remainDay", remaining_day);
		model.addAttribute("totalAmount", total_amount);
		model.addAttribute("newsCnt", newsCount);
		
		//------------------------------------------------------
		
		//새소식 리스트
		List<News> newsList = newsService.getList(news);
		
		model.addAttribute("newsList", newsList);
		
		return "/user/project/news";
	}
	
	
	@RequestMapping(value = "/news/view")
	public String newsview(
			Model model, Information info, Supporter supporter, SupporterJoin suJoin,
			News news) {
		
		//해당 프로젝트의 제목, 카테고리, 목표금액
		info = newsService.projectInfo(info);
		
		//해당 프로젝트의 총 서포터 수 구하기
		int totalCount = newsService.totalCount(supporter);
		
		//프로젝트 남은 일수 구하기
		int remaining_day = newsService.remainDay(suJoin);
		
		//프로젝트의 총 펀딩 액
		int total_amount = newsService.amount(suJoin);
		
		//새소식 개수
		int newsCount = newsService.newsCount(news);
		
		model.addAttribute("info", info);
		model.addAttribute("totalCnt", totalCount);
		model.addAttribute("remainDay", remaining_day);
		model.addAttribute("totalAmount", total_amount);
		model.addAttribute("newsCnt", newsCount);
		
		//------------------------------------------------------
		
		//view 정보
		news = newsService.view(news);
		
		model.addAttribute("view", news);
		
		return "/user/project/newsView";
	}

}
