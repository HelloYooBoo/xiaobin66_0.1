package cn.hyb.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.hyb.netpojo.ArticleCard;
import cn.hyb.netpojo.User;
import cn.hyb.pojo.XbArticle;
import cn.hyb.service.CookieService;
import cn.hyb.service.ReadService;

@Controller
public class ReadController {
	@Resource
	private ReadService readServiceImpl;
	
	@Resource
	private CookieService cookieServiceImpl;
	
	
	@RequestMapping("/read/{articleId}")
	public String showRead(@PathVariable Integer articleId,Integer reply,HttpServletRequest req,HttpServletResponse resp) {
		HttpSession session = req.getSession();
		cookieServiceImpl.cheakLoginInfo(req, resp, session);
		if(articleId==null) {
			return "forward:/no404.jsp";
		}
		try {
			ArticleCard onRead = readServiceImpl.selOneById(articleId);
			if(onRead==null) {
				return "forward:/no404.jsp";
			}
			if(session.getAttribute("user")==null) {
				readServiceImpl.updVisit(articleId, 0);
				
			}else {
				User user=(User)(session.getAttribute("user"));
				readServiceImpl.updVisit(articleId, user.getId());
			}
			session.setAttribute("onRead", onRead);
			req.setAttribute("reply", reply);
			
			//不加/就会跳转到/read/read.jsp
			return "forward:/read.jsp";
			
		} catch (Exception e) {
			System.out.println("获取read出错了。。");
		}
		
		return "forward:/no404.jsp";
		//redirect
	}
	
	@RequestMapping("/sidebar")
	@ResponseBody
	public List<XbArticle> sidebar(String wq){
		if(wq==null)return null;
		
		if(wq.equals("newest")) {
			List<XbArticle> newest = readServiceImpl.selNewest();
			return newest;
		}else if(wq.equals("hotest")) {
			List<XbArticle> hotest = readServiceImpl.selHotest();
			return hotest;
		}else if(wq.equals("focus")) {
			
		}
		return null;
	}

	/**
	 * 返回0表示点赞失败，1表示成功，2表示未登录
	 * @param articleId
	 * @param session
	 * @return
	 */
	@RequestMapping("/agreeforarticle")
	@ResponseBody
	public Integer agreeArticle(Integer articleId,HttpSession session) {
		if(session.getAttribute("user")==null) {
			return 2;
		}
		User user=(User)(session.getAttribute("user"));
		int updAgree = readServiceImpl.updAgreeForArticle(articleId, user.getId());
		return updAgree;
	}
	
	/**
	 * 返回0表示点赞失败，1表示成功，2表示未登录
	 * @param articleId
	 * @param session
	 * @return
	 */
	@RequestMapping("/agreeforcomment")
	@ResponseBody
	public Integer agreeComment(Integer commentId,HttpSession session) {
		if(session.getAttribute("user")==null) {
			return 2;
		}
		User user=(User)(session.getAttribute("user"));
		int updAgree = readServiceImpl.updAgreeForComment(commentId, user.getId());
		return updAgree;
	}
	
	/**
	 * 返回0表示失败，返回1表示新增收藏成功，返回2表示删除收藏成功， 返回3表示未登录
	 * @param articleId
	 * @param session
	 * @return
	 */
	@RequestMapping("/collect")
	@ResponseBody
	public Integer collect(Integer articleId,HttpSession session) {
		if(session.getAttribute("user")==null) {
			return 3;
		}
		User user=(User)(session.getAttribute("user"));
		//取消(删除)
		int updCollect = readServiceImpl.updCollect(articleId, user.getId());
		return updCollect;
	}
	
	/**
	 * 返回0：未收藏  |  返回1：收藏
	 * @param articleId
	 * @param session
	 * @return
	 */
	@RequestMapping("/iscollect")
	@ResponseBody
	public Integer isCollect(Integer articleId,HttpSession session){
		if(session.getAttribute("user")==null) {
			return 0;
		}
		User user=(User)(session.getAttribute("user"));
		int selIsCollect = readServiceImpl.selIsCollect(articleId, user.getId());
		return selIsCollect;
	}
	
	/**
	 * 返回用户所有点赞过的评论
	 * @return
	 */
	@RequestMapping("/isagreeforcomment")
	@ResponseBody
	public List<Integer> isAgreeForComment(HttpSession session){
		if(session.getAttribute("user")==null) {
			return null;
		}
		User user=(User)(session.getAttribute("user"));
		List<Integer> selIsAgreeForComment = readServiceImpl.selIsAgreeForComment(user.getId());
		return selIsAgreeForComment;
	}
	
	/**
	 * 返回用户所有点赞过的文章，
	 * 主页：返回文章id的list
	 * 文章页：返回size=1则点赞，0未点赞
	 * @return
	 */
	@RequestMapping("/isagreeforarticle")
	@ResponseBody
	public List<Integer> isAgreeForArticle(Integer articleId,HttpSession session){
		if(session.getAttribute("user")==null) {
			return null;
		}
		User user=(User)(session.getAttribute("user"));
		List<Integer> selIsAgreeForArticle = readServiceImpl.selIsAgreeForArticle(articleId,user.getId());
		return selIsAgreeForArticle;
	}
}
