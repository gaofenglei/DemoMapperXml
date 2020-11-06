package com.fh.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fh.entity.AreaInfo;
import com.fh.entity.BrandInfo;
import com.fh.entity.ProductInfo;
import com.fh.service.ProductService;
import com.fh.util.PageInfo;

@Controller
@RequestMapping("product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	//跳转查询页面
	@RequestMapping("queryProduct")
	public String queryProduct(){
		return "product-list";
	}
	
	//分页查询
	@RequestMapping("pagingQueryProduct")
	@ResponseBody
	public PageInfo<ProductInfo> pagingQueryProduct(Integer cpage, Integer pageSize){
		
		PageInfo<ProductInfo> pageInfo = productService.pagingQueryProduct(cpage, pageSize);
		
		return pageInfo;
	}
	
	/**
	 * 图片上传
	 * @return
	 */
	@RequestMapping("uploadFile")
	@ResponseBody
	public Map<String, Object> uploadFile(MultipartFile myfile)
            throws IllegalStateException, IOException {
        // 原始名称
        String oldFileName = myfile.getOriginalFilename(); // 获取上传文件的原名
        // System.out.println(oldFileName);
        // 存储图片的虚拟本地路径（这里需要配置tomcat的web模块路径，双击猫进行配置）
        String saveFilePath = "D://picture";
        // 上传图片
        if (myfile != null && oldFileName != null && oldFileName.length() > 0) {
            // 新的图片名称
            String newFileName = UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
            // 新图片
            File newFile = new File(saveFilePath + "\\" + newFileName);
            // 将内存中的数据写入磁盘
            myfile.transferTo(newFile);
            // 将新图片名称返回到前端
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("success", "成功啦");
            map.put("url", newFileName);
            return map;
        } else {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("error", "图片不合法");
            return map;
        }
    }
	
	/**
	 * 品牌查询
	 */
	@RequestMapping("showBrand")
	@ResponseBody
	public List<BrandInfo> showBrand(){
		List<BrandInfo> brandlist = productService.showBrand();
		return brandlist;
	}
	
	@RequestMapping("toUploadPage")
	public String toUploadPage(){
		
		return "/login/upload";
	}
	
	//跳转新增页面
	@RequestMapping("saveProductJsp")
	public String saveProductJsp(){
		
		return "product-save";
	}
	
	//新增
	@RequestMapping("saveProduct")
	public String saveProduct(ProductInfo productInfo, String url, String old){
		
		if(productInfo.getId() != null && !"".equals(productInfo.getId())){
			if(!"".equals(old)){
				//删除旧图片
				File oldFile = new File("D://picture/" + old);
				if(oldFile.exists()){
					oldFile.delete();
				}
			}
			productInfo.setMainImagePath(url);
			productService.updateProduct(productInfo);
			return "redirect:queryProduct";
		}else{
			productInfo.setMainImagePath(url);
			productService.saveProduct(productInfo);
			return "redirect:queryProduct";
		}
	}
	
	//删除
	@RequestMapping("deleteProduct")
	public String deleteProduct(String id){
		
		productService.deleteProduct(id);
		
		return "redirect:queryProduct";
	}
	
	//回显
	@RequestMapping("toUpdateProduct")
	public String toUpdateProduct(ProductInfo productInfo, String id, Model model){
		
		productInfo = productService.toUpdateProduct(id);
		
		model.addAttribute("productInfo",productInfo);
		
		return "product-toUpdate";
	}
	
	//修改
	@RequestMapping("updateProduct")
	public String updateProduct(ProductInfo productInfo){
		
		productService.updateProduct(productInfo);
		
		return "redirect:queryProduct";
	}
	
	//通过pid查询地区
	@RequestMapping("getAllAreaByPid")
	@ResponseBody
	public List<AreaInfo> getAllAreaByPid(Integer pid){
		
		List<AreaInfo> areaList = productService.getAllAreaByPid(pid);
		
		return areaList;
		
	}
	
}
