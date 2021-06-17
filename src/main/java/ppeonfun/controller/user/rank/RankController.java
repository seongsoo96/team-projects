package ppeonfun.controller.user.rank;

import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ppeonfun.dto.Rank;
import ppeonfun.service.user.rank.RankService;

@Controller("user.RankController")
@RequestMapping(value="/user/rank")
public class RankController {
	private Logger logger = LoggerFactory.getLogger(RankController.class);
	@Autowired RankService rankService;
	
	@RequestMapping(value="/realtime")
	public String realtime(Model model) {
		List<Rank> list = rankService.getRank();
		for(int i=0; i<list.size(); i++) {
			logger.info("value {}", list.get(i));
			list.get(i).setScore(50); //50점 점수 부여
		}
		list = rankService.getFavoirteScore(list);
		list = rankService.getSupporter(list);
		Collections.sort(list);
		
		for(int i=list.size()-1; 4<i; i--) { //5위까지 삭제
			list.remove(i);
		}
		for(int i=0; i<list.size(); i++) {
			logger.info("result {}", list.get(i));
		}
		
		model.addAttribute("list", list);
		return "jsonView";
	}
	
}
