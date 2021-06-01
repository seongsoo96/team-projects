package ppeonfun.controller.user.member;


import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value="/joinSelect", method=RequestMethod.GET)
	public void joinSelect() {
		logger.info("/joinSelect 실행");
	}
	
	@RequestMapping(value="/kakao/loginForm")
	public String kakaLogin(HttpSession session) {
		String url= "https://kauth.kakao.com/oauth/authorize?client_id=684fd291495baa02477d2ce31d0e378b&redirect_uri=http://localhost:8088/user/member/kakao/login&response_type=code";
		session.removeAttribute("join");
		
		return "redirect:"+url;
	}
	@RequestMapping(value="/idFind" , method=RequestMethod.GET)
	public void idFind() {
		logger.info("/idFind [GET]실행");
	}
	@RequestMapping(value="/idFind" , method=RequestMethod.POST)
	public String idFindSuccess(String mEmail, Model model) {
		logger.info("/idFind [POST]실행");
		logger.info("email {}", mEmail);
		String id = memberService.idFind(mEmail);
		
		model.addAttribute("id",id);
		return "/user/member/idFindSuccess";
	}
	
	@RequestMapping(value="/kakao/login")
	public String kakaoLogin(String code,HttpSession session) {
		logger.info("/kakao/login code: {}", code);
		boolean isJoin= false;
		
		String accessToken=memberService.kakaoGetAccessToken(code);
		logger.info("accessToken : {}", accessToken);
		HashMap<String, Object> userInfo = memberService.getUserInfo(accessToken);
	    for(String e : userInfo.keySet()) {
	    	logger.info("{} : {}",e, userInfo.get(e));
	    }
	    //값이 존재 했을때
	    if(userInfo!=null && !"".equals((String)userInfo.get("email"))) {
	    	isJoin = memberService.kakaoIdCheck((String)userInfo.get("email"));
	    }
	    //true 아이디 존재
	    if(isJoin) {
	    	int mNo = memberService.kakaoMno((String)userInfo.get("email"));
	    	session.setAttribute("mNo", mNo);
	    	session.setAttribute("accessToken", accessToken);
	    }else { // 아이디가 존재 하지 않음 자동 회원가입
	    	Member member=memberService.joinKakao(userInfo);
	    	if(member.getmNo() > 0) {
				session.setAttribute("mNo", member.getmNo());
				session.setAttribute("accessToken", accessToken);
			}
	    }
	    
	    return "redirect:/";
		
	}
	@RequestMapping(value="/kakao/logout")
	public String kakaoLogout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		memberService.kakaoLogout((String)session.getAttribute("accessToken"));
		session.invalidate();
//		Cookie[] cookies = request.getCookies();
//		for(int i=0; i<cookies.length; i++) {
//			logger.info("이름:{}, 값:{}", cookies[i].getName(), cookies[i].getValue());
//		}
		
		return "redirect:/";
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
		
		if(member!=null&&"M".equals(member.getmGrade())) {
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
	
	@RequestMapping(value="/join")
	public String join(Member member, @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date birth, HttpSession session) {
		logger.info("birth {}", birth);
		logger.info("member {}", member);
		member.setmBirth(birth); //생년월일 삽입
		member = memberService.encryption(member); //비밀번호 암호화
		
		Member result = memberService.join(member);
		logger.info("result: {}", result);
		
		if(result.getmNo() > 0) {
			session.setAttribute("mNo", result.getmNo());
			session.setAttribute("mNick", result.getmNick());
		}
		
		
		return "redirect:/";
	}
	
	
	
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public String idCheck(Member member, Model model) {
		logger.info("/idCheck [POST]");
		logger.info("Member {}", member);
		boolean isId=memberService.idCheck(member);
		
		logger.info("isId: {}", isId);
		model.addAttribute("isId", isId);
		return "jsonView";
	}
	
	@RequestMapping(value="/nickCheck", method=RequestMethod.POST)
	public String nickCheck(Member member, Model model) {
		logger.info("/nickCheck [POST]");
		logger.info("Member {}", member);
		boolean isNick=memberService.nickCheck(member);
		
		logger.info("isNick: {}", isNick);
		model.addAttribute("isNick", isNick);
		return "jsonView";
	}
	
	
	@RequestMapping(value="/email", method= RequestMethod.POST)
	public String sendEmail(String email, Model model) {
		logger.info("이메일 클릭 {}", email);
		String authKey = memberService.sendAuthMail(email);
        
		model.addAttribute("authKey", authKey);
		return "jsonView";
	}
	
	
	
}
