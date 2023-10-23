package com.shopping.shop.mapperTests;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shopping.shop.mapper.MemberMapper;
import com.shopping.shop.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTests {
	@Autowired
	private MemberMapper memberMapper;
	
	/*@Test
	public void testTime() throws Exception {
		System.out.println(memberMapper.getTime());
	}*/
	
	@Test
	public void insertTest() throws Exception {
		MemberVO vo = new MemberVO();
		vo.setMemberId("wwww");
		vo.setMemberPw("wwww");
		vo.setMemberName("김길동");
		vo.setMemberPhoneNumber("01035288515");
		vo.setMemberEmail("wwww@naver.com");
		vo.setAddress1("444444");
		vo.setAddress2("부산시 사하구");
		vo.setAddress3("1023호");
		memberMapper.memberJoin(vo);
	}
	
}
