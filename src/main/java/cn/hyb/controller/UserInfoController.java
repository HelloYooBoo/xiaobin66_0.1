package cn.hyb.controller;

import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.hyb.netpojo.User;
import cn.hyb.service.UserInfoService;

@Controller
public class UserInfoController {
	
	@Resource
	private UserInfoService userInfoServiceImpl;
	
	/**
	 * 只返回success或fail或者url
	 * 参数：
	 * MultipartFile headpic 	头像
	 * String password			密码
	 * String nickname			昵称
	 * String birthday			生日
	 * String email				邮箱
	 * String introduction 		简介
	 */
	@RequestMapping({"/userInfoAlter"})
	@ResponseBody
	public String userInfoAlter(
			String password,String nickname,String birthday,String email,
			String introduction,HttpSession session) {
		System.out.println("收到的请求：password:"+password
				+";nickname:"+nickname+";birthday:"+birthday+";email:"+email+";introduction:"+introduction);
		if(session.getAttribute("user")==null) {
			return null;
		}
		User user=(User)(session.getAttribute("user"));
		if(password!=null) {
			int index = userInfoServiceImpl.updPassword(password, user);
			if(index>0) {
				return "success";
			}
		}else if(nickname!=null) {
			int index = userInfoServiceImpl.updNickname(nickname, user);
			if(index>0) {
				return "success";
			}
		}else if(birthday!=null) {
			int index = userInfoServiceImpl.updBirthday(birthday, user);
			if(index>0) {
				return "success";
			}
		}else if(email!=null) {
			int index = userInfoServiceImpl.updEmail(email, user);
			if(index>0) {
				return "success";
			}
		}else if(introduction!=null) {
			int index = userInfoServiceImpl.updIntroduction(introduction, user);
			if(index>0) {
				return "success";
			}
		}
		return "fail";
	}

	@RequestMapping({"/userheadpix"})
	@ResponseBody
	public String userheadpic(MultipartFile headpic,HttpSession session) {
		if(headpic!=null) {
			//头像上传，并返回头像url
			if(session.getAttribute("user")==null) {
				return null;
			}
			User user=(User)(session.getAttribute("user"));
			String url=null;
			try {
				url = userInfoServiceImpl.uplord(headpic, user);
			} catch (IOException e) {
				System.out.println("头像上传失败");
				e.printStackTrace();
			}
			return url;
		}
		return null;
	}
	
	@RequestMapping({"/articlepix"})
	@ResponseBody
	public String articlepix(MultipartFile articlepic,HttpSession session) {
		if(articlepic!=null) {
			//头像上传，并返回头像url
			String url=null;
			try {
				url = userInfoServiceImpl.insArticlePic(articlepic);
			} catch (IOException e) {
				System.out.println("头像上传失败");
				e.printStackTrace();
			}
			return url;
		}
		return null;
	}
}
