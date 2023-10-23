package com.shopping.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shopping.shop.vo.PageCriteria;
import com.shopping.shop.vo.VisitCountVO;

@Mapper
public interface VisitCountMapper {
	public void visitCount(VisitCountVO vo);
	public List<VisitCountVO> listCriteria(PageCriteria cria);
	public int countData(PageCriteria pageCria);
}
