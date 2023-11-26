package com.shopping.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shopping.shop.vo.FindCriteria;
import com.shopping.shop.vo.NoticeFileVO;
import com.shopping.shop.vo.NoticeVO;

@Mapper
public interface NoticeMapper {
	
	public int noticeInsert(NoticeVO vo) throws Exception;
	
	public List<NoticeVO> noticeList(FindCriteria findCri) throws Exception;
	public int noticeFindCountData(FindCriteria findCri) throws Exception;
	
	public NoticeVO noticeRead(int bno) throws Exception;
	
	public void viewCount(int bno);
	
	public int noticeDelete(int bno) throws Exception;
	
	public void noticeUpdate(NoticeVO vo) throws Exception;
	
	public List<NoticeFileVO> getFiles(int bno) throws Exception;
}
