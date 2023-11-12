package com.shopping.shop.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.shopping.shop.mapper.VisitCountMapper;
import com.shopping.shop.vo.VisitCountVO;


public class SessionEventListener implements HttpSessionListener {
	
	private static int activeSessions = 0;
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		System.out.println("세션 생성됨");
		activeSessions++;
		
		HttpSession session = se.getSession();
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		VisitCountMapper visitCountMapper = (VisitCountMapper)wac.getBean("visitCountMapper");
		VisitCountVO vo = new VisitCountVO();

		vo.setVisit_ip(req.getRemoteAddr());
		vo.setVisit_agent(req.getHeader("User-Agent"));
		vo.setVisit_refer(req.getHeader("referer"));
		visitCountMapper.visitCount(vo);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		System.out.println("세션 소멸됨");
		activeSessions--;
	}
	
	public static int getActiveSessions() {
		System.out.println(activeSessions);
		return activeSessions;
	}
	
}
