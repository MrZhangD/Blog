package pers.zhangdi.blog.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pers.zhangdi.blog.service.impl.GenreServiceimpl;

public class GenreTest {
	public static void main(String[] args) throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		GenreServiceimpl gsl = context.getBean("genreServiceimpl" , GenreServiceimpl.class);
		
//		List<String> list = gsl.selectGenre("学无止境");
//		for(String genre : list) {
//			System.out.println(genre);
//		}
		
//		System.out.println(gsl.selectSubject("学会欣赏"));
		System.out.println(gsl.selectId("学会欣赏"));
	}
}
