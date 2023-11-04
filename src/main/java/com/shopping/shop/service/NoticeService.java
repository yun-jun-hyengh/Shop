package com.shopping.shop.service;

import java.util.List;

import com.shopping.shop.vo.NoticeVO;

public interface NoticeService {
	public int noticeInsert(NoticeVO vo) throws Exception;
	
	public List<NoticeVO> noticeList() throws Exception;
	
	public NoticeVO noticeRead(int bno) throws Exception;
	
	public void viewCount(int bno);
	
	public int noticeDelete(int bno) throws Exception;
}
