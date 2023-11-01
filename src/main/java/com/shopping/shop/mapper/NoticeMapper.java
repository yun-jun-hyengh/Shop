package com.shopping.shop.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.shopping.shop.vo.NoticeVO;

@Mapper
public interface NoticeMapper {
	
	public void noticeInsert(NoticeVO vo) throws Exception;
}
