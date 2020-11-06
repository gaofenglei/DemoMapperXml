package com.fh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fh.dao.LoginMapper;
import com.fh.entity.AreaInfo;
import com.fh.entity.LoginInfo;
import com.fh.service.LoginService;
import com.fh.util.PageInfo;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginMapper loginDao;

	//通过用户名查询
	public LoginInfo queryLoginByUserName(String userName) {
		return loginDao.queryLoginByUserName(userName);
	}

	//修改
	public void updateLogin(LoginInfo loginInfo) {
		loginDao.updateLogin(loginInfo);
	}

	//分页查询
	public PageInfo<LoginInfo> pagingQueryLogin(Integer cpage, Integer pageSize) {
		
		PageInfo<LoginInfo> pageInfo = new PageInfo<LoginInfo>(cpage, pageSize);
		
		//求出总条数
		Integer totalCount = loginDao.totalNumber();
		
		//分页
		List<LoginInfo> loginInfoList = loginDao.pagingQueryLogin(pageInfo.getStart(), pageInfo.getPageSize());
		
		pageInfo.setTotalCount(totalCount);
		
		pageInfo.setDataList(loginInfoList);
		
		return pageInfo;
	}

	//新增
	public void saveLogin(LoginInfo loginInfo) {
		loginDao.saveLogin(loginInfo);
	}

	//删除
	public void deleteLogin(String id) {
		loginDao.deleteLogin(id);
	}

	//回显
	public LoginInfo toUpdateLogin(String id) {
		return loginDao.toUpdateLogin(id);
	}

	//查询所有信息
	public List<LoginInfo> queryLogin() {
		return loginDao.queryLogin();
	}

	//查询所有地区
	@Override
	public List<AreaInfo> queryArea() {
		return loginDao.queryArea();
	}
	
}
