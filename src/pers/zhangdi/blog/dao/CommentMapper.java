package pers.zhangdi.blog.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pers.zhangdi.blog.vo.Comment;

@Repository
public interface CommentMapper {
	//添加评论
	public boolean doAdd(Comment comment)throws Exception;
	
	//删除评论
	public boolean doDelete(String id)throws Exception;
	
	//查询全部评论
	public List<Comment> doFindAll()throws Exception;
	
	//按照id查询评论
	public Comment doFindByid(String id)throws Exception;
	
	//按页查询评论并按照时间排序（一页10条评论）
	public List<Comment> doFindByPageAndOrderByTime(int page)throws Exception;
	
	//查询该条评论是否有父亲，（有则为父亲的id，无则为0）
	public String doFindPreByid(String id)throws Exception;
	
	//查询该条评论是否有儿子（有则为1，无则为0）
	public Integer doFindNextByid(String id)throws  Exception;
	
	//查询无父亲的评论并按时间排序，即第一条评论，不是回复的评论
	public List<Comment> doFindNoPreOrderByTime()throws Exception;

	//查询指定父亲id的评论并按照时间排序，即查询某一条评论下的全部回复信息
	public List<Comment> doFindByPreOrderByTime(String pre)throws Exception;
	
	//查询当天有多少条评论 ，为了生成新回复的id。
	public int doFindCountByTime(String time)throws Exception;
	
	//查询一共有多少条评论
	public int doFindCount()throws Exception;
}
