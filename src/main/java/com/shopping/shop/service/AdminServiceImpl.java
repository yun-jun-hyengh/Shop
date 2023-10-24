package com.shopping.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.shop.mapper.AdminMapper;
import com.shopping.shop.vo.FindCriteria;
import com.shopping.shop.vo.MemberVO;
import com.shopping.shop.vo.PageCriteria;

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

	@Override
	public List<MemberVO> allMemberList(FindCriteria findcri) throws Exception {
		return adminMapper.allMemberList(findcri);
	}

	@Override
	public int findMemberCountData(FindCriteria findcri) throws Exception {
		return adminMapper.findMemberCountData(findcri);
	}

	@Override
	public List<MemberVO> memberCriteria(PageCriteria pCria) throws Exception {
		return adminMapper.memberCriteria(pCria);
	}

}
