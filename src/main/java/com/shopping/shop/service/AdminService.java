package com.shopping.shop.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.shopping.shop.vo.FindCriteria;
import com.shopping.shop.vo.MemberVO;
import com.shopping.shop.vo.PageCriteria;

public interface AdminService {
	
	public int getTotalMember() throws Exception;
	
	public List<MemberVO> memberList() throws Exception;
	
	public List<MemberVO> memberCriteria(PageCriteria pCria) throws Exception;
	
	public List<MemberVO> allMemberList(FindCriteria findcri) throws Exception;
	
	public int findMemberCountData(FindCriteria findcri) throws Exception;
	
	public void gradeUpdate(HashMap<String, Object> list) throws Exception;
	
	public void excelDown(MemberVO memberVO, HttpServletResponse response) throws Exception;
}
