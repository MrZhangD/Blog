package pers.zhangdi.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.zhangdi.blog.dao.GenreMapper;
import pers.zhangdi.blog.service.IGenreService;

@Service
public class GenreServiceimpl implements IGenreService{
  
	@Autowired
	private GenreMapper genremapper;
	
	public List<String> selectGenre(String subject) throws Exception{
		return genremapper.doFindGenre(subject);
	}
  
	public String selectSubject(String genre) throws Exception{
		return genremapper.doFindSubject(genre);
	}
  
	public String selectId(String genre) throws Exception{
		return genremapper.doFindId(genre);
	}
}
