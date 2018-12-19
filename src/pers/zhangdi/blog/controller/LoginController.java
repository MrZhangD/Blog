package pers.zhangdi.blog.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pers.zhangdi.blog.service.impl.AdminServiceimpl;
import pers.zhangdi.blog.vo.Admin;

@Controller
public class LoginController {

	@Autowired
	private AdminServiceimpl asl;
	
	@RequestMapping("/login.do")
	public String toLogin() {
		return "login";
	}
	
	@RequestMapping("/check.do")
	public String check(Admin admin,Model model,HttpSession session) {
		boolean flag = false;
		try{
			if(asl.checkLogin(admin) != null)
		    	  flag = true;
		}catch (Exception e){
			e.printStackTrace();
		}
		
		if (flag){
			session.setAttribute("admin", admin);
			return "redirect:/backstage.do";
		}else{
			return "redirect:/login.do";
		}
	}
}
