package com.shopping.shop.service;

import java.util.ArrayList;

import com.shopping.shop.vo.MemberVO;

public interface MemberService {
	
	// 회원가입
	public int memberJoin(MemberVO member) throws Exception;
	
	// 아이디 중복체크
	public int idChk(MemberVO vo) throws Exception;
	
	// 로그인
	public MemberVO memberLogin(MemberVO member) throws Exception;
	
	public ArrayList<String> findId(MemberVO vo) throws Exception;
	
	// 비밀번호 찾기 
	public void findPw(String memberEmail, String memberId) throws Exception;
	
	public int findPwCheck(MemberVO memberVO) throws Exception;
	
	// 회원정보수정 
	public void updateMember(MemberVO memberVO) throws Exception;
}
