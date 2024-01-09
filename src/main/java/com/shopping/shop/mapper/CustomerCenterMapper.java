package com.shopping.shop.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.shopping.shop.vo.CustomerCenterVO;

@Mapper
public interface CustomerCenterMapper {
	
	public int customerInsert(CustomerCenterVO vo) throws Exception;
}
