package pers.zhangdi.blog.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pers.zhangdi.blog.service.impl.AdminServiceimpl;
import pers.zhangdi.blog.vo.Admin;

public class AdminTest {
	public static void main(String[] args) throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		AdminServiceimpl asl = context.getBean("adminServiceimpl" , AdminServiceimpl.class);
		
		Admin admin = new Admin("admin","admin");
		System.out.println(asl.checkLogin(admin));
	}
}
