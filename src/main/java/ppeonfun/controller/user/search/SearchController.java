package ppeonfun.controller.user.search;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ppeonfun.dto.SearchFilter;
import ppeonfun.service.user.search.SearchService;
import ppeonfun.util.SearchPaging;


@Controller("user.SearchController")
@RequestMapping("/search")
public class SearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	@Autowired private SearchService searchService;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String list(String keyword, Model model, SearchPaging inData ) {
		logger.info("/search/ [GET]");
		
		
		logger.info("keyword : " + keyword);
		logger.info("inData : " + inData);
		
		SearchPaging paging = null;
		List<HashMap<String, Object>> list = null;
		
		if(keyword == null || ("").equals(keyword)) {
			return "redirect:/";
		}
		
		paging = searchService.getPaging(inData, keyword);
		logger.info("paging : " + paging);
		
		list = searchService.list(paging, keyword);
		
		logger.info("list : " + list);
		for( HashMap<String, Object> i : list) {
			logger.info("list에 담긴 객체 확인 : {}", i);
		}
				
		//모델값 전달
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchList", list);
		model.addAttribute("paging", paging);
		
		return "/user/search";
	}
	
	@RequestMapping(value="/more", method=RequestMethod.GET)
	public String listMore(SearchFilter sf, Model model, SearchPaging inData) {
		logger.info("/search/more");
		
		logger.info("SearchFilter : " + sf);
		logger.info("curPage : " + inData);
		
		for(int i=0; i<sf.getStep().size(); i++) {
			logger.info("step (" + i + ") : " + sf.getStep().get(i));
		}
		
		
		SearchPaging paging = null;
		List<HashMap<String, Object>> list = null;
		
		if(sf.getKeyword() == null || ("").equals(sf.getKeyword())) {
			return "redirect:/";
		}
		
		
		
		paging = searchService.getPaging(inData, sf);
		logger.info("필터가 적용된 페이징 객체 : " + paging);
		
		list = searchService.list(paging, sf);
		
		logger.info("list : " + list);
		for( HashMap<String, Object> i : list) {
			logger.info("list에 담긴 객체 확인 : {}", i);
		}
		
		
		//모델값 전달
//		model.addAttribute("keyword", keyword);
		model.addAttribute("searchList", list);
		model.addAttribute("paging", paging);
		
		return "user/searchMore";
	}
	
}
