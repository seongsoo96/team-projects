package ppeonfun.controller.admin.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.MainController")
@RequestMapping(value="/admin")
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void home() {
		logger.info("관리자 main실행");
	}
	
	@RequestMapping(value = "/fail", method = RequestMethod.GET)
	public String adminFail() {
		logger.info("관리자 fail실행");
		
		return "redirect:/";
	}
}
