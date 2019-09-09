package cn.hyb.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.hyb.netpojo.ArticleCard;
import cn.hyb.netpojo.Comment;
import cn.hyb.netpojo.User;
import cn.hyb.pojo.XbComment;
import cn.hyb.pojo.XbUser;
import cn.hyb.service.CommentService;
import cn.hyb.service.CookieService;

@Controller
public class CommentController {
	@Resource
	private CommentService commentServiceImpl;
	@Resource
	private CookieService cookieServiceImpl;
	
	@RequestMapping("/comment/user")
	@ResponseBody
	public String commentUserInfo(HttpSession session) {
		return session.getAttribute("user")==null?"no":"yes";
	}
	
	@RequestMapping("/comment/del")
	@ResponseBody
	public Integer commentDel(Integer commentId,HttpSession session,HttpServletRequest req,HttpServletResponse resp) {
		cookieServiceImpl.cheakLoginInfo(req, resp, session);
		User u=null;
		if(commentId==null) {
			return null;
		}
		try {
			u=(User)(session.getAttribute("user"));
		} catch (Exception e) {
			System.out.println("commentDel:user空");
			return null;
		}
		if(u!=null) {
			int index = commentServiceImpl.delComment(commentId, u.getId());
			return index;
		}
		return null;
	}
	
	@RequestMapping("/comment")
	@ResponseBody
	public List<Comment> comment(String commentText ,Integer commentId,Integer parentId,HttpServletRequest req,HttpServletResponse resp){
		cookieServiceImpl.cheakLoginInfo(req, resp, req.getSession());
		HttpSession session = req.getSession();
		Object onRead = session.getAttribute("onRead");
		Object user = session.getAttribute("user");
		if(onRead==null) {
			session.setAttribute("error", "没有文章信息");
			try {
				System.out.println("????");
				resp.sendRedirect("/");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
			return null;
		}
		ArticleCard articleCard=null;
		User userInfo=null;
		try {
			articleCard = (ArticleCard) onRead;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("强转出错！！");
			return null;
		}
		if(user!=null) {
			try {
				userInfo = (User) user;
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("强转出错！！");
				return null;
			}
			
			if(commentText!=null&&!commentText.trim().equals("")) {
				//把评论上传
				XbComment commentInfo=new XbComment();
				commentInfo.setArticleId(articleCard.getId());
				commentInfo.setCommentId(commentId);
				commentInfo.setParentId(parentId);
				commentInfo.setPasserId(userInfo.getId());
				commentInfo.setSendtime(new Date());
				
				commentInfo.setWords(commentText);
				int index = commentServiceImpl.insComment(commentInfo);
				System.out.println("上传"+(index==0?"失败":"成功"));
			}
		}
		//查询全部评论并返回
		List<Comment> allComment = commentServiceImpl.selAllComment(articleCard.getId());
		return allComment;
	}
}
