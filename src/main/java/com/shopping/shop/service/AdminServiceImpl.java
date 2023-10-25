package com.shopping.shop.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
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

	@Override
	public void gradeUpdate(HashMap<String, Object> list) throws Exception {
		adminMapper.gradeUpdate(list);
	}

	@Override
	public void excelDown(MemberVO memberVO, HttpServletResponse response) throws Exception {
		List<MemberVO> list = adminMapper.selectExcel(memberVO);
		
		try {
			Workbook workbook = new HSSFWorkbook();
			Sheet sheet = workbook.createSheet("***회원리스트***");
			
			Row row = null;
			Cell cell = null;
			int rowNo = 0;
			
			CellStyle headStyle = workbook.createCellStyle();
			
			headStyle.setBorderTop(BorderStyle.THIN);
			// https://eugene-kim.tistory.com/73
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
