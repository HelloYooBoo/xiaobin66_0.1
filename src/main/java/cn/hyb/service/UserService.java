package cn.hyb.service;

import cn.hyb.pojo.XbUser;

public interface UserService {
	/**
	 * 根据session中user的role id获取用户的角色，用于进行权限判断（6、7才具有修改文章权力）
	 * @param user
	 * @return
	 */
	int selUserRole(XbUser user);
}
