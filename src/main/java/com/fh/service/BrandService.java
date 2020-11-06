package com.fh.service;

import com.fh.entity.BrandInfo;
import com.fh.util.PageInfo;

public interface BrandService {

	//分页
	PageInfo<BrandInfo> pagingQueryBrand(Integer cpage, Integer pageSize);

	//新增
	void saveBrand(BrandInfo brandInfo);

	//删除
	void deleteBrand(String id);

	//回显
	BrandInfo toUpdateBrand(String id);

	//修改
	void updateBrand(BrandInfo brandInfo);

}
