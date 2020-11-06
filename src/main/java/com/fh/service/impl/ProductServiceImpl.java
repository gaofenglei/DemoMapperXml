package com.fh.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fh.dao.ProductMapper;
import com.fh.entity.AreaInfo;
import com.fh.entity.BrandInfo;
import com.fh.entity.ProductInfo;
import com.fh.service.ProductService;
import com.fh.util.PageInfo;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductMapper productDao;

	//分页查询
	public PageInfo<ProductInfo> pagingQueryProduct(Integer cpage, Integer pageSize) {
		
		PageInfo<ProductInfo> pageInfo = new PageInfo<ProductInfo>(cpage, pageSize);
		
		//求出总条数
		Integer totalCount = productDao.totalNumber();
		
		//分页
		List<ProductInfo> loginInfoList = productDao.pagingQueryProduct(pageInfo.getStart(), pageInfo.getPageSize());
		
		pageInfo.setTotalCount(totalCount);
		
		pageInfo.setDataList(loginInfoList);
		
		return pageInfo;
	}

	//新增
	public void saveProduct(ProductInfo productInfo) {
		productInfo.setCreateDate(new Date());
		productDao.saveProduct(productInfo);
	}

	//图片上传
	public Boolean uploadFile(MultipartFile file, String string) {
		
		return productDao.uploadFile(file, string);
		
	}

	//删除
	public void deleteProduct(String id) {
		productDao.deleteProduct(id);
	}

	//回显
	public ProductInfo toUpdateProduct(String id) {
		return productDao.toUpdateProduct(id);
	}

	//修改
	public void updateProduct(ProductInfo productInfo) {
		productDao.updateProduct(productInfo);
	}

	//通过pid查询地区
	@Override
	public List<AreaInfo> getAllAreaByPid(Integer pid) {
		return productDao.getAllAreaByPid(pid);
	}

	/**
	 * 品牌查询
	 */
	@Override
	public List<BrandInfo> showBrand() {
		return productDao.showBrand();
	}
	
}
