package com.shopping.shop.vo;

import java.util.Date;

public class CustomerCenterVO {
	// 고객센터 게시판 
	private int customerCenterNum; // 고객센터 게시글 번호
	private String customerCenterCate; // 문의 카테고리
	private String customerCentertitle; // 문의 제목 
	private String customerCenterWriter; // 작성자
	private String customerCenterContent; // 내용
	private Date customerCenterDate; // 작성일자 
	public int getCustomerCenterNum() {
		return customerCenterNum;
	}
	public void setCustomerCenterNum(int customerCenterNum) {
		this.customerCenterNum = customerCenterNum;
	}
	public String getCustomerCenterCate() {
		return customerCenterCate;
	}
	public void setCustomerCenterCate(String customerCenterCate) {
		this.customerCenterCate = customerCenterCate;
	}
	public String getCustomerCentertitle() {
		return customerCentertitle;
	}
	public void setCustomerCentertitle(String customerCentertitle) {
		this.customerCentertitle = customerCentertitle;
	}
	public String getCustomerCenterWriter() {
		return customerCenterWriter;
	}
	public void setCustomerCenterWriter(String customerCenterWriter) {
		this.customerCenterWriter = customerCenterWriter;
	}
	public String getCustomerCenterContent() {
		return customerCenterContent;
	}
	public void setCustomerCenterContent(String customerCenterContent) {
		this.customerCenterContent = customerCenterContent;
	}
	public Date getCustomerCenterDate() {
		return customerCenterDate;
	}
	public void setCustomerCenterDate(Date customerCenterDate) {
		this.customerCenterDate = customerCenterDate;
	}
	
	
}
