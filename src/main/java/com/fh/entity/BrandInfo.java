package com.fh.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BrandInfo {

	//编号
	private String id;
	//品牌名
	private String brandName;
	//创建时间
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	private Date createDate;
	
	
	
	//===========================================
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
