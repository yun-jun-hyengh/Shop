package com.shopping.shop.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.shopping.shop.vo.CateVO;
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
	
	public int getTodayMember() throws Exception;
	
	public List<Map<String, Object>> getWeekMember() throws Exception;
	
	public List<CateVO> cateList() throws Exception;
	
	public int cate1(CateVO catevo) throws Exception;
	
	public int cate2(CateVO catevo) throws Exception;
	
	public int cate3(CateVO catevo) throws Exception;
}
