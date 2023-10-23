package com.shopping.shop.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.shopping.shop.mapper.MemberMapper;
import com.shopping.shop.vo.MailUtils;
import com.shopping.shop.vo.MemberVO;
import com.shopping.shop.vo.TempKey;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper membermapper;
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public int memberJoin(MemberVO member) throws Exception {
		return membermapper.memberJoin(member);
	}

	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = membermapper.idChk(vo);
		return result;
	}

	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		return membermapper.memberLogin(member);
	}

	@Override
	public ArrayList<String> findId(MemberVO vo) throws Exception {
		List<MemberVO> list = membermapper.findId(vo);
		ArrayList<String> findId = new ArrayList<String>();
		for(int i = 0; i < list.size(); i++) {
			String memberId = list.get(i).getMemberId();
			findId.add(memberId);
		}
		return findId;
	}

	@Override
	public void findPw(String memberEmail, String memberId) throws Exception {
		String memberKey = new TempKey().getKey(6, false);
		String memberPw = BCrypt.hashpw(memberKey, BCrypt.gensalt());
		membermapper.findPw(memberPw, memberEmail, memberId);
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("[SSJ 쇼핑몰 임시 비밀번호 입니다.]");
		sendMail.setText(
				"<h1>임시 비밀번호 발급</h1>"
				+ "<br/>" + memberId + "님 "
				+ "<br/>비밀번호 찾기를 통한 임시 비밀번호가 발급되었습니다."
				+ "<br/>임시 비밀번호 :  <h2>" + memberKey + "</h2>"
				+ "<br/>로그인 후 비밀번호를 변경해 주세요.");
		sendMail.setFrom("jhyoun72002@naver.com", "SSJ");
		sendMail.setTo(memberEmail);
		sendMail.send();
	}

	@Override
	public int findPwCheck(MemberVO memberVO) throws Exception {
		return membermapper.findPwCheck(memberVO);
	}

	

}
