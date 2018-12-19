package pers.zhangdi.blog.test;

import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pers.zhangdi.blog.service.impl.CommentServiceimpl;
import pers.zhangdi.blog.vo.Comment;

public class test {
	public static void main(String[] args) throws Exception {
		/*Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(date);
		System.out.println(time);
		
		String id = "";
		id = id + new SimpleDateFormat("yyyyMMdd").format(date);
		*/
	
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		CommentServiceimpl csl = context.getBean("commentServiceimpl",CommentServiceimpl.class);
		
/*		int count = csl.selectCountByTime("20181127");
		System.out.println(count);*/
		
		Comment c = csl.selectByid("201812080002");
		
		System.out.println(c.toString());
		//java中使用JSON对象测试
		JSONObject obj = new JSONObject(c);	//将Java对象转换成JSON对象
		System.out.println(obj.getString("author"));
		System.out.println(obj.get("email"));
	}
}
