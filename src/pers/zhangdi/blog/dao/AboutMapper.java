package pers.zhangdi.blog.dao;

import org.springframework.stereotype.Repository;

import pers.zhangdi.blog.vo.About;

@Repository
public interface AboutMapper {
	//查询关于我的信息
	public abstract About doFind() throws Exception;
	//更新关于我的信息
	public abstract boolean doUpdate(About about) throws Exception;
}
