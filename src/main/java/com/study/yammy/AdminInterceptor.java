package com.study.yammy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.study.utility.Utility;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(true);

		String grade = Utility.checkNull((String) session.getAttribute("grade"));
		System.out.println("session.getAttribute(\"grade\"): " + grade);
		System.out.println("preHandle executed.");
		if (grade.length() != 0 && grade.compareTo("A ") <= 0) {
			System.out.println("접속 권한 있음 : " + grade);
			return true;

		} else if (grade.length() != 0 && grade.compareTo("A ") > 0) {

			response.sendRedirect("/errorMsg");
			return false;
		} else {

			response.sendRedirect("/member/login");
			return false;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("postHandle executed.");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("관리자 Interceptor 실행 후 최종 출력.");
	}
}