package pers.zhangdi.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.zhangdi.blog.dao.AdminMapper;
import pers.zhangdi.blog.service.IAdminService;
import pers.zhangdi.blog.vo.Admin;

@Service
public class AdminServiceimpl implements IAdminService{
  
	@Autowired
	private AdminMapper adminmapper;
	
	public Admin checkLogin(Admin admin) throws Exception{
		return adminmapper.checklogin(admin);
	}
}
