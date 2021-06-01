package ppeonfun.controller.user.member;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ppeonfun.dto.Member;
import ppeonfun.service.user.member.MemberService;

@Controller("user.MemberController")
@RequestMapping("/user/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired private MemberService memberService;
	
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public void loginForm() {
		logger.info("/login 실행");
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(Member member, HttpSession session) {
		logger.info("/login 실행");
		
		member = memberService.encryption(member);
		member=memberService.login(member);
		if(member!=null) {
			session.setAttribute("mNo", member.getmNo());
			session.setAttribute("mNick", member.getmNick());
		}
		
		if(member.getmGrade()!=null&&"M".equals(member.getmGrade())) {
			return "redirect:/admin/main";
		}
			
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		logger.info("/logout 실행");
		session.invalidate();
		
		return "redirect:/";
	}
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public void joinForm() {
		logger.info("/joinForm [GET] 실행");
		
		
	}
}
