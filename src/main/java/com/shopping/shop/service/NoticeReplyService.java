package com.shopping.shop.service;

import java.util.List;

import com.shopping.shop.vo.NoticeReplyVO;

public interface NoticeReplyService {
	
	public void noticeReWrite(NoticeReplyVO vo) throws Exception;
	
	public List<NoticeReplyVO> noticeReList(int bno) throws Exception;

	public void noticeReDelete(int rno) throws Exception;
	
	public void noticeReModify(NoticeReplyVO vo) throws Exception;
}
