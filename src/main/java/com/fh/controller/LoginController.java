package com.fh.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.entity.AreaInfo;
import com.fh.entity.LoginInfo;
import com.fh.service.LoginService;
import com.fh.util.FileUtil;
import com.fh.util.PageInfo;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@Controller
@RequestMapping("login")
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	//查询所有地区
	@RequestMapping("queryArea")
	@ResponseBody
	public List<AreaInfo> queryArea(){
		
		List<AreaInfo> areaList = loginService.queryArea();
		
		return areaList;
	}
	
	//登录
	@RequestMapping(value = "login", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(LoginInfo loginInfo, HttpServletRequest request){
		
		//通过用户名查询
		LoginInfo login = loginService.queryLoginByUserName(loginInfo.getUserName());
		
		if(login != null){
			
			if(loginInfo.getUserPwd().equals(login.getUserPwd())){
				
				request.getSession().getServletContext().setAttribute("loginInfo", login);
				
				login.setLoginTime(new Date());
				
				loginService.updateLogin(login);
				
				//获取登录时间
				Date loginTime = login.getLoginTime();
				
				//将登录时间存入login对象中
				login.setLoginTime(loginTime);
				
				//将存入的登录时间传到前台页面
				request.getSession().getServletContext().setAttribute("login", login);
				
				//判断点前登录是否为当天
				/*Date date = new Date();
				SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
				if(sim.format(date).equals(sim.format(loginInfo.getLoginTime()))){
					
					loginInfo.setCount(loginInfo.getCount() + 1);
					
				}else{
					
					loginInfo.setCount(1);
					
				}
				System.out.println(loginInfo.getCount());
				request.getSession().getServletContext().setAttribute("count", loginInfo.getCount());*/
				
				return "{\"success\":\"登录成功!\"}";
				
			}else{
				
				return "login1";
				
			}
			
		}else{
			
			return "login1";
			
		}
		
	}
	
	//跳转查询页面
	@RequestMapping("queryLogin")
	public String queryLogin(){
		return "login-list";
	}
	
	//分页查询
	@RequestMapping("pagingQueryLogin")
	@ResponseBody
	public PageInfo<LoginInfo> pagingQueryLogin(Integer cpage, Integer pageSize){
		
		PageInfo<LoginInfo> pageInfo = loginService.pagingQueryLogin(cpage, pageSize);
		return pageInfo;
	}
	
	//跳转新增页面
	@RequestMapping("saveLoginJsp")
	public String saveLoginJsp(){
		return "login-save";
	}
	
	//跳转登录页面
	@RequestMapping("login1")
	public String login1(){
		return "login1";
	}
	
	//新增
	@RequestMapping("saveLogin")
	public String saveLogin(LoginInfo loginInfo){
		
		loginService.saveLogin(loginInfo);
		
		return "redirect:login1";
		
	}
	
	//删除
	@RequestMapping("deleteLogin")
	public String deleteLogin(String id){
		
		loginService.deleteLogin(id);
		
		return "redirect:queryLogin";
	}
	
	//回显
	@RequestMapping("toUpdateLogin")
	public String toUpdateLogin(LoginInfo loginInfo, String id, Model model){
		
		loginInfo = loginService.toUpdateLogin(id);
		
		model.addAttribute("loginInfo", loginInfo);
		
		return "login-toUpdate";
	}
	
	//修改
	@RequestMapping("updateLogin")
	public String updateLogin(LoginInfo loginInfo){
		
		loginService.updateLogin(loginInfo);
		
		return "redirect:queryLogin";
	}
	
	//导出Excel
	@RequestMapping("importExcel")
	public void importExcel(String ids, HttpServletResponse response, LoginInfo loginInfo){
		
		//根据id
		String[] arr = ids.split(",");
		List<LoginInfo> loginInfoList = new ArrayList<LoginInfo>();
		for (int i = 1; i < arr.length; i++) {
			loginInfo = loginService.toUpdateLogin(arr[i]);
			loginInfoList.add(loginInfo);
		}
		//查询所有信息
		/*List<LoginInfo> loginInfoList = loginService.queryLogin();*/
		
		//创建workbook
		XSSFWorkbook workbook = new XSSFWorkbook();
		//创建sheet
		XSSFSheet sheet = workbook.createSheet();
		//创建行row
		XSSFRow row = sheet.createRow(0);
		//创建第1个单元格
		XSSFCell cell1 = row.createCell(0);
		cell1.setCellValue("用户名");
		//创建第2个单元格
		XSSFCell cell2 = row.createCell(1);
		cell2.setCellValue("真实姓名");
		//创建第3个单元格
		XSSFCell cell3 = row.createCell(2);
		cell3.setCellValue("登陆时间");
		
		for (int i = 0; i < loginInfoList.size(); i++) {
			
			//创建行第二row2
			XSSFRow row2 = sheet.createRow(i + 1);
			//创建第1个单元格
			XSSFCell cell4 = row2.createCell(0);
			cell4.setCellValue(loginInfoList.get(i).getUserName());
			//创建第2个单元格
			XSSFCell cell5 = row2.createCell(1);
			cell5.setCellValue(loginInfoList.get(i).getRealName());
			//创建第3个单元格
			SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			XSSFCell cell6 = row2.createCell(2);
			cell6.setCellValue(sim.format(loginInfoList.get(i).getLoginTime()));
			
		}
		
		FileUtil.excelDownload(workbook, response);
	}
	
	//导出xml
	@RequestMapping("importXml")
	public void importXml(String ids, HttpServletResponse response, LoginInfo loginInfo){
		
		//根据id查询用户信息
		String[] arr = ids.split(",");
		List<LoginInfo> loginList = new ArrayList<LoginInfo>();
		for (int i = 1; i < arr.length; i++) {
			loginInfo = loginService.toUpdateLogin(arr[i]);
			loginList.add(loginInfo);
		}
		//创建document
		org.dom4j.Document document = DocumentHelper.createDocument();
		//创建根元素
		org.dom4j.Element loginListElement = document.addElement("loginList");
		for (int i = 0; i < loginList.size(); i++) {
			
			//创建子元素
			org.dom4j.Element loginInfoElement = loginListElement.addElement("loginInfo");
			//给对象添加id属性
			loginInfoElement.addAttribute("id", loginList.get(i).getId());
			//用户名
			org.dom4j.Element userNameElement = loginInfoElement.addElement("userName");
			userNameElement.addText(loginList.get(i).getUserName());
			//真实姓名
			org.dom4j.Element realNameElement = loginInfoElement.addElement("realName");
			realNameElement.addText(loginList.get(i).getRealName());
			//登陆时间
			SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			org.dom4j.Element loginTimeElement = loginInfoElement.addElement("loginTime");
			loginTimeElement.addText(sim.format(loginList.get(i).getLoginTime()));
			
		}
		FileUtil.xmlDownload(document, response);
		
	}
	
	//导出pdf
	@RequestMapping("importPdf")
	public void importPdf(HttpServletResponse response, String ids, LoginInfo loginInfo) throws DocumentException, IOException, com.itextpdf.text.DocumentException {
		// 定义一个字节数组
		ByteArrayOutputStream byffer = new ByteArrayOutputStream();
		// 数据库数据集合
		String[] arr = ids.split(",");
		List<LoginInfo> loginList = new ArrayList<LoginInfo>();
		for (int i = 1; i < arr.length; i++) {
			loginInfo = loginService.toUpdateLogin(arr[i]);
			loginList.add(loginInfo);
		}
		// 创建字体
		// 设置为中文 STSong-Light是宋体 不嵌入
		BaseFont createFont = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
		/*
		 * 设置内容字体
		 * Font.PLAIN（普通） Font.BOLD（加粗） Font.ITALIC（斜体） Font.BOLD+
		 * Font.ITALIC（粗斜体） 10是字体大小
		 */
		Font keyfont = new Font(createFont, 10, Font.BOLD);
		// 创建文本对象
		Document document = new Document(PageSize.A4);
		// 设置页面大小 a4纸
		document.setPageSize(PageSize.A4);
		// 创建pdf
		PdfWriter.getInstance(document, byffer);
		// 打开文档
		document.open();
		// 创建表头
		String[] head = { "编号", "用户名", "密码", "真实姓名", "登录时间"};
		// 创建书写器 同时设置列的数量
		PdfPTable table = FileUtil.createTable(head.length);
		//标题字体
		Font headfont = new Font(createFont,25,Font.BOLD);
		//设置颜色
		headfont.setColor(BaseColor.RED);
		//设置PDF表格标题
		PdfPCell cellTou = FileUtil.createHeadline("用户资料", headfont);
		//设置段落之间的距离
		cellTou.setExtraParagraphSpace(20);
		table.addCell(cellTou);
		// 将表头添加到pdf文件中
		for (int i = 0; i < head.length; i++) {
			table.addCell(FileUtil.createCell(head[i], keyfont, Element.ALIGN_CENTER));
		}
		//添加内容到pdf文件中
		for (int i = 0; i < loginList.size(); i++) {
			table.addCell(FileUtil.createCell(loginList.get(i).getId(), keyfont, Element.ALIGN_CENTER));
			table.addCell(FileUtil.createCell(loginList.get(i).getUserName(), keyfont, Element.ALIGN_CENTER));
			table.addCell(FileUtil.createCell(loginList.get(i).getUserPwd(), keyfont, Element.ALIGN_CENTER));
			table.addCell(FileUtil.createCell(loginList.get(i).getRealName(), keyfont, Element.ALIGN_CENTER));
			SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
			table.addCell(FileUtil.createCell(String.valueOf(sim.format(loginList.get(i).getLoginTime())), keyfont, Element.ALIGN_CENTER));
		}
		document.add(table);
		document.close();
		FileUtil.pdfDownload(response, byffer);
	}
	
	//跳转主页面
	@RequestMapping("mainJsp")
	public String mainJsp(){
		return "main";
	}
	
	//跳转上页面
	@RequestMapping("topJsp")
	public String topJsp(){
		return "top";
	}
	
	//跳转中页面
	@RequestMapping("centerJsp")
	public String centerJsp(){
		return "center";
	}
	
	//跳转中下页面
	@RequestMapping("centerBottomJsp")
	public String centerBottomJsp(){
		return "centerBottom";
	}
	
	//跳转商品页面
	@RequestMapping("waresJsp")
	public String waresJsp(){
		return "wares";
	}
	
	//跳转地区页面
	@RequestMapping("areaJsp")
	public String areaJsp(){
		return "areaZtree";
	}
	
}
