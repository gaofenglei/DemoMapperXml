package com.fh.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fh.dao.BrandMapper;
import com.fh.entity.BrandInfo;
import com.fh.service.BrandService;
import com.fh.util.PageInfo;

@Service
public class BrandServiceImpl implements BrandService{
	
	@Autowired
	private BrandMapper brandDao;

	//分页
	public PageInfo<BrandInfo> pagingQueryBrand(Integer cpage, Integer pageSize) {
		
		PageInfo<BrandInfo> pageInfo = new PageInfo<BrandInfo>(cpage, pageSize);
		
		//求出总条数
		Integer totalCount = brandDao.totalNumber();
		
		//分页
		List<BrandInfo> brandInfoList = brandDao.pagingQueryBrand(pageInfo.getStart(), pageInfo.getPageSize());
		
		pageInfo.setTotalCount(totalCount);
		
		pageInfo.setDataList(brandInfoList);
		
		return pageInfo;
	}

	//新增
	public void saveBrand(BrandInfo brandInfo) {
		brandInfo.setCreateDate(new Date());
		brandDao.saveBrand(brandInfo);
	}

	//删除
	public void deleteBrand(String id) {
		brandDao.deleteBrand(id);
	}

	//回显
	public BrandInfo toUpdateBrand(String id) {
		return brandDao.toUpdateBrand(id);
	}

	//修改
	public void updateBrand(BrandInfo brandInfo) {
		brandDao.updateBrand(brandInfo);
	}
	
}
