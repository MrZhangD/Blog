package pers.zhangdi.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.zhangdi.blog.dao.AboutMapper;
import pers.zhangdi.blog.service.IAboutService;
import pers.zhangdi.blog.vo.About;

@Service
public class AboutServiceimpl implements IAboutService{
	
	@Autowired
	private AboutMapper aboutmapper;
	
	public About select() throws Exception{
		return aboutmapper.doFind();
	}

	
	public boolean update(About about) throws Exception{
		return aboutmapper.doUpdate(about);
	}
}
