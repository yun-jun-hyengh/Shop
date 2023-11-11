package com.shopping.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.shop.mapper.NoticeReplyMapper;
import com.shopping.shop.vo.NoticeReplyVO;

@Service
public class NoticeReplyServiceImpl implements NoticeReplyService {
	
	@Autowired
	private NoticeReplyMapper noticeReplyMapper;

	@Override
	public void noticeReWrite(NoticeReplyVO vo) throws Exception {
		noticeReplyMapper.noticeReWrite(vo);
	}

	@Override
	public List<NoticeReplyVO> noticeReList(int bno) throws Exception {
		return noticeReplyMapper.noticeReList(bno);
	}

	@Override
	public void noticeReDelete(int rno) throws Exception {
		noticeReplyMapper.noticeReDelete(rno);
	}

	@Override
	public void noticeReModify(NoticeReplyVO vo) throws Exception {
		noticeReplyMapper.noticeReModify(vo);
	}

}
