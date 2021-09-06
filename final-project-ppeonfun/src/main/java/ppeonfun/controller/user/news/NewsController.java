package ppeonfun.controller.user.news;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ppeonfun.dto.Favorite;
import ppeonfun.dto.Information;
import ppeonfun.dto.News;
import ppeonfun.dto.NewsSort;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;
import ppeonfun.service.user.news.NewsService;
import ppeonfun.util.ProjectPaging;

@Controller("user.NewsController")
public class NewsController {
	
	private static final Logger logger = LoggerFactory.getLogger(NewsController.class);
	
	@Autowired NewsService newsService;
	
	
	@RequestMapping(value = "/news")
	public String news(
			Model model, Information info, Supporter supporter, SupporterJoin suJoin,
			News news, HttpSession session,
			@RequestParam(value = "curPage", defaultValue = "0") int curPage,
			NewsSort newsSort) {
		
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
		
		//커뮤니티 질문 개수
		int communityCnt = newsService.communityCnt(news);
		
		//찜 상태 조회
		Favorite favorite = new Favorite();
		favorite.setpNo(news.getpNo()); //프로젝트 번호

		//로그인 되어있을 경우
		if(session.getAttribute("mNo") != null) {
		
			favorite.setmNo(((Integer)session.getAttribute("mNo")).intValue()); //회원번호
			
			//회원의 찜 상태 확인
			boolean isFav = newsService.isFav(favorite); 
//					logger.info("찜 상태 확인 {}", isFav);
			
			model.addAttribute("isFav", isFav); //회원의 찜 상태 전달
			
		} else {  //로그인 안되어있을 경우
			model.addAttribute("isFav", false); //회원의 찜 상태 전달
		}		
		
		//찜 상태 확인
		boolean isFav = newsService.isFav(favorite); 
		logger.info("찜 상태 확인 {}", isFav);
		
		model.addAttribute("info", info);
		model.addAttribute("totalCnt", totalCount);
		model.addAttribute("remainDay", remaining_day);
		model.addAttribute("totalAmount", total_amount);
		model.addAttribute("newsCnt", newsCount);
		model.addAttribute("communityCnt", communityCnt);
		
		model.addAttribute("cntFav", newsService.getTotalCntFavorite(favorite)); //총 좋아요 횟수
		
		//------------------------------------------------------
		
		//새소식 리스트
//		List<News> newsList = newsService.getList(news);
		
		//분류 포함 새소식 리스트
		List<NewsSort> newsList = newsService.getList(newsSort);
		
		//새소식 모델값 전달
		model.addAttribute("newsList", newsList);
		
		//로그인 여부 전달
		if(session.getAttribute("mNo") == null) {
			model.addAttribute("nullmNo", "null");
		} else {
			model.addAttribute("nullmNo", "yes");
		}
		
		
		//페이징 계산
//		ProjectPaging inDate = new ProjectPaging();
//		inDate.setCurPage(curPage);
//		inDate.setpNo(news.getpNo());
//		logger.info("페이징 데이터 확인 {}", inDate);
//		
//		ProjectPaging paging = newsService.getPaging(inDate);
//		paging.setpNo(news.getpNo());
//		logger.info("더보기를 위한 paging값 확인 {}", paging);
//		model.addAttribute("paging", paging);
		
		return "/user/project/news";
	}
	
	
	@RequestMapping(value = "/news/view")
	public String newsview(
			Model model, Information info, Supporter supporter, SupporterJoin suJoin,
			News news, HttpSession session) {
		
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
		
		//커뮤니티 질문 개수
		int communityCnt = newsService.communityCnt(news);
		
		//찜 상태 조회
		Favorite favorite = new Favorite();
		favorite.setpNo(news.getpNo()); //프로젝트 번호
		
		//로그인 되어있을 경우
		if(session.getAttribute("mNo") != null) {
		
			favorite.setmNo(((Integer)session.getAttribute("mNo")).intValue()); //회원번호
			
			//회원의 찜 상태 확인
			boolean isFav = newsService.isFav(favorite); 
//					logger.info("찜 상태 확인 {}", isFav);
			
			model.addAttribute("isFav", isFav); //회원의 찜 상태 전달
			
		} else {  //로그인 안되어있을 경우
			model.addAttribute("isFav", false); //회원의 찜 상태 전달
		}	
		
		//찜 상태 확인
		boolean isFav = newsService.isFav(favorite); 
		logger.info("찜 상태 확인 {}", isFav);
		
		model.addAttribute("info", info);
		model.addAttribute("totalCnt", totalCount);
		model.addAttribute("remainDay", remaining_day);
		model.addAttribute("totalAmount", total_amount);
		model.addAttribute("newsCnt", newsCount);
		model.addAttribute("communityCnt", communityCnt);
		
		model.addAttribute("cntFav", newsService.getTotalCntFavorite(favorite)); //총 좋아요 횟수
		
		//------------------------------------------------------
		
		//view 정보
		news = newsService.view(news);
		
		model.addAttribute("view", news);
		
		return "/user/project/newsView";
	}
	
	
	@RequestMapping(value = "/news/favorite")
	public ModelAndView favorite(Favorite favorite, ModelAndView mav, HttpSession session) {
		
		//찜(하트)
		favorite.setmNo(((Integer)session.getAttribute("mNo")).intValue());
		boolean result = newsService.favorite(favorite);
		
		//좋아요 수 조회
		int cnt = newsService.getTotalCntFavorite(favorite);
		
		mav.addObject("result", result);
		mav.addObject("cnt", cnt);
		mav.setViewName("jsonView");
		
		return mav;
	}

}
