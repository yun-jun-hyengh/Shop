package com.shopping.shop.vo;

import java.util.Date;
import java.util.List;

public class NoticeVO {
	private int bno; // 게시글 번호
	private String title; // 게시글 제목
	private String content; // 게시글 내용
	private String writer; // 글 작성자
	private Date regdate; // 작성일자 
	private int hit; // 조회수 
	private List<NoticeFileVO> files;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public List<NoticeFileVO> getFiles() {
		return files;
	}
	public void setFiles(List<NoticeFileVO> files) {
		this.files = files;
	}
}
