package cn.hyb.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.hyb.netpojo.RoomBean;
import cn.hyb.netpojo.User;
import cn.hyb.service.CookieService;
import cn.hyb.service.RoomBeanService;

@Controller
public class RoomController {
	@Resource
	private RoomBeanService roomBeanServiceImpl;
	@Resource
	private CookieService cookieServiceImpl;
	/**
	 * 用于Ajax加载页面
	 * @param req
	 * @return
	 */
	@RequestMapping("/room")
	@ResponseBody
	public RoomBean room(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		cookieServiceImpl.cheakLoginInfo(req, resp, session);
		if(session.getAttribute("user")==null) {
			return null;
		}
		User user=null;
		try {
			user=(User)(session.getAttribute("user"));
		} catch (Exception e) {
			System.out.println("强转失败");
			return null;
		}
		RoomBean roombean = roomBeanServiceImpl.assembleRoomBean(user);
		System.out.println(roombean);
		return roombean;
	}
	
	@RequestMapping({"/myroom","/myroom/"})
	public String myroom(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		cookieServiceImpl.cheakLoginInfo(req, resp, session);
		if(session.getAttribute("user")==null) {
			return "redirect:/";
		}
		return "forward:/myroom.jsp";
	}
	
}















