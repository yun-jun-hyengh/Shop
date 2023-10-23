package com.shopping.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.shop.mapper.VisitCountMapper;
import com.shopping.shop.vo.PageCriteria;
import com.shopping.shop.vo.VisitCountVO;

@Service
public class VisitCountServiceImpl implements VisitCountService {
	
	@Autowired
	private VisitCountMapper visitCountMapper;

	@Override
	public List<VisitCountVO> listCriteria(PageCriteria cria) throws Exception {
		return visitCountMapper.listCriteria(cria);
	}

	@Override
	public int listCountData(PageCriteria cria) throws Exception {
		return visitCountMapper.countData(cria);
	}

}
