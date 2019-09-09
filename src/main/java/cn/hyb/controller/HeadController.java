package cn.hyb.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.hyb.netpojo.ArticleCard;
import cn.hyb.netpojo.User;
import cn.hyb.pojo.XbUser;
import cn.hyb.service.ArticleCardService;
import cn.hyb.service.CookieService;

@Controller
public class HeadController {

	@Resource
	private ArticleCardService articleCardServiceImpl;
	@Resource
	private CookieService cookieServiceImpl;

	@RequestMapping({ "/register", "/register/" })
	public String register(HttpServletRequest req) {
		return "forward:/reg.jsp";
	}

	@RequestMapping({ "/login", "login" })
	public String login(HttpServletRequest req) {
		return "forward:/login.jsp";
	}

	@RequestMapping({ "/main", "/" })
	public String main(HttpServletRequest req,HttpServletResponse resp,HttpSession session) {
		cookieServiceImpl.cheakLoginInfo(req, resp, session);
		return "forward:main.jsp";
	}

	@RequestMapping("/mainarticle")
	@ResponseBody
	public List<ArticleCard> mainarticle() {
		List<ArticleCard> articleList = articleCardServiceImpl.selAllArticleCard();

		return articleList;
	}
}
