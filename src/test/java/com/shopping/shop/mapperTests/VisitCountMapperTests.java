package com.shopping.shop.mapperTests;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shopping.shop.mapper.VisitCountMapper;
import com.shopping.shop.vo.PageCriteria;
import com.shopping.shop.vo.VisitCountVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class VisitCountMapperTests {
	
	@Autowired
	private VisitCountMapper visitCountMapper;
	
	@Test
	public void listCriteriaTest() throws Exception {
		PageCriteria pcri = new PageCriteria();
		pcri.setPage(1);
		pcri.setNumPerPage(5);
		
		List<VisitCountVO> list = visitCountMapper.listCriteria(pcri);
		for(VisitCountVO vo : list) {
			System.out.println(vo.getVisit_id() + " : " + vo.getVisit_ip() + " : " + vo.getVisit_time());
		}
	}
}
