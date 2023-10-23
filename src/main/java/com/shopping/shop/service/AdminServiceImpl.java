package com.shopping.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.shop.mapper.AdminMapper;
import com.shopping.shop.vo.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;

	@Override
	public int getTotalMember() throws Exception {
		return adminMapper.getTotalMember();
	}

	@Override
	public List<MemberVO> memberList() throws Exception {
		return adminMapper.memberList();
	}

}
