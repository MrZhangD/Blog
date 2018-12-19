package pers.zhangdi.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import pers.zhangdi.blog.dao.CommentMapper;
import pers.zhangdi.blog.service.ICommentService;
import pers.zhangdi.blog.vo.Comment;

@Service
public class CommentServiceimpl implements ICommentService{

	@Autowired
	private CommentMapper commentmapper;
	
	@Override
	public boolean insert(Comment comment) throws Exception {
		return commentmapper.doAdd(comment);
	}

	@Override
	public boolean delete(String id) throws Exception {
		return commentmapper.doDelete(id);
	}

	@Override
	public List<Comment> selectAll() throws Exception {
		return commentmapper.doFindAll();
	}

	@Override
	public Comment selectByid(String id) throws Exception {
		return commentmapper.doFindByid(id);
	}
	
	@Override
	public List<Comment> selectByPageAndOrderByTime(int page) throws Exception {
		return commentmapper.doFindByPageAndOrderByTime(page);
	}

	@Override
	public String selectPre(String id) throws Exception {
		return commentmapper.doFindPreByid(id);
	}

	@Override
	public Integer selectNext(String id) throws Exception {
		return commentmapper.doFindNextByid(id);
	}

	@Override
	public List<Comment> selectNoPreOrderByTime() throws Exception {
		return commentmapper.doFindNoPreOrderByTime();
	}

	@Override
	public List<Comment> selectByPreOrderByTime(String pre) throws Exception {
		return commentmapper.doFindByPreOrderByTime(pre);
	}

	@Override
	public int selectCountByTime(String time) throws Exception {
		return commentmapper.doFindCountByTime(time);
	}

	@Override
	public int selectCount() throws Exception {
		return commentmapper.doFindCount();
	}

}
