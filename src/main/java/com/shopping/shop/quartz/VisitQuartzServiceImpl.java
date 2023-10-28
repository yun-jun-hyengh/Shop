package com.shopping.shop.quartz;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("visitQuartzJob")
public class VisitQuartzServiceImpl implements VisitQuartzService {
	
	@Autowired
	private VisitQuartzService visitQuartzService;

	@Override
	public int visitDelete() {
		System.out.println("************* 스케줄러 작동 **************");
		return visitQuartzService.visitDelete();
	}
	
	

}
