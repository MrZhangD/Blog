package pers.zhangdi.blog.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pers.zhangdi.blog.vo.Article;

@Repository
public interface ArticleMapper{
	//添加文章
	public abstract boolean doAdd(Article article) throws Exception;
	
	//删除文章（根据id）
	public abstract boolean doDelete(String id) throws Exception;
  
	//更新文章
	public abstract boolean doUpdate(Article article) throws Exception;
  
	//根据题目查找文章
	public abstract Article doFindByTitle(String title) throws Exception;
  
	//根据id查找文章
	public abstract Article doFindById(String id) throws Exception;
  
	//根据时间查找文章
	public abstract List<Article> doFindByTime(String time) throws Exception;
  
	//根据类型查找文章
	public abstract List<Article> doFindBySubject(String subject) throws Exception;
  
	//查找所有的文章
	public abstract List<Article> doFindAll() throws Exception;
  
	//按时间顺序查找文章
	public abstract List<Article> doFindAllOrderByTime() throws Exception;
  
	//根据时间顺序查询文章并且分页查询（一页2条）
	public abstract List<Article> doFindOrderByTimeAndByPage(int page) throws Exception;
	
	//按照阅读量查找文章
	public abstract List<Article> doFindAllOrderByRead() throws Exception;
  
	//按照点赞量查询查询文章
	public abstract List<Article> doFindAllOrderByLike() throws Exception;
  
	//查询该篇文章的上一篇和下一篇
	public abstract List<Article> doFindIds(String id) throws Exception;
  
	//根据题目关键字或文章内容的关键字查询文章
	public abstract List<Article> doFindLikeKeyword(String keyword) throws Exception;
  
	//根据题目和文章类型两者查询文章
	public abstract List<Article> doFindLikeSome(String title, String subject) throws Exception;
}
