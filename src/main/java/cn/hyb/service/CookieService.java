package cn.hyb.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.hyb.netpojo.User;

public interface CookieService {
	
	String insUuidForCookie(User user);
	
	User selUuidGetUserBean(String uuid);
	
	void cheakLoginInfo(HttpServletRequest req,HttpServletResponse resp,HttpSession session);

}
