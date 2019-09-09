package cn.hyb.controller;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.hyb.pojo.XbUser;
import cn.hyb.service.RegService;

@Controller
public class RegController {
	@Resource
	private RegService regServiceImpl;
	
	@RequestMapping("/register/reguser")
	public String RegNewUser(String username,String password,HttpServletRequest req,@RequestParam(defaultValue="") String code) {
		System.out.println(req.getSession().getAttribute("code"));
		if(req.getSession().getAttribute("code")==null) {
			return "redirect:/register?action=errorcode";
		}
		String codeSession = req.getSession().getAttribute("code").toString();
		if(codeSession.equals(code)){
			XbUser user = new XbUser();
			user.setUsername(username);
			user.setPassword(password);
			int index=regServiceImpl.regUser(user);
			if(index>0) {
				req.getSession().setAttribute("action", "regsuccess");
				return "redirect:/login";
			}else {
				req.getSession().setAttribute("action", "regfail");
				return "redirect:/register";
			}
		}else{
			req.getSession().setAttribute("action", "codeerror");
			return "redirect:/register";
		}
	}
	
	@RequestMapping(value="/register/usercheckname")
	@ResponseBody
	public int RegUserCheck(@RequestParam(defaultValue="") String username,HttpServletRequest req) {
		try {
			username = new String(username.getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		System.out.println(req.getParameter("username"));//乱码：å¼ ä¸
//		System.out.println(username);//正常：张三
		if(username.equals("")) {
			return 1;
		}
		return regServiceImpl.UserCheck(username);
	}

}
