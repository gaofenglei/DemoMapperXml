package com.fh.dao;

import java.util.List;

import com.fh.entity.BrandInfo;

public interface BrandMapper {

	//求出总条数
	Integer totalNumber();

	//分页
	List<BrandInfo> pagingQueryBrand(int start, int pageSize);

	//新增
	void saveBrand(BrandInfo brandInfo);

	//删除
	void deleteBrand(String id);

	//回显
	BrandInfo toUpdateBrand(String id);

	//修改
	void updateBrand(BrandInfo brandInfo);

}
