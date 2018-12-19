package pers.zhangdi.blog.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pers.zhangdi.blog.service.impl.ArticleServiceimpl;
import pers.zhangdi.blog.service.impl.GenreServiceimpl;
import pers.zhangdi.blog.vo.Article;

@Controller
public class ArticleController {
	
	@Autowired
	private ArticleServiceimpl asl;
	
	@Autowired
	private GenreServiceimpl gsl;
	
	@RequestMapping("/index.do")
	public String toIndex(Model model) {
		List<Article> lists = new ArrayList<Article>();
	    List<Article> reads = new ArrayList<Article>();
	    List<Article> likes = new ArrayList<Article>();
	    
	    try {
			lists = asl.selectAllOrderByTime();
			reads = asl.selectAllOrderByRead().subList(0, 5);
		    likes = asl.selectAllOrderByLike().subList(0, 3);
		    //处理文章。将存好的带有标签的文章去除标签，用来展示部分内容
		    for (int i = 0; i < lists.size(); i++){
		    	String content = ((Article)lists.get(i)).getContent();
		        ((Article)lists.get(i)).setContent(content.replaceAll("<[.[^<]]*>", ""));
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    model.addAttribute("lists", lists);
	    model.addAttribute("reads", reads);
	    model.addAttribute("likes", likes);
		return "index";
	}
	
	@RequestMapping("/study.do")
	public String toStudy(Model model,HttpServletRequest request) {
		List<Article> lists = new ArrayList();
	    List<Article> reads = new ArrayList();
	    List<Article> likes = new ArrayList();
	    
	    try{
	    	if ((request.getParameter("id") == null) && (request.getParameter("subject") == null)) {
	    		lists = asl.selectBySubject("学无止境");
	    	} else if (("1".equals(request.getParameter("id"))) || ("心得笔记".equals(request.getParameter("subject")))) {
	    		lists = asl.selectBySubject("心得笔记");
	    	} else if (("2".equals(request.getParameter("id"))) || ("前端知识".equals(request.getParameter("subject")))) {
	    		lists = asl.selectBySubject("前端知识");
	    	} else if (("3".equals(request.getParameter("id"))) || ("后台研发".equals(request.getParameter("subject")))) {
	    		lists = asl.selectBySubject("后台研发");
	    	} else if (("4".equals(request.getParameter("id"))) || ("其他知识".equals(request.getParameter("subject")))) {
	    		lists = asl.selectBySubject("其他知识");
	    	}
	    	for (int i = 0; i < lists.size(); i++){
	    		String content = ((Article)lists.get(i)).getContent();
	    		((Article)lists.get(i)).setContent(content.replaceAll("<[.[^<]]*>", ""));
	    	}
	    	reads = asl.selectAllOrderByRead().subList(0, 5);
	    	likes = asl.selectAllOrderByLike().subList(0, 3);
	    }
	    catch (Exception e){
	      e.printStackTrace();
	    }
	    
	    model.addAttribute("lists", lists);
	    model.addAttribute("reads", reads);
	    model.addAttribute("likes", likes);
	    
	    return "study";
	}
	
	@RequestMapping("/life.do")
	public String toLife(Model model , HttpServletRequest request) {
	    List<Article> lists = new ArrayList<Article>();
	    List<Article> reads = new ArrayList<Article>();
	    List<Article> likes = new ArrayList<Article>();
	    try
	    {
	      if ((request.getParameter("id") == null) && (request.getParameter("subject") == null)) {
	        lists = asl.selectBySubject("生活点滴");
	      } else if (("1".equals(request.getParameter("id"))) || ("生活日记".equals(request.getParameter("subject")))) {
	        lists = asl.selectBySubject("生活日记");
	      } else if (("2".equals(request.getParameter("id"))) || ("学会欣赏".equals(request.getParameter("subject")))) {
	        lists = asl.selectBySubject("学会欣赏");
	      } else if (("3".equals(request.getParameter("id"))) || ("程序人生".equals(request.getParameter("subject")))) {
	        lists = asl.selectBySubject("程序人生");
	      }
	      for (int i = 0; i < lists.size(); i++)
	      {
	        String content = ((Article)lists.get(i)).getContent();
	        ((Article)lists.get(i)).setContent(content.replaceAll("<[.[^<]]*>", ""));
	      }
	      reads = asl.selectAllOrderByRead().subList(0, 5);
	      likes = asl.selectAllOrderByLike().subList(0, 3);
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	    }
	    
	    model.addAttribute("lists", lists);
	    model.addAttribute("reads", reads);
	    model.addAttribute("likes", likes);
	    
	    return "life";
	}
	
	@RequestMapping("/time.do")
	public String toTime(Model model,HttpServletRequest request) {
		int page_num = 0;	//总页数
		int info_num = 0;	//总数据
		int begin = 0;	//初始
		int page_size = 1;
		
		String page = request.getParameter("page");
		List<Article> lists = new ArrayList();
		try{
			info_num = asl.selectAll().size();
			if(info_num%10==0)
				page_num = info_num/10;
			else
				page_num = info_num/10+1;
			if(page==null)
				begin = 0;
			else
				begin = (Integer.parseInt(page)-1)*10;
			if(page_num>4)
				page_size = 3;
			else
				page_size = 1;
			
			lists = asl.selectOrderByTimeAndByPage(begin);
		}
		catch (Exception e){
			e.printStackTrace();
		}
		model.addAttribute("lists", lists);
		model.addAttribute("page",begin/10+1);
		model.addAttribute("page_num",page_num);
		model.addAttribute("info_num",info_num);
		model.addAttribute("page_size",page_size);
		return "time";
	}
	
	@RequestMapping("/search.do")
	public String toSearch(Model model , HttpServletRequest request) {
	
		List<Article> lists = new ArrayList();
	    String keyword = request.getParameter("keyword");
	    try{
	    	lists = asl.selectLikeKeyword(keyword);
	    	for (int i = 0; i < lists.size(); i++){
	    		String content = ((Article)lists.get(i)).getContent();
	    		((Article)lists.get(i)).setContent(content.replaceAll("<[.[^<]]*>", ""));
	    	}
	    }catch (Exception e){
	      e.printStackTrace();
	    }
	    
	    model.addAttribute("lists", lists);
		return "search";
	}
	
	@RequestMapping("/content.do")
	public String toContent(Model model , HttpServletRequest request) {
		
		String id = request.getParameter("id");
		
	    List<Article> reads = new ArrayList();
	    List<Article> likes = new ArrayList();
	    List<Article> ids = new ArrayList();
	    
	    Article article = null;
	    String subject = null;
	    
	    try{
	    	//修改改文章访问量
	    	article = asl.selectById(id);
	    	article.setRead(Integer.valueOf(article.getRead().intValue() + 1));
	    	asl.update(article);
	    	
	    	String content = article.getContent().replaceAll("[\\n]", "<br>");
	    	article.setContent(content);
	    	//查找前后篇
	    	ids = asl.selectIds(id);
	    	
	    	reads = asl.selectAllOrderByRead().subList(0, 5);
	    	likes = asl.selectAllOrderByLike().subList(0, 3);
	    	//查询该文章属于哪个大类
	    	subject = gsl.selectSubject(article.getSubject());
	    }catch (Exception e){
	      e.printStackTrace();
	    }
	    
	    if ((ids.size() == 1) && (Long.parseLong(((Article)ids.get(0)).getId()) > Long.parseLong(id))) {
	      ids.add(0, null);
	    }
	    
	    model.addAttribute("reads", reads);
	    model.addAttribute("likes", likes);
	    model.addAttribute("ids", ids);
	    model.addAttribute("article", article);
	    model.addAttribute("subject", subject);
		return "content";
	}
}
