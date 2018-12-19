package pers.zhangdi.blog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pers.zhangdi.blog.service.impl.AboutServiceimpl;
import pers.zhangdi.blog.service.impl.CommentServiceimpl;
import pers.zhangdi.blog.vo.About;
import pers.zhangdi.blog.vo.Comment;

@Controller
public class GbookController {
	
	@Autowired
	private AboutServiceimpl absl;
	
	@Autowired
	private CommentServiceimpl csl;
	
	private About about = null;
	
	//显示留言页面
	@RequestMapping("/gbook.do")
	public String toGbook(Model model) {
		List<Comment> lists = null;
		List<List> allReplys = new ArrayList<>();
		int count = 0;
		try {
			lists = csl.selectNoPreOrderByTime();
			about = absl.select();
			for(Comment c : lists) {
				//每一条评论下的全部回复
				List<Comment> replys = new ArrayList<>();
				replys.addAll(csl.selectByPreOrderByTime(c.getId()));
				//再将每个replys放入allReplys
				allReplys.add(replys);
			}
			count = csl.selectCount();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("about",about);
		model.addAttribute("lists",lists);
		model.addAttribute("allReplys",allReplys);
		model.addAttribute("count",count);
		return "gbook";
	}
	
	//ajax切换身份
	@RequestMapping("/switch.do")
	public void toSwitch(HttpSession session,HttpServletResponse response) throws IOException {
		session.removeAttribute("name");
		session.removeAttribute("email");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("发表我的评论");
		out.flush();
		out.close();
	}
	
	//前台通过ajax提交评论信息，后台存储并且返回部分信息
	@RequestMapping("/sendcomment.do")
	public void toSendComment(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String name = request.getParameter("author");
		String email = request.getParameter("email");
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()); 
		String comment = request.getParameter("comment");
		
		String id = new SimpleDateFormat("yyyyMMdd").format(new Date());
		String pre = "0";
		int next = 0;
		String pre_name = "0";

		try {
			//id赋值(后四位)
			int count = csl.selectCountByTime(id);
			id = id + "0001";
			if(count != 0) {
				id = String.valueOf((Long.parseLong(id) + count));
			}
			//pre和pre_name以及next修改
			if(request.getParameter("pre")!=null&&request.getParameter("pre_name")!=null) {
				pre = request.getParameter("pre");
				pre_name = request.getParameter("pre_name");
			}
			//将回复存入数据库
			Comment c = new Comment(name, email, time, comment, id, pre, next, pre_name);
			csl.insert(c);
			
			//向前台输出信息(将Comment c变为JSON对象以便于提交给前台，向前台输出一个JSON对象——即刚发布的comment。)
			response.setContentType("text/html;charset=utf-8");
			JSONObject json = new JSONObject(c);
			//如果是回复查询一下是哪条评论底下的回复。
			String reply_name = "0";
			if(pre != "0") {
				reply_name = csl.selectByid(pre).getName(); 
				if(reply_name.equals(pre_name)) {
					reply_name = "0";
				}else {
					reply_name = pre_name;
				}
			}
			json.append("reply_name", reply_name);
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("name", name);
		session.setAttribute("email", email);
	}
	
	//以下两个测试ajax
	@RequestMapping("/test.do")
	public String toTest(Model model) {
		return "test";
	}
	@RequestMapping("/sendtest.do")
	public void toSendTest(Model model,HttpServletResponse res,HttpServletRequest request) throws IOException {
		res.setContentType("text/html;charset=utf-8");
		/*String name = request.getParameter("name");
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String info = request.getParameter("info");
		
		System.out.println("+++++++++++++++++++++++name:" + name);
		System.out.println("++++++++++++++++++++++++age:" + age);
		System.out.println("++++++++++++++++++++++++sex:" + sex);
		System.out.println("+++++++++++++++++++++++info:" + info);*/
		
		//接收到前端传来的josn字符串
		String json = request.getParameter("jsoninfo");
		String info = request.getParameter("info");
		System.out.println(json);
		System.out.println(info);
		//将json字符串转换成json对象
		JSONObject obj = new JSONObject(json);
		System.out.println(obj.get("name"));
		
		PrintWriter out = res.getWriter();
		out.print(obj);
		out.flush();
		out.close();
	}
	/*@RequestMapping("/publish.do")
	public String toPublish_comment(Model model,HttpServletRequest request,HttpSession session) {
		String name = request.getParameter("author");
		String email = request.getParameter("email");
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()); 
		String comment = request.getParameter("comment");
		
		String id = new SimpleDateFormat("yyyyMMdd").format(new Date());
		String pre = "0";
		int next = 0;
		String pre_name = "0";
		
		try {
			//id赋值(后四位)
			int count = csl.selectCountByTime(id);
			id = id + "0001";
			if(count != 0) {
				id = String.valueOf((Long.parseLong(id) + count));
			}
			//pre和pre_name以及next修改
			if(request.getParameter("pre")!=null&&request.getParameter("pre_name")!=null) {
				pre = request.getParameter("pre");
				pre_name = request.getParameter("pre_name");
			}
			//将回复存入数据库
			Comment c = new Comment(name, email, time, comment, id, pre, next, pre_name);
			csl.insert(c);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("name", name);
		session.setAttribute("email", email);
		return "redirect:/gbook.do";
	}*/
}
