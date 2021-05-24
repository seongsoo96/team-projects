package ppeonfun.util.interceptor.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import ppeonfun.dto.Member;
import ppeonfun.service.admin.member.MemberService;

public class AdminInterceptor implements HandlerInterceptor {
	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	
	@Autowired MemberService memberService;


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("+++인터셉터 시작+++");
		//세션 검사 - 관리자일 경우에만 컨트롤러로 보내기
		//세션 객체
		HttpSession session = request.getSession();
		//1. 비로그인 상태
		if(session.getAttribute("mNo")==null) {
			logger.info(">>접속 불가 : 비 로그인 상태");
			
			//에러안내 페이지로 리다이렉트
			response.sendRedirect("/");
			
			return false; //컨트롤러 접근 금지
		}
		//2. 로그인 상태
		else {
			logger.info(">>로그인 상태");
			
			int mNo = (Integer)session.getAttribute("mNo");
			Member member  = new Member();
			member.setmNo(mNo);
			member=memberService.checkGrade(member);
		
			
			if(!"M".equals(member.getmGrade())) {
				logger.info(">> 접속 불가 : 일반 사용자 로그인");
				//에러안내 페이지로 리다이렉트
				response.sendRedirect("/");
				return false;
			}
		}
		logger.info(">> 정상 접근: 관리자 로그인");

		return true; //컨트롤러로 요청정보를 보내줌(요청 처리 허가)
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("+++인터셉터 종료+++");
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
}
