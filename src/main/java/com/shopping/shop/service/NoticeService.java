package com.shopping.shop.service;

import java.util.List;

import com.shopping.shop.vo.NoticeVO;

public interface NoticeService {
	public int noticeInsert(NoticeVO vo) throws Exception;
	
	public List<NoticeVO> noticeList() throws Exception;
}
