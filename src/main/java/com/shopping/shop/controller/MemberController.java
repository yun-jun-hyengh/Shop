package com.shopping.shop.controller;

import java.util.ArrayList;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shopping.shop.service.MemberService;
import com.shopping.shop.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	// 약관동의 페이지
	@GetMapping("/useSuccess")
	public String joinPage() {
		return "member/join";
	}
	
	// 회원가입 페이지
	@GetMapping("/register")
	public String register() {
		return "member/register";
	}
	
	// 회원가입
	@PostMapping("/registerSuccess")
	@ResponseBody
	public String signIn(MemberVO vo) throws Exception {
		System.out.println("... 회원가입 들어옴 ...");
		String msg = "";
		
		String password = vo.getMemberPw();
		password = pwEncoder.encode(password);
		vo.setMemberPw(password);
		int num = memberService.memberJoin(vo);
		if(num == 1) {
			msg = "ok";
		} else {
			System.out.println("Fail");
		}
		return msg;
	}
	
	// 아이디 중복체크 
	@ResponseBody
	@PostMapping("/idChk")
	public int idChk(MemberVO vo) throws Exception {
		int result = memberService.idChk(vo);
		return result;
	}
	
	// 이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) throws Exception {
		System.out.println("이메일확인 : " + email);
		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		String setFrom = "jhyoun72002@naver.com";
		String toMail = email;
		String title = "회원가입 인증 번호입니다.";
		String content = "저희 쇼핑몰에 방문해 주셔서 감사합니다."
				+ "<br><br>"
				+ "인증 번호는 " + checkNum + "입니다."
				+ "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		String num = Integer.toString(checkNum);
		return num;
	}
	
	// 로그인 페이지 
	@GetMapping("/login")
	public String loginPage() {
		return "member/login";
	}
	
	// 로그인
	@PostMapping("/login.do")
	public String login(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
		
		MemberVO vo = memberService.memberLogin(member);
		
		if(vo != null) {
			rawPw = member.getMemberPw();
			encodePw = vo.getMemberPw();
			
			if(true == pwEncoder.matches(rawPw, encodePw)) {
				vo.setMemberPw("");
				session.setAttribute("member", vo);
				return "redirect:/";
			} else {
				rttr.addFlashAttribute("result", 0);
				return "redirect:/member/login";
			}
		} else {
			rttr.addFlashAttribute("result", 0);
			return "redirect:/member/login";
		}
	}
	
	// 로그아웃 
	@RequestMapping(value="/logout", method=RequestMethod.POST)
	@ResponseBody
	public void logout(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		session.invalidate();
	}
	
	// 아이디 찾기 
	@GetMapping("/findId")
	public String findId() {
		return "member/findId";
	}
	
	@PostMapping("/findIdSuccess")
	public @ResponseBody String findSuccess(@ModelAttribute MemberVO vo,
			Model model, HttpServletResponse response) throws Exception {
		System.out.println(vo.toString());
		
		ArrayList<String> idList = memberService.findId(vo);
		String findId = "{\"memberId\":\""+idList+"\"}";
		//String findId = idList;
		System.out.println(findId);
		return findId;
	}
	
	// 비밀번호 찾기 페이지
	@GetMapping("/findPw")
	public String findPw() {
		return "member/findPw";
	}
	
	@RequestMapping(value="/findPw", method=RequestMethod.POST)
	public String findPw(MemberVO memberVO, Model model) throws Exception {
		if(memberService.findPwCheck(memberVO) == 0) {
			model.addAttribute("msg", "아이디와 이메일을 확인해주세요");
			return "member/findPw";
		} else {
			memberService.findPw(memberVO.getMemberEmail(), memberVO.getMemberId());
			model.addAttribute("member", memberVO.getMemberEmail());
			return "member/findPwSuccess";
		}
	}
	
	// 마이페이지 이동
	@GetMapping("/mypage")
	public String myPage(HttpSession session) {
		return "member/myPage";
	}
	
	// 내 정보 보기 
	@GetMapping("/memberUpdatePage")
	public String memberUpdateView(HttpSession session) {
		return "member/memberUpdateView";
	}
}
