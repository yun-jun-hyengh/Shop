package com.shopping.shop.service;

import java.util.List;

import com.shopping.shop.vo.PageCriteria;
import com.shopping.shop.vo.VisitCountVO;

public interface VisitCountService {
	public List<VisitCountVO> listCriteria(PageCriteria cria) throws Exception;
	public int listCountData(PageCriteria cria) throws Exception;
}
