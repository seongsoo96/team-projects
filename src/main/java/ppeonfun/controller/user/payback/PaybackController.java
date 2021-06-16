package ppeonfun.controller.user.payback;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ppeonfun.dto.PaymentReward;
import ppeonfun.dto.Project;
import ppeonfun.service.user.payback.PaybackService;

@Controller("user.PaybackController")
@RequestMapping("/user/payback")
public class PaybackController {
	private Logger logger = LoggerFactory.getLogger(PaybackController.class);
	@Autowired private PaybackService paybackService;
	
	@RequestMapping(value="/view")
	public void list(Project project, Model model, HttpSession session) {
		logger.info("/user/payback/list");
		int mNo = (int)session.getAttribute("mNo");
		
		List<PaymentReward> paymList = paybackService.listPayment(project, mNo);
		for(int i=0; i<paymList.size(); i++) {
			logger.info("value {}", paymList.get(i));
		}
		List<List<PaymentReward>> groupList = paybackService.groupListPayment(paymList);
		
		model.addAttribute("groupList",groupList);
		model.addAttribute("project", project);
	}
	
	@RequestMapping(value="/proc")
	public void proc(Project project, Model model, HttpSession session, String[] suGroup) {
		logger.info("/user/payback/proc");
		logger.info("project {}", project);
		for(int i=0; i<suGroup.length; i++) {
			logger.info("suGroup {}", suGroup[i]);
		}
		String token = paybackService.getToken();
		int mNo = (int)session.getAttribute("mNo");
		
		paybackService.paybackProc(token,suGroup,mNo);
		paybackService.removeSupporter(suGroup);
		
	}
	
}
