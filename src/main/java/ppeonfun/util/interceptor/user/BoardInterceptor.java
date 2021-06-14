package ppeonfun.util.interceptor.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class BoardInterceptor  implements HandlerInterceptor {

	private static final Logger logger = LoggerFactory.getLogger(MypageInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("+++인터셉터 시작+++");
		
		//세션객체 
		HttpSession session = request.getSession();
		
		if(session.getAttribute("mNick")==null) {
			logger.info(">>마이페이지 접속 불가: 비 로그인 상태");
			
			response.sendRedirect("/user/board/error");
			
			return false;
		}
		    logger.info(">>정상적인 접속: 로그인 상태");	
			return true;
		}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("+++인터셉터 종료+++");	
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
}
