package com.fh.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.swing.JFrame;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import sun.misc.BASE64Encoder;

public class Test extends JFrame{

	private static final long serialVersionUID = -6601911870125779276L;
	
	public static void main(String[] args) throws IOException, TemplateException {
		
		Test test = new Test();
		
		test.setVisible(true);
		
		
		
		
		
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		dataMap.put("title", "标题");
		dataMap.put("date", "1111-11-11");
		dataMap.put("end", "ggh");
		dataMap.put("image",getImageStr("E:\\upload\\17440BBA8EB150000ba76.jpeg"));
		for (int i = 0; i < 10; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", "aaa" + i);
			map.put("content", i);
			list.add(map);
		}
		dataMap.put("list", list);
		// 新建配置对象
		Configuration configuration = new Configuration();
		// 设置默认编码
		configuration.setDefaultEncoding("UTF-8");
		// 设置模板所在路径
		configuration.setClassForTemplateLoading(Test.class, "/template");
		// 获取模板对象
		Template t = configuration.getTemplate("test-ee.xml", "UTF-8");
		//Template t = configuration.getTemplate("test-2.xml", "UTF-8");//微软模板
		// 创建文件对象
		File file = new File("D:/" + UUID.randomUUID().toString() + ".docx");
		// 新建文件输出流
		FileOutputStream fos = new FileOutputStream(file);
		// 新建写入器
		OutputStreamWriter osw = new OutputStreamWriter(fos, "UTF-8");
		// 把数据写入文件里
		t.process(dataMap, osw);
		//刷新缓冲区
		osw.flush();
		//关流
		osw.close();
		// 调用下载方法
		Test w = new Test();
		w.test();
		//删除垃圾文件
		file.delete();
		
	}
	
	//将图片转换成64位字节码
	public static String getImageStr(String image) 
	throws IOException {
	InputStream is = new FileInputStream(image);
	BASE64Encoder encoder = new BASE64Encoder();
		byte[] data = new byte[is.available()];
		is.read(data); is.close();
		return encoder.encode(data);
	}
	
	public void test() {
		Map<String, Object> data = new HashMap<String, Object>();
		FileOutputStream out = null;
		OutputStreamWriter osw = null;
		File file = null;
		try {
			Configuration configuration = new Configuration();
			configuration.setClassForTemplateLoading(this.getClass(), "/template");
			configuration.setDefaultEncoding("utf-8");
			Template template = configuration.getTemplate("111.ftl");
			file = new File("D:/" + UUID.randomUUID().toString() + ".docx");
			out = new FileOutputStream(file);
			osw = new OutputStreamWriter(out, "utf-8");
			template.process(data, osw);
			osw.flush();
			osw.close();
		} catch (TemplateException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			if (null != osw) {
				try {
					osw.close();
					osw = null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (null != out) {
				try {
					out.close();
					out = null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	/*public Test(){
		super();
		setTitle("额额额");
		setBounds(100, 100, 500, 375);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		final JLabel label = new JLabel();
		label.setText("备注:");
		getContentPane().add(label, BorderLayout.WEST);
		final JScrollPane scrollPane = new JScrollPane();
		getContentPane().add(scrollPane, BorderLayout.CENTER);
		JTextArea textArea = new JTextArea();
		textArea.addKeyListener(new KeyListener() {
			public void keyTyped(KeyEvent e) {
				String keyText = KeyEvent.getKeyText(e.getKeyCode());
				if(e.isActionKey()){
					System.out.println("您按下的动作键:'" + keyText + "'");
				}else{
					System.out.print("您按下的非动作键:'" + keyText + "'");
					
					int keyCode = e.getKeyCode();
					switch(keyCode){
						case KeyEvent.VK_CONTROL:
							System.out.println(",Ctrl键被按下");
							break;
						case KeyEvent.VK_ALT:
							System.out.println(",Alt键被按下");
							break;
						case KeyEvent.VK_SHIFT:
							System.out.println(",Shift键被按下");
							break;
					}
				}
			}
			public void keyReleased(KeyEvent e) {
				// TODO Auto-generated method stub
				
			}
			public void keyPressed(KeyEvent e) {
				// TODO Auto-generated method stub
				
			}
		});
	}*/
	
}
