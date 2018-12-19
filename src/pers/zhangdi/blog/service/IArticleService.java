package pers.zhangdi.blog.service;

import java.util.List;
import pers.zhangdi.blog.vo.Article;

public abstract interface IArticleService{
  public abstract boolean insert(Article paramArticle)
    throws Exception;
  
  public abstract boolean delete(String paramString)
    throws Exception;
  
  public abstract boolean update(Article paramArticle)
    throws Exception;
  
  public abstract Article selectById(String paramString)
    throws Exception;
  
  public abstract Article selectByTitle(String paramString)
    throws Exception;
  
  public abstract List<Article> selectByTime(String paramString)
    throws Exception;
  
  public abstract List<Article> selectBySubject(String paramString)
    throws Exception;
  
  public abstract List<Article> selectAll()
    throws Exception;
  
  public abstract List<Article> selectAllOrderByTime()
    throws Exception;
  
  public abstract List<Article> selectOrderByTimeAndByPage(int page)
  	throws Exception;
  
  public abstract List<Article> selectAllOrderByRead()
    throws Exception;
  
  public abstract List<Article> selectAllOrderByLike()
    throws Exception;
  
  public abstract List<Article> selectIds(String paramString)
    throws Exception;
  
  public abstract List<Article> selectLikeKeyword(String paramString)
    throws Exception;
  
  public abstract List<Article> selectLikeSome(String paramString1, String paramString2)
    throws Exception;
}
