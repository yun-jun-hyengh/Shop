package com.shopping.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.shop.mapper.NoticeMapper;
import com.shopping.shop.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeMapper noticeMapper;

	@Override
	public void noticeInsert(NoticeVO vo) throws Exception {
		noticeMapper.noticeInsert(vo);
	}

}
