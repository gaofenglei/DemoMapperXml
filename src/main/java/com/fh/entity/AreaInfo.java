package com.fh.entity;

public class AreaInfo {
	
	//地区编号
	private Integer id;
	//省级id
	private Integer pid;
	//名称
	private String name;
	//类型
	private Integer type;
	
	
	
	
	//-----------------------------------------------
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
}
