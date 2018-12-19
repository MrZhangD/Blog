package pers.zhangdi.blog.test;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pers.zhangdi.blog.service.impl.CommentServiceimpl;
import pers.zhangdi.blog.vo.Comment;

public class CommentTest {
	static Logger log = Logger.getLogger(CommentTest.class.getName());
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		CommentServiceimpl csl = context.getBean("commentServiceimpl",CommentServiceimpl.class);
		log.info("此时已经创建好评论表的工具类——CommentServiceimpl csl -------------------------------");
		
		/*List<Comment> list = null;
		try {
			list = csl.selectAll();
		} catch (Exception e) {
			log.error("【错误】：查询全部评论是出错 - csl.selectAll()!");
		}
		log.info("此时查询出全部的评论，并且将其展示出来----------------------------------");
		for(Comment c : list) {
			System.out.println(c.toString());
		}
		log.info("结果展示完毕--------------------------------------");*/
		
		//添加评论
		/*Comment c = new Comment("wang", "123@11.com", "2222", "test", "201811270005", "0", 0);
		try {
			csl.insert(c);
		} catch (Exception e) {
			log.error("【错误】：添加评论失败----");
			e.printStackTrace();
		}
		log.info("添加评论成功:-:" + c.toString());*/
		
		//删除评论
		/*try {
			csl.delete("201811270005");
		}catch (Exception e) {
			log.error("【错误】：删除失败！");
			e.printStackTrace();
		}
		log.info("【删除成功】：" + "删除id为‘201811270005’的评论！");*/
		
		//按页查询评论并按照时间排序（一页2条评论）
		/*List<Comment> list = null;
		int page = 4;
		int begin = 0;
		try {
			begin = 2*(page-1);
			list = csl.selectByPageAndOrderByTime(begin);
			if(list.isEmpty())
				throw new Exception("查询为空");
		}catch (Exception e) {
			log.error("【错误】：查询失败！！");
			e.printStackTrace();
		}
		
		log.info("【查询成功】：查询到第" + page + "页的数据");
		for(Comment c : list) {
			System.out.println(c.toString());
		}*/
		
		//查询该条评论是否有父亲，（有则为父亲的id，无则为0）
		/*String id = "201811270002";
		String pre = null;
		try {
			pre = csl.selectPre(id);
		} catch (Exception e) {
			log.error("【错误】：查询失败！");
			e.printStackTrace();
		}
		log.info("【查询成功】：id为"+id+"的父亲--");
		System.out.println("id为"+id+"的父亲为：" + pre);*/
		
		//查询该条评论是否有儿子（有则为1，无则为0）
		/*String id = "201811270001";
		try {
			System.out.println(csl.selectNext(id));
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		
		//查询无父亲的评论并按时间排序，即第一条评论，不是回复的评论
		/*List<Comment> list = null;
		try {
			list = csl.selectNoPreOrderByTime();
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(Comment c : list) {
			System.out.println(c.toString());
		}*/
		
		//查询指定父亲id的评论并按照时间排序，即查询某一条评论下的全部回复信息
		String pre = "201811250001";
		List<Comment> list = null;
		try {
			list = csl.selectByPreOrderByTime(pre);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(Comment c : list) {
			System.out.println(c.toString());
		}
	}
}
