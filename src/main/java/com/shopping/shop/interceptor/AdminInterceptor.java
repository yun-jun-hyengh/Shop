package com.shopping.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.shopping.shop.vo.MemberVO;

public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		if(vo == null || vo.getAdminCk() == 0) {
			response.sendRedirect("/shop");
			return false;
		}
		return true;
	}
	

}
