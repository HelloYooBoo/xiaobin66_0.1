package cn.hyb.service.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import cn.hyb.mapper.XbPasserMapper;
import cn.hyb.mapper.XbUserMapper;
import cn.hyb.netpojo.User;
import cn.hyb.pojo.XbPasser;
import cn.hyb.pojo.XbPasserExample;
import cn.hyb.pojo.XbUser;
import cn.hyb.service.CookieService;
import cn.hyb.service.LoginService;
@Service
public class CookieServiceImpl implements CookieService {

	@Resource
	private XbPasserMapper xbPasserMapper;
	@Resource
	private XbUserMapper xbUserMapper;
	@Resource
	private LoginService loginServiceImpl;
	
	@Override
	public String insUuidForCookie(User user) {
		XbPasser selectByPrimaryKey = xbPasserMapper.selectByPrimaryKey(user.getId());
		XbPasser passer=new XbPasser();
		passer.setId(user.getId());
		passer.setUuid(UUID.randomUUID().toString());
		if(selectByPrimaryKey!=null) {
			int update = xbPasserMapper.updateByPrimaryKey(passer);
			return update>0?passer.getUuid():null;
		}else {
			int insert = xbPasserMapper.insert(passer);
			return insert>0?passer.getUuid():null;
		}
	}

	@Override
	public User selUuidGetUserBean(String uuid) {
		if(uuid==null) {
			return null;
		}
		XbPasserExample example =new XbPasserExample();
		example.createCriteria().andUuidEqualTo(uuid);
		List<XbPasser> selectByExample = xbPasserMapper.selectByExample(example);
		if(selectByExample.size()>0) {
			XbPasser xbPasser = selectByExample.get(0);
			XbUser xbuser = xbUserMapper.selectByPrimaryKey(xbPasser.getId());
			User userBean = loginServiceImpl.selUserInfo(xbuser);
			return userBean;
		}
		return null;
	}

	@Override
	public void cheakLoginInfo(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		if (session.getAttribute("user") == null && session.getAttribute("NuN") == null) {
			System.out.println("走！");
			// 获取Cookie信息
			Cookie[] cks = req.getCookies();
			boolean flag=true;
			if (cks != null) {
				for (Cookie c : cks) {
					String name = c.getName();
					String value = c.getValue();
					if ("x66".equals(name)) {
						User userBean = selUuidGetUserBean(value);
						if (userBean != null) {
							System.out.println("CookieService中："+userBean);
							session.setAttribute("user", userBean);
							System.out.println(userBean.getUsername()+"cookie信息："+value);
							flag=false;
							//重置cookie时间
							c.setMaxAge(7*24*3600);
							c.setPath("/");
							resp.addCookie(c);
						}
						break;
					}
				}
			}
			if(flag) {
				session.setAttribute("NuN", "1");
			}
		}
		
	}

}
