package pers.zhangdi.blog.service;

import java.util.List;

import pers.zhangdi.blog.vo.Comment;

public interface ICommentService {
	//增
	public boolean insert(Comment comment)throws Exception;
	
	//删
	public boolean delete(String id)throws Exception;
	
	//查全部
	public List<Comment> selectAll()throws Exception;
	
	//按照id查询
	public Comment selectByid(String id)throws Exception;
	
	//按页查询评论并按照时间排序（一页10条评论）
	public List<Comment> selectByPageAndOrderByTime(int page)throws Exception;
	
	//查询该条评论是否有父亲，（有则为父亲的id，无则为0）
	public String selectPre(String id)throws Exception;
	
	//查询该条评论是否有儿子（有则为1，无则为0）
	public Integer selectNext(String id)throws Exception;
	
	//查询无父亲的评论并按时间排序，即第一条评论，不是回复的评论
	public List<Comment> selectNoPreOrderByTime()throws Exception;

	//查询指定父亲id的评论并按照时间排序，即查询某一条评论下的全部回复信息
	public List<Comment> selectByPreOrderByTime(String pre)throws Exception;
	
	//查询当天有多少条评论 ，为了生成新回复的id。
	public int selectCountByTime(String time)throws Exception;
	
	//查询一共有多少条评论家回复
	public int selectCount()throws Exception;
}
