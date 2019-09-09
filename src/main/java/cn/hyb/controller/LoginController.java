package cn.hyb.controller;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.hyb.netpojo.User;
import cn.hyb.pojo.XbUser;
import cn.hyb.service.CookieService;
import cn.hyb.service.LoginService;

@Controller
public class LoginController {
	
	@Resource
	private LoginService loginServiceImpl;
	@Resource
	private CookieService cookieServiceImpl;
	
	@RequestMapping("/login/checkuser")
	public String Login(Integer remember,String username,String password,HttpServletRequest req,String code,HttpServletResponse resp) {
		XbUser user=new XbUser();
		HttpSession session = req.getSession();
		user.setPassword(password);
		user.setUsername(username);
		if(session.getAttribute("code")==null) {
			session.setAttribute("action", "errorcode");
			return "redirect:/login";
		}
		String codeSession = session.getAttribute("code").toString();
		if(codeSession.equals(code)){
			if(user!=null) {
				User userBean = loginServiceImpl.selUserInfo(user);
				System.out.println("Login中userbean:"+userBean);
				if(userBean!=null) {
					//七天免登陆
					if(remember!=null) {
						String uuid = cookieServiceImpl.insUuidForCookie(userBean);
						Cookie c=new Cookie("x66", uuid);
						c.setMaxAge(7*24*3600);
						c.setPath("/");
						resp.addCookie(c);
						System.out.println(userBean.getUsername()+"cookie信息："+uuid);
					}
					session.removeAttribute("NuN");
					
					System.out.println(userBean);
					session.setAttribute("user", userBean);
					session.setAttribute("action", "success");
					return "redirect:/main";
				}
			}
			session.setAttribute("action", "errorlogin");
			return "redirect:/login";
		}else{
			session.setAttribute("action", "errorcode");
			return "redirect:/login";
		}
	}
	
	@RequestMapping("/cancellation")
	public String Cancellation(HttpSession session,HttpServletResponse resp) {
		session.setAttribute("NuN","1");
		session.removeAttribute("user");
		Cookie newCookie=new Cookie("x66",null); //假如要删除名称为username的Cookie
		newCookie.setMaxAge(0); //立即删除型
		newCookie.setPath("/"); //项目所有目录均有效，这句很关键，否则不敢保证删除
		resp.addCookie(newCookie); //重新写入，将覆盖之前的
		return "redirect:/";
	}

}
