package ppeonfun.controller.user.story;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ppeonfun.dto.Favorite;
import ppeonfun.dto.Information;
import ppeonfun.dto.News;
import ppeonfun.dto.Project;
import ppeonfun.dto.Report;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;
import ppeonfun.service.user.story.StoryService;

@Controller("user.StoryController")
public class StoryController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoryController.class);

	@Autowired StoryService storyService;
	
	@RequestMapping(value = "/story")
	public String story(
			Model model, Information info, Supporter supporter, SupporterJoin suJoin, 
			News news, HttpSession session) {
		
		//해당 프로젝트의 제목, 카테고리, 목표금액
		info = storyService.projectInfo(info);
		
		//해당 프로젝트의 총 서포터 수 구하기
		int totalCount = storyService.totalCount(supporter);
		
		//프로젝트 남은 일수 구하기
		int remaining_day = storyService.remainDay(suJoin);
		
		//프로젝트의 총 펀딩 액
		int total_amount = storyService.amount(suJoin);
		
		//새소식 개수
		int newsCount = storyService.newsCount(news);
		
		//커뮤니티 질문 개수
		int communityCnt = storyService.communityCnt(news);
		
		//찜 상태 조회
		Favorite favorite = new Favorite();
		favorite.setpNo(news.getpNo()); //프로젝트 번호
		
		//로그인 되어있을 경우
		if(session.getAttribute("mNo") != null) {
		
			favorite.setmNo(((Integer)session.getAttribute("mNo")).intValue()); //회원번호
			
			//회원의 찜 상태 확인
			boolean isFav = storyService.isFav(favorite); 
//					logger.info("찜 상태 확인 {}", isFav);
			
			model.addAttribute("isFav", isFav); //회원의 찜 상태 전달
			
		} else {  //로그인 안되어있을 경우
			model.addAttribute("isFav", false); //회원의 찜 상태 전달
		}
		
		//찜 상태 확인
		boolean isFav = storyService.isFav(favorite); 
		logger.info("찜 상태 확인 {}", isFav);
		
		model.addAttribute("info", info);
		model.addAttribute("totalCnt", totalCount);
		model.addAttribute("remainDay", remaining_day);
		model.addAttribute("totalAmount", total_amount);
		model.addAttribute("newsCnt", newsCount);
		model.addAttribute("communityCnt", communityCnt);
		
		model.addAttribute("cntFav", storyService.getTotalCntFavorite(favorite)); //총 좋아요 횟수
		
		//로그인 여부 전달
		if(session.getAttribute("mNo") == null) {
			model.addAttribute("nullmNo", "null");
		} else {
			model.addAttribute("nullmNo", "yes");
		}
		
		return "/user/project/story";
	}
	
	@RequestMapping(value = "/story/favorite")
	public ModelAndView favorite(Favorite favorite, ModelAndView mav, HttpSession session) {
		logger.info(null);
		
		//찜(하트)
		favorite.setmNo(((Integer)session.getAttribute("mNo")).intValue());
		boolean result = storyService.favorite(favorite);
		
		//좋아요 수 조회
		int cnt = storyService.getTotalCntFavorite(favorite);
		
		mav.addObject("result", result);
		mav.addObject("cnt", cnt);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	
	//신고하기
	@RequestMapping(value = "/project/report", method = RequestMethod.POST)
	public String report(Report report, Project project, HttpSession session) {
		
		int pno = report.getpNo();
		
		//신고자 회원번호
		report.setmReporterNo(((Integer)session.getAttribute("mNo")).intValue()); //회원번호
		
		//개설자 회원번호 가져오기
		project = storyService.getFounderNo(project);
		report.setmFounderNo(project.getmNo());
		
		//신고 테이블에 삽입
		storyService.report(report);
		
		logger.info("신고하기 내역 확인용 {}", report);
	
		return "redirect:/story?pNo=" + pno;
	}
	
}
