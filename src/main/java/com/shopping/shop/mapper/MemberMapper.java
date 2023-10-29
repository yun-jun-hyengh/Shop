package com.shopping.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.shopping.shop.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	// 회원가입
	public int memberJoin(MemberVO memberVO) throws Exception;
	
	// 아이디 중복체크
	public int idChk(MemberVO vo) throws Exception;
	
	// 로그인
	public MemberVO memberLogin(MemberVO member) throws Exception;
	
	// 아이디 찾기 
	public List<MemberVO> findId(MemberVO vo) throws Exception;
	
	// 비밀번호 찾기 
	public int findPwCheck(MemberVO memberVO) throws Exception;
	
	public int findPw(@Param("memberPw") String memberPw, @Param("memberEmail") String memberEmail, 
			@Param("memberId") String memberId) throws Exception;
	
	// 회원정보수정 
	public void updateMember(MemberVO memberVO) throws Exception;
	
	// 회원탈퇴 
	public int deleteMember(@Param("memberId") String memberId) throws Exception;
	
	// 비밀번호 체크
	public int pwCheck(MemberVO vo) throws Exception;
}
