package com.shopping.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shopping.shop.vo.NoticeReplyVO;

@Mapper
public interface NoticeReplyMapper {
	
	public void noticeReWrite(NoticeReplyVO vo) throws Exception;
	
	public List<NoticeReplyVO> noticeReList(int bno) throws Exception;

	public void noticeReDelete(int rno) throws Exception;
}
