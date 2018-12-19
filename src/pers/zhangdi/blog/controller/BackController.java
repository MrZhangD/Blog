package pers.zhangdi.blog.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pers.zhangdi.blog.service.impl.AboutServiceimpl;
import pers.zhangdi.blog.service.impl.ArticleServiceimpl;
import pers.zhangdi.blog.vo.About;
import pers.zhangdi.blog.vo.Article;

@Controller
public class BackController {

	@Autowired
	private ArticleServiceimpl arsl;
	
	@Autowired
	private AboutServiceimpl absl;
	
	private About about = null;
	
	@RequestMapping("/backstage.do")
	public String toBack(Model model) {
 		try {
			about = absl.select();
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("about",about);
		return "backstage";
	}
	
	@RequestMapping("/articlelist.do")
	public String toArticleList(Model model,HttpServletRequest request) {
		List<Article> lists = new ArrayList();
		String title = request.getParameter("title");
		String subject = request.getParameter("subject");
		if(title!=null||subject!=null) {
			try{
				lists = arsl.selectLikeSome(title, subject);
				about = absl.select();
			}catch (Exception e){
				e.printStackTrace();
			}
			model.addAttribute("title", title);
			model.addAttribute("subject",subject);
		}else {
			String id = request.getParameter("id");
			try{
				if (id == null) {
					lists = arsl.selectAllOrderByTime();
				} else if ("read".equals(id)) {
					lists = arsl.selectAllOrderByRead();
				} else if ("like".equals(id)) {
					lists = arsl.selectAllOrderByLike();
				}
				about = absl.select();
			}catch (Exception e){
				e.printStackTrace();
			}
		}
		
		model.addAttribute("lists",lists);
		model.addAttribute("about",about);
		return "articlelist";
	}
	
	@RequestMapping("/backsearch.do")
	public String toBackSearch(Model model , HttpServletRequest request) {
		String title = request.getParameter("search_title");
		String subject = request.getParameter("search_subject");
		model.addAttribute("title",title);
		model.addAttribute("subject",subject);
		return "redirect:/articlelist.do";
	}
	
	@RequestMapping("/update.do")
	public String toUpdate(Model model , HttpServletRequest request) {
		String id = request.getParameter("id");
	    Article article = new Article();
	    
	    try{
	      article = arsl.selectById(id);
	      about = absl.select();
	    }catch (Exception e){
	      e.printStackTrace();
	    }
	    
	    model.addAttribute("article",article);
	    model.addAttribute("about",about);
	    return "update";
	}
	
	@RequestMapping("/keep_update.do")
	public String toKeep_update(Model model , HttpServletRequest request) throws FileNotFoundException, IOException, ServletException {
		String preurl = request.getHeader("REFERER");
	    String imgurl = null;
	    if (request.getPart("img").getHeader("Content-Disposition").length() > 35){
	    	String savePath = request.getServletContext().getRealPath("/images/upload");
	    	File file = new File(savePath);
	    	if ((!file.exists()) && (!file.isDirectory())) {
	    		file.mkdir();
	    	}
	    	Part part = request.getPart("img");
	    	String header = part.getHeader("Content-Disposition");
	    	String filename = header.substring(header.indexOf("filename=\"") + 10, header.lastIndexOf("\""));
	      
	    	InputStream in = part.getInputStream();
	      
	    	FileOutputStream out = new FileOutputStream(savePath + "\\" + filename);
	      
	    	byte[] buffer = new byte['?'];
	    	
	    	int len = 0;
	    	while ((len = in.read(buffer)) > 0) {
	    	  out.write(buffer, 0, len);
	    	}
	    	in.close();
	      
	    	out.close();
	    	imgurl = "images/upload/" + filename;
	    }else{
	      imgurl = request.getParameter("img_one");
	    }
	    
	    //个人信息修改保存
	    if (preurl.contains("info_set")){
	    	About about = new About();
	    	try{
	    		about.setName(request.getParameter("name"));
	    		about.setWork(request.getParameter("work"));
	    		about.setAbtext(request.getParameter("abtext"));
	    		about.setAbblog(request.getParameter("abblog"));
	    		about.setImg(imgurl);
	    		about.setContent(request.getParameter("editorValue"));
	    		absl.update(about);
	    	}catch (Exception e){
	    		e.printStackTrace();
	    	}
	    	return "redirect:/info_set.do";
	    }
	    //文章修改保存
	    else{
	    	Article article = new Article();
	    	try{
	    		article.setTitle(request.getParameter("title"));
		        article.setId(request.getParameter("id"));
		        article.setIntroduce(request.getParameter("introduce"));
		        article.setContent(request.getParameter("editorValue"));
		        article.setSubject(request.getParameter("subject"));
		        article.setTime(request.getParameter("time"));
		        article.setRead(Integer.valueOf(Integer.parseInt(request.getParameter("read"))));
		        article.setLike(Integer.valueOf(Integer.parseInt(request.getParameter("like"))));
		        article.setImg(imgurl);
		        arsl.update(article);
	    	}catch (Exception e){
	    		e.printStackTrace();
	    	}
	    	//这相当于带有参数的重定向
	    	model.addAttribute("id",request.getParameter("id"));
	    	return "redirect:/update.do";
	    }
	}
	
	@RequestMapping("/del.do")
	public String toDel(Model model , HttpServletRequest request) {
		String id = request.getParameter("id");
		
		try{
			arsl.delete(id);
		}catch (Exception e){
			e.printStackTrace();
		}
		
		return "redirect:/articlelist.do";
	}
	
	@RequestMapping("/add.do")
	public String toAdd(Model model) {
		try {
			about = absl.select();
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("about",about);
		return "add";
	}
	
	//添加文章？？？？？？？？？？？
	@RequestMapping("/keep_add.do")
	public String toKeep_add(Model model,HttpServletRequest request) throws IOException, ServletException {
		Article article = new Article();
	    Date date = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String time = sdf.format(date);
	    String idp = time.substring(0, 10).replaceAll("-", "");
	    
	    String savePath = request.getServletContext().getRealPath("/images/upload");
	    File file = new File(savePath);
	    if ((!file.exists()) && (!file.isDirectory())) {
	      file.mkdir();
	    }
	    Part part = request.getPart("img");
	    String header = part.getHeader("Content-Disposition");
	    String filename = header.substring(header.indexOf("filename=\"") + 10, header.lastIndexOf("\""));
	    InputStream in = part.getInputStream();
	    
	    FileOutputStream out = new FileOutputStream(savePath + "\\" + filename);
	    
	    byte[] buffer = new byte['?'];
	    
	    int len = 0;
	    while ((len = in.read(buffer)) > 0) {
	      out.write(buffer, 0, len);
	    }
	    in.close();
	    
	    out.close();
	    try{
	    	article.setTitle(request.getParameter("title"));
	    	List<Article> lists = arsl.selectAllOrderByTime();
	    	
	    	if (((Article)lists.get(0)).getId().contains(idp)){
	    		String pre_id = ((Article)lists.get(0)).getId();
	    		String id = (Long.parseLong(pre_id) + 1) + "";
	    		article.setId(id);
	    	}else{
	    		String id = idp + "001";
	    		article.setId(id);
	    	}
	    	article.setIntroduce(request.getParameter("introduce"));
	    	article.setContent(request.getParameter("editorValue"));
	    	article.setSubject(request.getParameter("subject"));
	    	article.setTime(time);
	    	article.setRead(Integer.valueOf(0));
	    	article.setLike(Integer.valueOf(0));
	    	article.setImg("images/upload/" + filename);
	    	arsl.insert(article);
	    }catch (Exception e){
	      e.printStackTrace();
	    }
		
	    model.addAttribute("article",article);
	    return "redirect:/articlelist.do";
	}
	
	//个人信息
	@RequestMapping("/info_set.do")
	public String toInfo_set(Model model) {
		try{
			about = absl.select();
		}catch (Exception e){
			e.printStackTrace();
		}
		
		model.addAttribute("about", about);
		return "info_set";
	}
}
