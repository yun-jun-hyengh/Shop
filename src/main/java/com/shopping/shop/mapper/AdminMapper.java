package com.shopping.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shopping.shop.vo.MemberVO;

@Mapper
public interface AdminMapper {
	
	public int getTotalMember() throws Exception;
	
	public List<MemberVO> memberList() throws Exception;
}
