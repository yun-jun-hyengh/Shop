package com.shopping.shop.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shopping.shop.vo.FindCriteria;
import com.shopping.shop.vo.MemberVO;
import com.shopping.shop.vo.PageCriteria;

@Mapper
public interface AdminMapper {
	
	public int getTotalMember() throws Exception;
	
	public List<MemberVO> memberList() throws Exception;
	
	public List<MemberVO> memberCriteria(PageCriteria cria) throws Exception;
	
	public List<MemberVO> allMemberList(FindCriteria findcri) throws Exception;
	
	public int findMemberCountData(FindCriteria findcri) throws Exception;
	
	public void gradeUpdate(HashMap<String, Object> list) throws Exception;
	
	public List<MemberVO> selectExcel(MemberVO memberVo) throws Exception;
}
