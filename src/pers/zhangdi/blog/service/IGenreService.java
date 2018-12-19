package pers.zhangdi.blog.service;

import java.util.List;

public abstract interface IGenreService
{
  public abstract List<String> selectGenre(String subject)
    throws Exception;
  
  public abstract String selectSubject(String genre)
    throws Exception;
  
  public abstract String selectId(String genre)
    throws Exception;
}
