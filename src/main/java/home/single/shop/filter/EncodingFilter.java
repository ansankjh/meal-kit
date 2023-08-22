package home.single.shop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter("*")
public class EncodingFilter implements Filter {
	// utf-8 인코딩 필터
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		log.debug("\u001B[32m"+"EncodingFilter");
		
		request.setCharacterEncoding("utf-8");
		
		chain.doFilter(request, response);
	}
}
