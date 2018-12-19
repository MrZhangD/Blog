package pers.zhangdi.blog.dao;

import org.springframework.stereotype.Repository;

import pers.zhangdi.blog.vo.Admin;

@Repository
public interface AdminMapper {
	//检查登录
	public abstract Admin checklogin(Admin admin) throws Exception;
}
