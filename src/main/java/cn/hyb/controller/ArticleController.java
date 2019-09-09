package cn.hyb.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.hyb.netpojo.User;
import cn.hyb.pojo.XbArticle;
import cn.hyb.pojo.XbUser;
import cn.hyb.service.ArticleService;
import cn.hyb.service.UserService;

@Controller
public class ArticleController {
	@Resource
	private ArticleService articleServiceImpl;
	@Resource
	private UserService userServiceImpl;
	
	
	@RequestMapping({"/article/all"})
	public String article(String action,HttpServletRequest req,Integer id) {
		///article/alter?action=all -->显示所有能修改的文章
		///article/alter?action=alter -->修改文章页
		HttpSession session = req.getSession();
//		//测试用：↓
		User ubean=null;
		try {
			ubean=(User)(session.getAttribute("user"));
		} catch (Exception e) {
			System.out.println("强转出错");
		}
		XbUser user=null;
		if(ubean!=null) {
			user=new XbUser();
			user.setId(ubean.getId());
			user.setPassword(ubean.getPassword());
			user.setUsername(ubean.getUsername());
		}
//		//End--测试用↑
		if(action==null) {
			System.out.println("未指定动作");
			session.setAttribute("error", "未指定动作");
			return "redirect:/";
		}
		if(user==null) {
			System.out.println("没用户信息");
			session.setAttribute("error", "没用户信息");
			return "redirect:/";
		}
		if(userServiceImpl.selUserRole(user)<6) {
			System.out.println("用户权限不足");
			session.setAttribute("error", "用户权限不足");
			return "redirect:/";
		}
		if(action.equals("all")) {
			//返回一个能显示所有文章的页面
			session.setAttribute("articlelist", articleServiceImpl.selAll());
			return "redirect:/allarticle.jsp";			
		}else if(action.equals("alter")) {
			//点击已有文章的修改后即进入修改页
			XbArticle article = articleServiceImpl.selOne(id);
			session.setAttribute("article",article);
			return "redirect:/textedit.jsp";
			
		}else if(action.equals("insert")) {
			//点击新增文章即进入新空白文章
			XbArticle article = articleServiceImpl.selOne(0);
			article.setEx(1);
			session.setAttribute("article",article);
			return "redirect:/textedit.jsp";
			
		}else if(action.equals("hide")) {
			//点击隐藏此文章
			articleServiceImpl.hide(id);
			return "redirect:/allarticle.jsp";
		}
		
		return "redirect:/";
	}
	
	@RequestMapping({"/article/alter"})
	public String alter(HttpServletRequest req,XbArticle article) {
		if(article==null) {
			System.out.println("文章为空/未接收到对象");
			return "redirect:/allarticle.jsp";
		}
		System.out.println(article);
		HttpSession session = req.getSession();
		User ubean=null;
		try {
			ubean=(User)(session.getAttribute("user"));
		} catch (Exception e) {
			System.out.println("强转出错");
		}
		XbUser user=null;
		if(ubean!=null) {
			user=new XbUser();
			user.setId(ubean.getId());
			user.setPassword(ubean.getPassword());
			user.setUsername(ubean.getUsername());
		}
		if(userServiceImpl.selUserRole(user)<6) {
			System.out.println("用户权限不足");
			session.setAttribute("error", "用户权限不足");
			return "redirect:/";
		}
		//修改文章 并返回文章
		if(article.getId()==0) {
			//新增的文章
			articleServiceImpl.insert(article);
		}else {
			//修改的文章
			articleServiceImpl.alter(article);
		}
		return "redirect:/article/all?action=all";
	}
}
