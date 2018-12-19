package pers.zhangdi.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pers.zhangdi.blog.service.impl.AboutServiceimpl;
import pers.zhangdi.blog.vo.About;

@Controller
public class AboutController {
	
	@Autowired
	private AboutServiceimpl asl;
	
	@RequestMapping("/about.do")
	public String toAbout(Model model) {
		About about = null;
		try{
		   about = new About();
		   about = asl.select();
		   String abblog = about.getAbblog();
		   about.setAbblog(abblog.replaceAll("[\\n]", "<br>"));
		}
		catch (Exception e){
			e.printStackTrace();
		}
		model.addAttribute("about", about);
		return "about";
	}
}
