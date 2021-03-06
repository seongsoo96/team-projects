package filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Filter implements javax.servlet.Filter{
	
	String charset = null;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//초기화
		charset = filterConfig.getInitParameter("enc");
		
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		request.setCharacterEncoding(charset);
		chain.doFilter(request, response);
		
	}

}
