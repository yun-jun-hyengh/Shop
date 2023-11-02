package com.shopping.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.shop.mapper.NoticeMapper;
import com.shopping.shop.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeMapper noticeMapper;

	@Override
	public int noticeInsert(NoticeVO vo) throws Exception {
		int result = noticeMapper.noticeInsert(vo);
		return result;
	}

	@Override
	public List<NoticeVO> noticeList() throws Exception {
		return noticeMapper.noticeList();
	}

}
