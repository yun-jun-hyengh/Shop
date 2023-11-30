package com.shopping.shop.quartz;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.shop.mapper.VisitQuartzMapper;

@Service("visitQuartzJob")
public class VisitQuartzServiceImpl implements VisitQuartzService {
	
	//@Autowired
	//private VisitQuartzService visitQuartzService;
	@Autowired
	private VisitQuartzMapper visitQuartzMapper;

	@Override
	public void visitDelete() {
		System.out.println("************* 스케줄러 작동 **************");
		visitQuartzMapper.visitDelete();
	}
	
	

}
