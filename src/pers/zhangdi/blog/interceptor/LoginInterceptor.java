package pers.zhangdi.blog.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	//在Controller之前进行拦截
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Object admin = request.getSession().getAttribute("admin");
		if(admin != null) {
			return true;
		}else {
			response.sendRedirect("login.do");
			return false;
		}
	}
	
	//在Controller之后进行拦截
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
	//请求处理完毕之后，页面输出给浏览器之前(即JSP页面已经解析完，就差传给浏览器)
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
