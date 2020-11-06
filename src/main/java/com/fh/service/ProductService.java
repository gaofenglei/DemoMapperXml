package com.fh.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fh.entity.AreaInfo;
import com.fh.entity.BrandInfo;
import com.fh.entity.ProductInfo;
import com.fh.util.PageInfo;

public interface ProductService {

	//分页查询
	PageInfo<ProductInfo> pagingQueryProduct(Integer cpage, Integer pageSize);

	//新增
	void saveProduct(ProductInfo productInfo);

	//图片上传
	Boolean uploadFile(MultipartFile file, String string);

	//删除
	void deleteProduct(String id);

	//回显
	ProductInfo toUpdateProduct(String id);

	//修改
	void updateProduct(ProductInfo productInfo);

	//通过pid查询地区
	List<AreaInfo> getAllAreaByPid(Integer pid);

	/**
	 * 品牌查询
	 */
	List<BrandInfo> showBrand();
	
}
