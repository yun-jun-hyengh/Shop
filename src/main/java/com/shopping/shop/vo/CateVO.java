package com.shopping.shop.vo;

public class CateVO {
	private int tier;
	private String cateName; // 카테고리 이름
	private String cateParent1; // 상위 카테고리
	private String cateParent2; // 하위 카테고리 
	public int getTier() {
		return tier;
	}
	public void setTier(int tier) {
		this.tier = tier;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getCateParent1() {
		return cateParent1;
	}
	public void setCateParent1(String cateParent1) {
		this.cateParent1 = cateParent1;
	}
	public String getCateParent2() {
		return cateParent2;
	}
	public void setCateParent2(String cateParent2) {
		this.cateParent2 = cateParent2;
	}
	
	
}
