package cn.hyb.service;

import cn.hyb.netpojo.User;
import cn.hyb.pojo.XbUser;

public interface LoginService {
	/**
	 * 查询是否存在此用户
	 * @param user
	 * @return
	 */
	int selUserForLogin(XbUser user);
	
	/**
	 * 查询出所有与此用户有关的信息
	 */
	User selUserInfo(XbUser user);
	
}
