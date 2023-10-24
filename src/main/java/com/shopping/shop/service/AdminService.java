package com.shopping.shop.service;

import java.util.List;

import com.shopping.shop.vo.FindCriteria;
import com.shopping.shop.vo.MemberVO;
import com.shopping.shop.vo.PageCriteria;

public interface AdminService {
	
	public int getTotalMember() throws Exception;
	
	public List<MemberVO> memberList() throws Exception;
	
	public List<MemberVO> memberCriteria(PageCriteria pCria) throws Exception;
	
	public List<MemberVO> allMemberList(FindCriteria findcri) throws Exception;
	
	public int findMemberCountData(FindCriteria findcri) throws Exception;
}
