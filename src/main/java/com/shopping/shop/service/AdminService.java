package com.shopping.shop.service;

import java.util.List;

import com.shopping.shop.vo.MemberVO;

public interface AdminService {
	
	public int getTotalMember() throws Exception;
	
	public List<MemberVO> memberList() throws Exception;
}
