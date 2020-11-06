package com.fh.service;

import java.util.List;

import com.fh.entity.AreaInfo;
import com.fh.entity.LoginInfo;
import com.fh.util.PageInfo;

public interface LoginService {

	//通过用户名查询
	LoginInfo queryLoginByUserName(String userName);

	//修改
	void updateLogin(LoginInfo loginInfo);

	//分页查询
	PageInfo<LoginInfo> pagingQueryLogin(Integer cpage, Integer pageSize);

	//新增
	void saveLogin(LoginInfo loginInfo);

	//删除
	void deleteLogin(String id);

	//回显
	LoginInfo toUpdateLogin(String id);

	//查询所有信息
	List<LoginInfo> queryLogin();

	//查询所有地区
	List<AreaInfo> queryArea();

}
