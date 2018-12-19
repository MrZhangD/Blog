package pers.zhangdi.blog.service;

import pers.zhangdi.blog.vo.About;

public abstract interface IAboutService
{
  public abstract About select()
    throws Exception;
  
  public abstract boolean update(About about)
    throws Exception;
}
