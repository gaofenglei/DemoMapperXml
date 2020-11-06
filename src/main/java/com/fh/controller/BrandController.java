package com.fh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.entity.BrandInfo;
import com.fh.service.BrandService;
import com.fh.util.PageInfo;

@Controller
@RequestMapping("brand")
public class BrandController {
	
	@Autowired
	private BrandService brandServive;
	
	//跳转查询页面
	@RequestMapping("queryBrand")
	public String queryBrand(){
		return "brand-list";
	}
	
	//分页
	@RequestMapping("pagingQueryBrand")
	@ResponseBody
	public PageInfo<BrandInfo> pagingQueryBrand(Integer cpage, Integer pageSize){
		
		PageInfo<BrandInfo> pageInfo = brandServive.pagingQueryBrand(cpage, pageSize);
		
		return pageInfo;
	}
	
	//跳转新增
	@RequestMapping("saveBrandJsp")
	public String saveBrandJsp(){
		
		return "brand-save";
	}
	
	//新增
	@RequestMapping("saveBrand")
	public String saveBrand(BrandInfo brandInfo){
		
		brandServive.saveBrand(brandInfo);
		
		return "redirect:queryBrand";
	}
	
	//删除
	@RequestMapping("deleteBrand")
	public String deleteBrand(String id){
		
		brandServive.deleteBrand(id);
		
		return "redirect:queryBrand";
	}
	
	//回显
	@RequestMapping("toUpdateBrand")
	public String toUpdateBrand(String id, Model model){
		
		BrandInfo brandInfo = brandServive.toUpdateBrand(id);
		
		model.addAttribute("brandInfo", brandInfo);
		
		return "brand-toUpdate";
	}
	
	//修改
	@RequestMapping("updateBrand")
	public String updateBrand(BrandInfo brandInfo){
		
		brandServive.updateBrand(brandInfo);
		
		return "redirect:queryBrand";
	}
	
}
