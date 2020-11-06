package com.fh.dao;

import java.util.List;

import com.fh.entity.AreaInfo;
import com.fh.entity.LoginInfo;

public interface LoginMapper {

	//通过用户名查询
	LoginInfo queryLoginByUserName(String userName);

	//修改
	void updateLogin(LoginInfo loginInfo);

	//分页查询
	List<LoginInfo> pagingQueryLogin(Integer cpage, Integer pageSize);

	//求出总条数
	Integer totalNumber();

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
