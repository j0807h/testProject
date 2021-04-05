package banjjok_Hotel.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import banjjok_Hotel.domain.AuthInfo;



public class CertificationInterceptor extends HandlerInterceptorAdapter {
	// 컨트롤러 실행 직전
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		if(ObjectUtils.isEmpty(authInfo)) {
			// authInfo가 비어있으면 = 세션이 비어있으면
			response.sendRedirect("/");
			return false;
		} else {
			return true;
		}
	}
	
	// 컨트롤러 진입 후, view 랜더링 전
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	
	//view로 들어오고 나서(정상 랜더링 된 후)
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}
	
	
	
}
