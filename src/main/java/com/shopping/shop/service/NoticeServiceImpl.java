package com.shopping.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.shop.mapper.NoticeFileMapper;
import com.shopping.shop.mapper.NoticeMapper;
import com.shopping.shop.vo.FindCriteria;
import com.shopping.shop.vo.NoticeFileDTO;
import com.shopping.shop.vo.NoticeFileVO;
import com.shopping.shop.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeMapper noticeMapper;
	@Autowired
	private NoticeFileMapper noticeFileMapper;

	@Override
	public int noticeInsert(NoticeVO vo) throws Exception {
		int result = noticeMapper.noticeInsert(vo);
		for(NoticeFileVO file : vo.getFiles()) {
			NoticeFileDTO fileDTO = new NoticeFileDTO();
			fileDTO.setUuid(file.getUuid());
			fileDTO.setUploadPath(file.getUploadPath());
			fileDTO.setFileName(file.getFileName());
			fileDTO.setFileType(file.isFileType());
			fileDTO.setBno(vo.getBno());
			noticeFileMapper.insert(fileDTO);
		}
		return result;
	}

	@Override
	public List<NoticeVO> noticeList(FindCriteria findCri) throws Exception {
		return noticeMapper.noticeList(findCri);
	}

	@Override
	public NoticeVO noticeRead(int bno) throws Exception {
		return noticeMapper.noticeRead(bno);
	}

	@Override
	public void viewCount(int bno) {
		noticeMapper.viewCount(bno);
	}

	@Override
	public int noticeDelete(int bno) throws Exception {
		return noticeMapper.noticeDelete(bno);
	}

	@Override
	public void noticeUpdate(NoticeVO vo) throws Exception {
		noticeMapper.noticeUpdate(vo);
	}

	@Override
	public int noticeFindCountData(FindCriteria findCri) throws Exception {
		return noticeMapper.noticeFindCountData(findCri);
	}

}
