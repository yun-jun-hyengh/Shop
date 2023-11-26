package com.shopping.shop.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shopping.shop.service.NoticeReplyService;
import com.shopping.shop.service.NoticeService;
import com.shopping.shop.vo.FindCriteria;
import com.shopping.shop.vo.NoticeFileVO;
import com.shopping.shop.vo.NoticeReplyVO;
import com.shopping.shop.vo.NoticeVO;
import com.shopping.shop.vo.PagingMaker;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private NoticeReplyService noticeReplyService;
	
	@GetMapping("/noticelist")
	public String list(Model model, @ModelAttribute("fCri") FindCriteria fCri) throws Exception {
		model.addAttribute("list", noticeService.noticeList(fCri));
		
		PagingMaker pagingMaker = new PagingMaker();
		pagingMaker.setCri(fCri);
		pagingMaker.setTotalData(noticeService.noticeFindCountData(fCri));
		
		model.addAttribute("pagingMaker", pagingMaker);
		model.addAttribute("finalEndPage", pagingMaker.getFinalEndPage());
		return "notice/noticeList";
	}
	
	@GetMapping("/noticewrite")
	public String writePage() throws Exception {
		return "notice/write";
	}
	
	@PostMapping("/noticewrite")
	@ResponseBody
	public String write(NoticeVO vo) throws Exception {
		int result = noticeService.noticeInsert(vo);
		if(result == 1) {
			return "ok";
		}
		return "fail";
	}
	
	@GetMapping("/noticeRead")
	public void read(@RequestParam("bno") int bno, Model model, @ModelAttribute("fCri") FindCriteria fCri) throws Exception {
		NoticeVO vo = noticeService.noticeRead(bno);
		model.addAttribute("noticeVO", noticeService.noticeRead(bno));
		noticeService.viewCount(vo.getBno());
		
		//List<NoticeReplyVO> replyList = noticeReplyService.noticeReList(bno);
		//model.addAttribute("replyList", replyList);
	}
	
	@PostMapping("/noticeDel")
	@ResponseBody
	public String delete(@RequestParam("bno") int bno, RedirectAttributes rttr,
			FindCriteria fCri) throws Exception{
		//System.out.println("삭제할 게시글 번호 : " + bno);
		int result = noticeService.noticeDelete(bno);
		if(result == 1) {
			rttr.addAttribute("page", fCri.getPage());
			rttr.addAttribute("numPerPage", fCri.getNumPerPage());
			rttr.addAttribute("findType", fCri.getFindType());
			rttr.addAttribute("keyword", fCri.getKeyword());
			return "success";
		} 
		return "fali";
	}
	
	@GetMapping("/noticeModifyPage")
	public void modifyPage(@RequestParam("bno") int bno, Model model, 
			@ModelAttribute("fCri") FindCriteria fCri) throws Exception {
		model.addAttribute("noticeVO", noticeService.noticeRead(bno));
	}
	
	@PostMapping("/noticeModifyPage")
	public String modify(NoticeVO noticeVO, RedirectAttributes rttr,
			FindCriteria fCri) throws Exception {
		noticeService.noticeUpdate(noticeVO);
		
		rttr.addAttribute("page", fCri.getPage());
		rttr.addAttribute("numPerPage", fCri.getNumPerPage());
		rttr.addAttribute("findType", fCri.getFindType());
		rttr.addAttribute("keyword", fCri.getKeyword());
		rttr.addFlashAttribute("modifyResult","modSuccess");
		return "redirect:/notice/noticelist";
	}
	
	@PostMapping(value="/noticeUpload", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<NoticeFileVO>> upload(MultipartFile[] multipartFiles) {
		List<NoticeFileVO> files = new ArrayList<NoticeFileVO>();
		String uploadDirectory = "C:/upload";
		String uploadDatePath = getDirectoryForm();
		
		File uploadPath = new File(uploadDirectory, uploadDatePath);
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : multipartFiles) {
			NoticeFileVO noticeFileVO = new NoticeFileVO();
			String originalFileName = multipartFile.getOriginalFilename();
			String fileName = null;
			
			UUID uuid = UUID.randomUUID();
			fileName = uuid.toString() + "_" + originalFileName;
			
			noticeFileVO.setUuid(uuid.toString());
			noticeFileVO.setFileName(originalFileName);
			noticeFileVO.setUploadPath(uploadDatePath);
			
			try {
				File file = new File(uploadPath, fileName);
				multipartFile.transferTo(file);
				InputStream in = new FileInputStream(file);
				if(checkImageType(file)) {
					noticeFileVO.setFileType(true);
					FileOutputStream out = new FileOutputStream(new File(uploadPath, "t_" + fileName));
					Thumbnailator.createThumbnail(in, out, 100,100);
					in.close();
					out.close();
				}
				files.add(noticeFileVO);
			} catch(IllegalStateException e) {
				e.printStackTrace();
			} catch(IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return new ResponseEntity<List<NoticeFileVO>>(files, HttpStatus.OK);
	}
	
	private String getDirectoryForm() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date today = new Date();
		return simpleDateFormat.format(today);
	}
	
	private boolean checkImageType(File file) throws Exception {
		String contentType = Files.probeContentType(file.toPath());
		return contentType.startsWith("image");
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> display(String fileName){
		File file = new File("C:/upload/" + fileName);
		ResponseEntity<byte[]> result = null;
		HttpHeaders header = new HttpHeaders();
		try {
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch(IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 첨부파일 전체 목록 
	@GetMapping(value="/files", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<NoticeFileVO> getFiles(int bno) throws Exception {
		return noticeService.getFiles(bno);
	}
	
	@PostMapping("/deleteFile")
	@ResponseBody
	public void delete(@RequestParam("fileName") String fileName, @RequestParam("fileType") boolean fileType) {
		File file = null;
		try {
			file = new File("C:/upload/" + URLDecoder.decode(fileName, "UTF-8"));
			System.gc();
			System.runFinalization();
			
			file.delete();
			if(fileType) {
				file = new File(file.getPath().replace("t_", ""));
				file.delete();
			}
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
}
