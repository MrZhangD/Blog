package pers.zhangdi.blog.test;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pers.zhangdi.blog.service.impl.ArticleServiceimpl;
import pers.zhangdi.blog.vo.Article;

public class ArticleTest{
	static Logger log = Logger.getLogger(ArticleTest.class.getName());
	public static void main(String[] args) throws Exception {
//		IArticleService ias = new ArticleServiceimpl();
//		List<Article> list =  ias.selectIds("20180530001");
//		
//		for(Article a : list) {
//			System.out.println(a.getId());
//		}
		
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		log.info("开始通过Spring创建工具类——ArticleServiceimpl");
		ArticleServiceimpl asl = context.getBean("articleServiceimpl" , ArticleServiceimpl.class);
		log.info("已经创建好ArticleServiceimpl——asl");
//插入
//		Article a = new Article("11", "22", "33", "44", "55", "66", 2, 0, "11");
//		
//		System.out.println(asl.insert(a));
		
//查询全部		
//		log.info("开始通过asl查询全部文章...");
//		List<Article> list =  asl.selectAll();
//		log.info("文章查询完毕...准备罗列出文章id");
//		for(Article a : list) {
//			System.out.println(a.getId());
//		}
//		log.info("文章罗列完成...此次查询过程结束...");
//删除文章
//		System.out.println(asl.delete("11"));
		
//根据id查询文章
//		System.out.println(asl.selectById("11").toString());
		
//根据title查询文章
//		System.out.println(asl.selectByTitle("1").toString());
		
//x修改文章
//		Article a = asl.selectById("11");
//		a.setTime("11111");
//		System.out.println(asl.update(a));
		
//根据时间查询文章
//		List<Article> list = new ArrayList<Article>();
//		list = asl.selectByTime("87152485284");
//		System.out.println(list.get(0).toString());
		
//根据时间顺序查询文章并且分页查询（一页2条）
		log.info("开始通过asl查询全部文章...");
		int page = 4;
		int begin = (page-1)*2;
		List<Article> list =  asl.selectOrderByTimeAndByPage(begin);
		log.info("文章查询完毕...准备罗列出文章id");
		for(Article a : list) {
			System.out.println(a.getId());
		}
		log.info("文章罗列完成...此次查询过程结束...");
		
//根据文章类型
//		List<Article> list = new ArrayList<Article>();
//		list = asl.selectBySubject("学会欣赏");
//		for(Article a : list) {
//			System.out.println(a.getId());
//		}
		

//		List<Article> list = new ArrayList<Article>();
		//按照时间顺序查询文章	
//		list = asl.selectAllOrderByTime();
		//按照阅读量查询文章
//		list = asl.selectAllOrderByRead();
		//按照点赞量
//		list = asl.selectAllOrderByLike();
		//前后篇
//		list = asl.selectIds("20180610001");
		//根据题目关键字或文章内容的关键字查询文章
//		list = asl.selectLikeKeyword("心");
		//根据题目和文章类型两者查询文章
//		list = asl.selectLikeSome("人", "");
//		for(Article a : list) {
//			System.out.println(a.getId());
//		}
		
		
	}
}
