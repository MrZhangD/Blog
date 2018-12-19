package pers.zhangdi.blog.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface GenreMapper {
	//查询某个Subject大类下的小类
	public abstract List<String> doFindGenre(String subject) throws Exception;
			  
	//查询该小类属于哪个大类Subject
	public abstract String doFindSubject(String genre) throws Exception;
	
	//查询该小类的大类id
	public abstract String doFindId(String genre) throws Exception;
}
