package ppeonfun.controller.user.payment;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ppeonfun.dto.Member;
import ppeonfun.dto.Payment;
import ppeonfun.dto.Project;
import ppeonfun.service.user.payment.PaymentService;

@Controller("user.PaymentController")
@RequestMapping("/user/payment")
public class PaymentController {
	private Logger logger = LoggerFactory.getLogger(PaymentController.class);
	@Autowired private PaymentService paymentService;
	
	@RequestMapping(value="/form")
	public void paymentForm(String[] count, String [] reward, String suAddMoney, Project project, Model model, HttpSession session) {
		logger.info("/user/payment/form");
		logger.info("count {}", count.length);
		logger.info("reward {}", reward.length);
		project = paymentService.viewProject(project);
		Member member = paymentService.viewMember((int)session.getAttribute("mNo"));
		int addMoney=0;
		
		for(int i=0; i<reward.length; i++) {
			logger.info("reward value: {}", reward[i]);
		}
		
		for(int i=0; i<count.length; i++) {
			logger.info("count value: {}", count[i]);
		}
		
		HashMap<String, Integer> rewardCount = paymentService.getRewardCount(reward, count);
		int amount = paymentService.getAmount(rewardCount);
		if(suAddMoney !=null && !"".equals(suAddMoney)) {
			amount+= Integer.parseInt(suAddMoney);
			addMoney=Integer.parseInt(suAddMoney);
		}
		
		model.addAttribute("member", member);
		model.addAttribute("project", project);
		model.addAttribute("suAddMoney", suAddMoney);
		model.addAttribute("rewardCount", rewardCount);
		model.addAttribute("amount", amount);
		
	}
	
	@RequestMapping(value="/complete")
	public String complete(Payment payment, String[] count, String [] reward, String suAddMoney, Project project, Model model, HttpSession session) {
		logger.info("/user/payment/complete");
		HashMap<String, Integer> rewardCount = paymentService.getRewardCount(reward, count);
		for(int i=0; i<reward.length; i++) {
			logger.info("reward value: {}", reward[i]);
		}
		
		for(int i=0; i<count.length; i++) {
			logger.info("count value: {}", count[i]);
		}
		
		logger.info("payment {}", payment);
		logger.info("suAddMoney {}", suAddMoney);
		logger.info("project {}", project);
		
		paymentService.inputSupporter(rewardCount, suAddMoney,  payment, (int)session.getAttribute("mNo"));
		paymentService.inputPayment(rewardCount, suAddMoney,  payment, (int)session.getAttribute("mNo"));
		
		return null;
	}
	
	
		
}
