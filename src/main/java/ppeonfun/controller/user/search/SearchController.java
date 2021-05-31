package ppeonfun.controller.user.search;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
}
