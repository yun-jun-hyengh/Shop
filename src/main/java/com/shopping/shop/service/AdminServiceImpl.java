package com.shopping.shop.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
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
			Sheet sheet = workbook.createSheet("회원리스트");
			sheet.setDefaultColumnWidth((short)15);
			//sheet.setColumnWidth((short)8, (short)20);
			Row row = null;
			Cell cell = null;
			int rowNo = 0;
			
			CellStyle headStyle = workbook.createCellStyle();
			
			headStyle.setBorderTop(BorderStyle.THIN);
			headStyle.setBorderBottom(BorderStyle.THIN);
			headStyle.setBorderLeft(BorderStyle.THIN);
			headStyle.setBorderRight(BorderStyle.THIN);
			
			headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
			headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			
			CellStyle bodyStyle = workbook.createCellStyle();
			bodyStyle.setBorderTop(BorderStyle.THIN);
			bodyStyle.setBorderBottom(BorderStyle.THIN);
			bodyStyle.setBorderLeft(BorderStyle.THIN);
			bodyStyle.setBorderRight(BorderStyle.THIN);
			
			// 헤더설정 
			String[] headerArray = {"번호","회원 아이디","회원이름","휴대폰 번호","이메일","적립 포인트","사용자 권한","회원등급","우편번호","주소","상세주소"};
			row = sheet.createRow(rowNo++);
			for(int i = 0; i < headerArray.length; i++) {
				cell = row.createCell(i);
				cell.setCellStyle(headStyle);
				cell.setCellValue(headerArray[i]);
			}
			
			for(MemberVO excelData : list) {
				row = sheet.createRow(rowNo++);
				
				cell = row.createCell(0);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(excelData.getMemberNum());
				
				cell = row.createCell(1);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(excelData.getMemberId());
				
				cell = row.createCell(2);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(excelData.getMemberName());
				
				cell = row.createCell(3);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(excelData.getMemberPhoneNumber());
				
				cell = row.createCell(4);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(excelData.getMemberPhoneNumber());
				
				cell = row.createCell(5);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(excelData.getPoint());
				
				cell = row.createCell(6);
				cell.setCellStyle(bodyStyle);
				if(excelData.getAdminCk() == 1) {
					cell.setCellValue("관리자");
				} else {
					cell.setCellValue("일반 사용자");
				}
				
				cell = row.createCell(7);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(excelData.getCodeName());
				
				cell = row.createCell(8);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(excelData.getAddress1());
				
				cell = row.createCell(9);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(excelData.getAddress2());
				
				cell = row.createCell(10);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(excelData.getAddress3());
				
			}
			
			// 컨텐츠 타입과 파일명 지정 
			response.setContentType("ms-vnd/excel");
			response.setHeader("Content-Disposition", "attachment; filename=" + java.net.URLEncoder.encode("회원관리.xls", "UTF-8"));
			
			workbook.write(response.getOutputStream());
			workbook.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	public int getTodayMember() throws Exception {
		return adminMapper.getTodayMember();
	}

}
