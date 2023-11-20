package com.shopping.shop.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.shopping.shop.vo.NoticeFileDTO;

@Mapper
public interface NoticeFileMapper {
	public void insert(NoticeFileDTO file);
}
