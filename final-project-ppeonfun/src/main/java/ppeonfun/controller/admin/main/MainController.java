package ppeonfun.controller.admin.main;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ppeonfun.service.admin.main.MainService;
import ppeonfun.util.Paging;

@Controller("admin.MainController")
@RequestMapping(value="/admin")
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired private MainService mainService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home(Paging inData) {
		logger.info("관리자 main실행");
		if(inData.getCategory()==null || "".equals(inData.getCategory())) {
			logger.info("category 값 없음");
			inData.setCategory("payment");
		}
		logger.info("카테고리 {}",inData.getCategory());
		
		if("payment".equals(inData.getCategory())) {
			return "redirect:/admin/main/payment?category="+inData.getCategory();
		}else if("payback".equals(inData.getCategory())) {
			return "redirect:/admin/main/payback?category="+inData.getCategory();
		}else if("favorite".equals(inData.getCategory())) {
			return "redirect:/admin/main/favorite?category="+inData.getCategory();
		}else if("alarm".equals(inData.getCategory())) {
			return "redirect:/admin/main/alarm?category="+inData.getCategory();
		}

		return null;
	}
	
	@RequestMapping(value = "/main/payment")
	public String adminPayment(Paging inData, Model model) {
		logger.info("관리자 payment실행");
		logger.info("카테고리 {}",inData.getCategory());
		inData = mainService.getPaymentPaging(inData);
		List<HashMap<String, Object>> map = mainService.getPaymentStat();
		
		logger.info("통계 데이터 {}",map);
		logger.info("페이징 데이터 {}", inData);
		model.addAttribute("list",mainService.paymentList(inData));
		model.addAttribute("map",map);
		model.addAttribute("category","payment");
		model.addAttribute("paging", inData);
		return "/admin/main";
	}
	@RequestMapping(value = "/main/payback")
	public String adminPayback(Paging inData, Model model) {
		logger.info("관리자 payback실행");
		logger.info("카테고리 {}",inData.getCategory());
		inData = mainService.getPaybackPaging(inData);
		List<HashMap<String, Object>> map = mainService.getPaybackStat();
		logger.info("통계 데이터 {}",map);
		model.addAttribute("map",map);
		model.addAttribute("list",mainService.paybackList(inData));
		model.addAttribute("category","payback");
		model.addAttribute("paging", inData);
		return "/admin/main";
	}
	@RequestMapping(value = "/main/favorite")
	public String adminFavoirte(Paging inData, Model model) {
		logger.info("관리자 favoirte실행");
		logger.info("카테고리 {}",inData.getCategory());
		inData = mainService.getFavoritePaging(inData);
		List<HashMap<String, Object>> map = mainService.getFavoriteStat();
		logger.info("통계 데이터 {}",map);
		
		
		model.addAttribute("list",mainService.favoriteList(inData));
		model.addAttribute("map",map);
		model.addAttribute("category","favorite");
		model.addAttribute("paging", inData);
		return "/admin/main";
	}
	@RequestMapping(value = "/main/alarm")
	public String adminAlarm(Paging inData, Model model) {
		logger.info("관리자 Alarm실행");
		logger.info("카테고리 {}",inData.getCategory());
		inData = mainService.getAlarmPaging(inData);
		List<HashMap<String, Object>> map = mainService.getAlarmStat();
		logger.info("통계 데이터 {}",map);
		model.addAttribute("list",mainService.alarmList(inData));
		model.addAttribute("map",map);
		model.addAttribute("category","alarm");
		model.addAttribute("paging", inData);
		return "/admin/main";
	}
	
	
	
	@RequestMapping(value = "/fail", method = RequestMethod.GET)
	public String adminFail() {
		logger.info("관리자 fail실행");
		
		return "redirect:/";
	}
}
