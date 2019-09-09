package cn.hyb.service;

import cn.hyb.pojo.XbUser;

public interface RegService {
	/**
	 * 根据用户名密码注册
	 * @param user
	 * @return 0表失败 1表成功
	 */
	int regUser(XbUser user);
	
	/**
	 * 查询注册的用户名是否重复，用于Ajax校验,以及注册用户的二次校验
	 * @param username
	 * @return  大于0表示重复
	 */
	int UserCheck(String username);
}
