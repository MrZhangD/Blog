package pers.zhangdi.blog.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.zhangdi.blog.dao.ArticleMapper;
import pers.zhangdi.blog.service.IArticleService;
import pers.zhangdi.blog.vo.Article;

@Service
public class ArticleServiceimpl implements IArticleService {
	@Autowired
	private ArticleMapper articlemapper;
		
	static Logger log = Logger.getLogger(ArticleServiceimpl.class.getName());
	//插入文章
	public boolean insert(Article article) throws Exception{
		return articlemapper.doAdd(article);
	}
  
	//删除文章
	public boolean delete(String id)throws Exception{
		return articlemapper.doDelete(id);
	}
  
	//修改文章
	public boolean update(Article article) throws Exception{
		return articlemapper.doUpdate(article);
	}  
	
	//根据id查询文章
	public Article selectById(String id) throws Exception{
		return articlemapper.doFindById(id);
	}  
	
	//根据title查询文章
	public Article selectByTitle(String title) throws Exception{
		return articlemapper.doFindByTitle(title);
	}  
	
	//根据时间查询文章
	public List<Article> selectByTime(String time) throws Exception{
		return articlemapper.doFindByTime(time);
	}
  
	//根据文章类型查询文章
	public List<Article> selectBySubject(String subject) throws Exception{
		return articlemapper.doFindBySubject(subject);
	}
	
	//查询全部
	public List<Article> selectAll() throws Exception{
		return articlemapper.doFindAll();
	}
  
	//按照时间查询
	public List<Article> selectAllOrderByTime() throws Exception{
		return articlemapper.doFindAllOrderByTime();
	}
  
	//根据时间顺序查询文章并且分页查询（一页2条）
	public List<Article> selectOrderByTimeAndByPage(int page) throws Exception {
		return articlemapper.doFindOrderByTimeAndByPage(page);
	}
	
	//按照阅读量查询
	public List<Article> selectAllOrderByRead() throws Exception{
		return articlemapper.doFindAllOrderByRead();
	}
	
	//按照点赞量查询
	public List<Article> selectAllOrderByLike() throws Exception{
		return articlemapper.doFindAllOrderByLike();
	}
  
	//当前文章的前后篇
	public List<Article> selectIds(String id) throws Exception{
		return articlemapper.doFindIds(id);
	}
  
	//关键字查询
	public List<Article> selectLikeKeyword(String keyword) throws Exception{
		return articlemapper.doFindLikeKeyword(keyword);
	}
  
	//根据题目和文章类型两者查询文章
	public List<Article> selectLikeSome(String title, String subject) throws Exception{
		return articlemapper.doFindLikeSome(title, subject);
	}
}
