package pers.zhangdi.blog.service;

import pers.zhangdi.blog.vo.Admin;

public abstract interface IAdminService
{
  public abstract Admin checkLogin(Admin paramAdmin)
    throws Exception;
}
