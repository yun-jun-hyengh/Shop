package com.shopping.shop.vo;

import java.util.Date;

public class VisitCountVO {
	private int visit_id; // 기본키
	private String visit_ip; // 접속자 아이피
	private Date visit_time; // 접속자 접속시간
	private String visit_refer; // 어느 사이트를 타고 들어왔냐 
	private String visit_agent; // 접속자 브라우저 정보
	public int getVisit_id() {
		return visit_id;
	}
	public void setVisit_id(int visit_id) {
		this.visit_id = visit_id;
	}
	public String getVisit_ip() {
		return visit_ip;
	}
	public void setVisit_ip(String visit_ip) {
		this.visit_ip = visit_ip;
	}
	public Date getVisit_time() {
		return visit_time;
	}
	public void setVisit_time(Date visit_time) {
		this.visit_time = visit_time;
	}
	public String getVisit_refer() {
		return visit_refer;
	}
	public void setVisit_refer(String visit_refer) {
		this.visit_refer = visit_refer;
	}
	public String getVisit_agent() {
		return visit_agent;
	}
	public void setVisit_agent(String visit_agent) {
		this.visit_agent = visit_agent;
	}
	
	
}
